package com.pokedex.service;

import com.pokedex.model.CaughtPokemon;
import com.pokedex.repository.CaughtPokemonRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;

// =============================================================
//  CatchService.java — Business Logic Layer
// =============================================================
//
//  WHAT THIS FILE IS:
//  Handles all caught Pokémon logic.
//  Sits between CatchController and CaughtPokemonRepository.
//  Same layered pattern as PokemonService — controller calls
//  service, service calls repository, service returns data.
//
//  WHY A SEPARATE SERVICE FROM PokemonService?
//  Single Responsibility Principle — each service has one job:
//    PokemonService  → query and filter Pokémon data
//    CatchService    → manage caught status for a user
//  When you add multi-user and multi-game support later,
//  you only touch this file — PokemonService stays clean.
//
//  CONSTANTS:
//  DEFAULT_USER_ID = 1
//    → hardcoded single user for now
//    → later: comes from authentication token
//
//  DEFAULT_GAME = "HOME"
//    → hardcoded game for now
//    → later: passed in from the frontend as a parameter
//    → will allow tracking catches per game (Sword, Scarlet, etc.)
//
//  THREE METHODS TO IMPLEMENT:
//
//  1. getCaughtIds()
//     Called once on page load by the frontend.
//     Returns all pokemon IDs the user has caught in HOME.
//     Just delegates to the repository — no transformation needed.
//
//  2. toggleCaught(Long pokemonId)
//     The core logic method.
//     Check if the Pokémon is already caught:
//       YES → delete the record → return false (now uncaught)
//       NO  → create and save a new record → return true (now caught)
//     Returns boolean so the frontend knows the new state
//     and can update the UI without refetching.
//
//  3. getCaughtCount()
//     Returns how many Pokémon the user has caught in HOME.
//     Useful for showing a progress counter on the UI later.
// =============================================================

@Service
@Transactional
public class CatchService {

    // Hardcoded for now — will become dynamic parameters later
    // when multi-user authentication and multi-game support is added
    private static final Integer DEFAULT_USER_ID = 1;
    private static final String DEFAULT_GAME = "HOME";


    private final CaughtPokemonRepository caughtPokemonRepository;

    public CatchService(CaughtPokemonRepository caughtPokemonRepository) {
        this.caughtPokemonRepository = caughtPokemonRepository;
    }


    @Transactional(readOnly = true)
    public List<Long> getCaughtIds(String game) {
        return caughtPokemonRepository.findCaughtIdsByUserAndGame(
                DEFAULT_USER_ID, game);
    }


    public boolean toggleCaught(Long pokemonId, String game) {
        Optional<CaughtPokemon> existing = caughtPokemonRepository
                .findByUserIdAndGameAndPokemonId(DEFAULT_USER_ID, game, pokemonId);

        if (existing.isPresent()) {
            // Row exists — flip the is_caught boolean
            CaughtPokemon caught = existing.get();
            boolean newState = !caught.getIsCaught();
            caught.setIsCaught(newState);
            caughtPokemonRepository.save(caught);
            return newState;
        }

        // Row doesn't exist yet — insert with is_caught = true
        CaughtPokemon caught = new CaughtPokemon();
        caught.setPokemonId(pokemonId);
        caught.setIsCaught(true);
        caught.setGame(game);
        caughtPokemonRepository.save(caught);
        return true;
    }


    @Transactional(readOnly = true)
    public long getCaughtCount(String game) {
        return caughtPokemonRepository.countByUserIdAndGame(DEFAULT_USER_ID, game);
        // return 0;
    }
}
