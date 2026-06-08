package com.pokedex.repository;

import com.pokedex.model.CaughtPokemon;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

// =============================================================
//  CaughtPokemonRepository.java — Data Access Layer
// =============================================================
//
//  WHAT THIS FILE IS:
//  Talks directly to the caught_pokemon table.
//  Same pattern as PokemonRepository — extends JpaRepository
//  so you get save(), delete(), findById() etc. for free.
//
//  NEW CONCEPT — JPQL vs Native SQL:
//  So far you've used nativeQuery = true to write raw SQL.
//  JPQL (Java Persistence Query Language) is an alternative
//  that uses your Java class and field names instead of
//  table and column names. Spring translates it to SQL.
//
//  JPQL example:
//    "SELECT c.pokemonId FROM CaughtPokemon c WHERE c.userId = :userId"
//    ↑ uses Java class name         ↑ uses Java field name
//
//  Native SQL equivalent:
//    "SELECT pokemon_id FROM caught_pokemon WHERE user_id = :userId"
//    ↑ uses DB table name           ↑ uses DB column name
//
//  Use JPQL for Query 1 since it's simpler and doesn't need
//  nativeQuery = true.
//
//  THREE METHODS:
//
//  QUERY 1 — findCaughtIdsByUserAndGame
//  Returns just the pokemon_id values, not full entities.
//  This keeps the payload small — we only need IDs to build
//  the caught Set on the frontend.
//  Use @Query with JPQL:
//    "SELECT c.pokemonId FROM CaughtPokemon c
//     WHERE c.userId = :userId AND c.game = :game"
//  Return type: List<Long>
//
//  QUERY 2 — findByUserIdAndGameAndPokemonId
//  Derived query — Spring generates SQL from the method name.
//  Used in toggleCaught() to check if a Pokémon is already caught.
//  Returns Optional<CaughtPokemon> since the row may not exist.
//  No @Query needed — just the method signature.
//
//  QUERY 3 — countByUserIdAndGame
//  Derived query — Spring generates SQL from the method name.
//  Returns long (the count of caught Pokémon for a user+game).
//  No @Query needed — just the method signature.
// =============================================================

@Repository
public interface CaughtPokemonRepository extends JpaRepository<CaughtPokemon, Long> {

        long countByUserIdAndGameAndIsCaughtTrue(Integer userId, String game);

        // Get all caught IDs for a user+game ───────────

        @Query(value = """
                        select c.pokemonId from CaughtPokemon c where c.userId = :userId and c.game = :game AND c.isCaught = true
                        """)
        List<Long> findCaughtIdsByUserAndGame(
                        @Param("userId") Integer userId,
                        @Param("game") String game);

        // Find a specific caught record ────────────────
        // The method name pattern:
        // findBy + UserId + And + Game + And + PokemonId
        // Spring reads this and generates:
        // WHERE user_id = ? AND game = ? AND pokemon_id = ?
        // Returns Optional because the record might not exist.
        // Used in toggleCaught() to check if already caught.
        // @Query(value = """
        // select c.pokemonId from CaughtPokemon c where c.userId = UserId and c.game =
        // game and c.pokemonId = pokemonId"""
        // )
        Optional<CaughtPokemon> findByUserIdAndGameAndPokemonId(
                        Integer userId,
                        String game,
                        Long pokemonId);

        // Count caught for a user+game ─────────────────
        // Returns long (primitive, not Long) since count is never null.
        @Query("SELECT COUNT(c) FROM CaughtPokemon c WHERE c.userId = :userId AND c.game = :game AND c.isCaught = true")
        long countByUserIdAndGame(
                        @Param("userId") Integer userId,
                        @Param("game") String game);
}
