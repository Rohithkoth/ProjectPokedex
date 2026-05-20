package com.pokedex.repository;

import com.pokedex.model.Pokemon;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

// =============================================================
//  PokemonRepository.java  — Data Access Layer
// =============================================================
//
//  WHAT THIS FILE IS:
//  The only layer that talks directly to the database.
//  By extending JpaRepository, Spring Data generates all the
//  boilerplate SQL for common operations automatically.
//
//  YOU GET THESE METHODS FOR FREE (no code needed):
//    findAll()           → SELECT * FROM pokemon
//    findById(Long id)   → SELECT * FROM pokemon WHERE id = ?
//    count()             → SELECT COUNT(*) FROM pokemon
//    existsById(Long id) → SELECT EXISTS(...)
//    save(Pokemon p)     → INSERT or UPDATE
//    deleteById(Long id) → DELETE
//
//  TWO TYPES OF QUERIES YOU'LL WRITE:
//
//  1. DERIVED QUERIES — Spring reads the method name and generates
//     the SQL automatically. No @Query annotation needed.
//     Rule: findBy + FieldName + [Condition]
//     Examples:
//       findBySlug(String slug)       → WHERE slug = ?
//       findByGeneration(Integer gen) → WHERE generation = ?
//       findByIsLegendaryTrue()       → WHERE is_legendary = true
//
//  2. NATIVE QUERIES — You write the SQL yourself using @Query.
//     Required for cases where derived queries can't express the
//     logic — like checking two columns with OR, or querying JSONB.
//     nativeQuery = true means use real SQL, not JPQL.
//
//  V3 SCHEMA REMINDER:
//  We switched from TEXT[] arrays to flat columns.
//  The relevant columns are now:
//    type1       TEXT  NOT NULL   ← primary type e.g. "fire"
//    type2       TEXT             ← secondary type, NULL if single type
//    egg_group_1 TEXT  NOT NULL
//    egg_group_2 TEXT
//    gender_1    TEXT  NOT NULL
//    gender_2    TEXT
//  This means NO more ANY() operator for type queries.
//  Type filtering is now simple equality: type1 = :type OR type2 = :type
// =============================================================

@Repository
public interface PokemonRepository extends JpaRepository<Pokemon, Long> {

        // ── Derived Queries (no SQL needed) ───────────────────────
        // Spring generates these automatically from the method name.
        // These have not changed from the original skeleton.

        // Finds one Pokémon by its slug. Returns Optional because it
        // might not exist — the service layer handles the not-found case.
        Optional<Pokemon> findBySlug(String slug);

        // Finds all Pokémon from a specific generation.
        List<Pokemon> findByGeneration(Integer generation);

        // Finds only base forms (form_id = 0).
        // Call with: findByFormId(0)
        List<Pokemon> findByFormId(Integer formId);

        // Boolean flag derived queries.
        // "True" suffix generates: WHERE is_legendary = true
        List<Pokemon> findByIsLegendaryTrue();

        List<Pokemon> findByIsMythicalTrue();

        List<Pokemon> findByIsMegaTrue();

        List<Pokemon> findByIsParadoxTrue();

        List<Pokemon> findByHasGigantamaxTrue();

        // ── Native Queries ────────────────────

        // QUERY 1: Filter by Pokémon type
        // The SQL you need:
        // WHERE type1 = :type OR type2 = :type
        //
        // This handles both single-type Pokémon (type2 is null)
        // and dual-type Pokémon automatically.
        //
        // Example: passing "fire" returns Charmander (fire/null)
        // AND Charizard (fire/flying)
        //
        @Query(value = "SELECT * FROM pokemon WHERE type1 = :type or type2 = :type ", nativeQuery = true)
        List<Pokemon> findByType(@Param("type") String type);

        // QUERY 2: Filter by type AND generation together
        // Combine both conditions with AND:
        // WHERE (type1 = :type OR type2 = :type) AND generation = :generation
        // Note the parentheses around the type check — they are important.
        // Without them AND binds tighter than OR and the logic breaks:
        // type1 = :type OR type2 = :type AND generation = :generation
        // reads as:
        // type1 = :type OR (type2 = :type AND generation = :generation)
        // ← WRONG — would return all type1 matches regardless of generation
        //
        // Example: passing "fire", 1 returns only Gen 1 fire types.
        //
        @Query(value = "SELECT * FROM pokemon WHERE (type1 = :type or type2 = :type) and generation = :generation  ", nativeQuery = true)
        List<Pokemon> findByTypeAndGeneration(
                        @Param("type") String type,
                        @Param("generation") Integer generation);

        // QUERY 3: Filter by hidden move

        // NO CHANGE from original — hidden_moves is still a JSONB column.
        // Its structure is: { "surf": [1,2,3], "fly": [2,3,4] }
        //
        // Example: passing "surf" returns all Pokémon that can learn Surf.
        //

        // QUERY 4: The main flexible search query
        @Query(value = """
                        SELECT * FROM pokemon
                        WHERE
                            (:type IS NULL or type1 = :type or type2 = :type) and
                            (:generation is NULL or generation = :generation) and
                            (:color is NULL or color = :color) and
                            (:expGroup  is NULL or experience_group  = :expGroup) and 
                            (:hiddenMove IS NULL OR jsonb_exists(hidden_moves, :hiddenMove)) and
                            (:legendary is NULL or is_legendary  = :legendary) and 
                            (:mythical is NULL or is_mythical  = :mythical) and
                            (:mega is NULL or is_mega  = :mega) and
                            (:paradox is NULL or  is_paradox  = :paradox) and
(:baseFormOnly IS NULL OR :baseFormOnly = false OR form_id = 0)


                        ORDER BY base_id ASC, form_id ASC
                        """, nativeQuery = true)
        List<Pokemon> search(
                        @Param("type") String type,
                        @Param("generation") Integer generation,
                        @Param("color") String color,
                        @Param("expGroup") String expGroup,
                        @Param("hiddenMove") String hiddenMove,
                        @Param("legendary") Boolean legendary,
                        @Param("mythical") Boolean mythical,
                        @Param("mega") Boolean mega,
                        @Param("paradox") Boolean paradox,
                        @Param("baseFormOnly") Boolean baseFormOnly);
}

//todo: change the HM data type