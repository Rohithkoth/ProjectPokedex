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

    Optional<Pokemon> findBySlug(String slug);

    // Finds all Pokémon from a specific generation.
    List<Pokemon> findByGeneration(Integer generation);

    // Finds only base forms (form_id = 0).
    List<Pokemon> findByFormId(Integer formId);

    // Boolean flag derived queries.
    List<Pokemon> findByIsLegendaryTrue();

    List<Pokemon> findByIsMythicalTrue();

    List<Pokemon> findByIsMegaTrue();

    List<Pokemon> findByIsParadoxTrue();

    List<Pokemon> findByHasGigantamaxTrue();


    // QUERY 1: Filter by Pokémon type

    // QUERY 2: Filter by type AND generation together

    // QUERY 3: Filter by hidden move

    // QUERY 4: The main flexible search query
    @Query(value = """
                SELECT * FROM pokemon
                    WHERE
                    (:typeAnd1 IS NULL OR type1 = :typeAnd1 OR type2 = :typeAnd1) AND
                    (:typeAnd2 IS NULL OR type1 = :typeAnd2 OR type2 = :typeAnd2) AND
                    (:typeOrList IS NULL OR type1 = ANY(string_to_array(:typeOrList, ',')) OR type2 = ANY(string_to_array(:typeOrList, ','))) AND
                    (:generation IS NULL OR generation = :generation) AND
                    (:generationList IS NULL OR generation = ANY(CAST(string_to_array(:generationList, ',') AS int[])))  and
                    (:color IS NULL OR color = :color) AND
                    (:expGroup  is NULL or experience_group  = :expGroup) and
                    (:hiddenMove IS NULL OR jsonb_exists(hidden_moves, :hiddenMove)) and
                    (:legendary is NULL or is_legendary  = :legendary) and
                    (:mythical is NULL or is_mythical  = :mythical) and
                    (:mega is NULL or is_mega  = :mega) and
                    (:paradox is NULL or  is_paradox  = :paradox)
                    AND (:baseFormOnly IS NULL OR :baseFormOnly = false OR form_id = 0
                        OR form_name IN ('Alolan Form', 'Galarian Form', 'Hisuian Form', 'Paldean Form')
                        OR is_mega = true
                        OR form_name = 'Gigantamax Form')
                    AND (:excludeMega IS NULL OR :excludeMega = false OR is_mega IS NOT TRUE)
                    AND (:excludeGmax IS NULL OR :excludeGmax = false OR form_name IS NULL OR form_name != 'Gigantamax Form')
                    AND (:dexKey IS NULL OR EXISTS (
                    SELECT 1 FROM game_dex gd
                    WHERE gd.dex_key = :dexKey
                    AND gd.base_id = pokemon.base_id
                    AND gd.form_id = pokemon.form_id))
                    AND (:name IS NULL OR LOWER(name) LIKE LOWER(CONCAT('%', :name, '%')))
                                    ORDER BY base_id ASC, form_id ASC
                                    """, nativeQuery = true)
    // @Param("type") String type,
    List<Pokemon> search(
            @Param("typeAnd1") String typeAnd1,
            @Param("typeAnd2") String typeAnd2,
            @Param("typeOrList") String typeOrList,
            @Param("generation") Integer generation,
            @Param("generationList") String generationList,
            @Param("color") String color,
            @Param("expGroup") String expGroup,
            @Param("hiddenMove") String hiddenMove,
            @Param("legendary") Boolean legendary,
            @Param("mythical") Boolean mythical,
            @Param("mega") Boolean mega,
            @Param("paradox") Boolean paradox,
            @Param("baseFormOnly") Boolean baseFormOnly,
            @Param("excludeMega")  Boolean excludeMega,
            @Param("excludeGmax")  Boolean excludeGmax,
            @Param("dexKey") String dexKey,
            @Param("name") String name);
}

// todo: change the HM data type