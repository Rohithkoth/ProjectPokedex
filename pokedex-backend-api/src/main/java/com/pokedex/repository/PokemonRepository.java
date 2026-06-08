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

@Repository
public interface PokemonRepository extends JpaRepository<Pokemon, Long> {

        // ── Derived Queries───────────────────────

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

        // ── Native Queries  ────────────────────
        // QUERY 1: Filter by Pokémon type
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
        //
        // Example: passing "fire", 1 returns only Gen 1 fire types.
        //
        @Query(value = "SELECT * FROM pokemon WHERE (type1 = :type or type2 = :type) and generation = :generation  ", nativeQuery = true)
        List<Pokemon> findByTypeAndGeneration(
                        @Param("type") String type,
                        @Param("generation") Integer generation);


        // QUERY 4: The main flexible search query
        //
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