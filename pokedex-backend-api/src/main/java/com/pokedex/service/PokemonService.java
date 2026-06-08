package com.pokedex.service;

import com.pokedex.dto.PokemonDTO;
import com.pokedex.dto.PokemonSearchCriteria;
import com.pokedex.model.Pokemon;
import com.pokedex.repository.PokemonRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.stream.Collectors;

// =============================================================
//  PokemonService.java  — Business Logic Layer
// =============================================================

@Service
@Transactional
public class PokemonService {

    //  Inject the repository ────────────────────────
    //

    private final PokemonRepository pokemonRepository;

    public PokemonService(PokemonRepository pokemonRepository) {
        this.pokemonRepository = pokemonRepository;
    }

    // =========================================================
    // API 1: Get a single Pokémon by slug
    // Used by: GET /api/pokemon/{slug}
    // Returns: PokemonDTO.Detail (full data)
    // =========================================================

    //Implement getPokemonBySlug ───────────────────
    //
    @Transactional(readOnly = true)
    public PokemonDTO.Detail getPokemonBySlug(String slug) {
        Pokemon foundPokemon = pokemonRepository.findBySlug(slug)
                .orElseThrow(() -> new RuntimeException("Pokemon not found: " + slug));
        return new PokemonDTO.Detail(foundPokemon);
    }

    // =========================================================
    // API 2: Search / Filter Pokémon
    // Used by: GET /api/pokemon/search?type=fire&generation=1&...
    // Returns: List<PokemonDTO.Summary> (lightweight list)
    // =========================================================

    //Implement searchPokemon ──────────────────────
    //
    @Transactional(readOnly = true)
    public List<PokemonDTO.Summary> searchPokemon(PokemonSearchCriteria criteria) {
        String type = criteria.getType();
        Integer generation = criteria.getGeneration();
        String color = criteria.getColor();
        String experienceGroup = criteria.getExperienceGroup();
        String hiddenMove = criteria.getHiddenMove();
        Boolean legendary = criteria.getLegendary();
        Boolean mythical = criteria.getMythical();
        Boolean mega = criteria.getMega();
        Boolean paradox = criteria.getParadox();
        Boolean baseFormOnly = criteria.getBaseFormOnly();

        //call the repository search method
        List<Pokemon> pokemonList = pokemonRepository.search(
                type,
                generation,
                color,
                experienceGroup,
                hiddenMove,
                legendary,
                mythical,
                mega,
                paradox,
                baseFormOnly);

        // return null; // replace this
        return pokemonList.stream().map(PokemonDTO.Summary::new).collect(Collectors.toList());
    }
}
