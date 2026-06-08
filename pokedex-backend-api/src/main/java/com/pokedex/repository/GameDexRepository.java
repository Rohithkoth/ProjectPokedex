package com.pokedex.repository;

import com.pokedex.model.GameDex;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface GameDexRepository extends JpaRepository<GameDex, Long> {

    // Get all distinct dex keys and names with their total counts
    // Used to build the landing page grid
    @Query(value = """
            SELECT dex_key, dex_name, COUNT(*) as total_count
            FROM game_dex
            GROUP BY dex_key, dex_name
            ORDER BY MIN(id)
            """, nativeQuery = true)
    List<Object[]> findAllDexSummaries();

    // Get all pokemon for a list of dex keys, ordered by dex key order
    // then dex number within each key.
    // Returns pokemon id AND dex_key so frontend can split into sections.
    // dexKeys is passed as a comma-separated string and split in SQL.
    @Query(value = """
            SELECT p.id, gd.dex_key
            FROM game_dex gd
            JOIN pokemon p ON p.base_id = gd.base_id AND p.form_id = gd.form_id
            WHERE gd.dex_key = ANY(CAST(string_to_array(:dexKeys, ',') AS text[]))
            ORDER BY
                array_position(CAST(string_to_array(:dexKeys, ',') AS text[]), gd.dex_key),
                gd.dex_number ASC,
                gd.form_id ASC
            """, nativeQuery = true)
    List<Object[]> findPokemonWithDexKeyByDexKeys(@Param("dexKeys") String dexKeys);

    // Check if a dex key exists
    boolean existsByDexKey(String dexKey);
}
