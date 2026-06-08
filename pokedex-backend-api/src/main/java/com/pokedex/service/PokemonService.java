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
//
//  WHAT THIS FILE IS:
//  The middle layer between the controller and the repository.
//  Its job is to:
//    1. Receive calls from the controller
//    2. Call the right repository method(s) to get data
//    3. Convert the raw Pokemon entities into DTOs
//    4. Return the DTOs to the controller
// =============================================================

@Service
@Transactional
public class PokemonService {
    private final PokemonRepository pokemonRepository;

    public PokemonService(PokemonRepository pokemonRepository) {
        this.pokemonRepository = pokemonRepository;
    }

    // =========================================================
    // API 1: Get a single Pokémon by slug
    // Returns: PokemonDTO.Detail (full data)
    // =========================================================
    //
    @Transactional(readOnly = true)
    public PokemonDTO.Detail getPokemonBySlug(String slug) {
        // return null; // replace this
        Pokemon foundPokemon = pokemonRepository.findBySlug(slug)
                .orElseThrow(() -> new RuntimeException("Pokemon not found: " + slug));
        return new PokemonDTO.Detail(foundPokemon);
    }

    // =========================================================
    // API 2: Search / Filter Pokémon
    // Returns: List<PokemonDTO.Summary> (lightweight list)
    // =========================================================
    //
    //
    @Transactional(readOnly = true)
    public List<PokemonDTO.Summary> searchPokemon(PokemonSearchCriteria criteria) {
        // String type = criteria.getType();
        String typeAnd1 = criteria.getTypeAnd1();
        String typeAnd2 = criteria.getTypeAnd2();
        String typeOrList = criteria.getTypeOrList() != null
                ? String.join(",", criteria.getTypeOrList())
                : null;
        Integer generation = criteria.getGeneration();
        String generationList = criteria.getGenerationList();
        String color = criteria.getColor();
        String experienceGroup = criteria.getExperienceGroup();
        String hiddenMove = criteria.getHiddenMove();
        Boolean legendary = criteria.getLegendary();
        Boolean mythical = criteria.getMythical();
        Boolean mega = criteria.getMega();
        Boolean paradox = criteria.getParadox();
        Boolean baseFormOnly = criteria.getBaseFormOnly();
        Boolean excludeMega = criteria.getExcludeMega();
        Boolean excludeGmax = criteria.getExcludeGmax();
        String dexKey = criteria.getDexKey();
        String name = criteria.getName();

        List<Pokemon> pokemonList = pokemonRepository.search(
                typeAnd1,
                typeAnd2,
                typeOrList,
                generation,
                generationList,
                color,
                experienceGroup,
                hiddenMove,
                legendary,
                mythical,
                mega,
                paradox,
                baseFormOnly,
                excludeMega,
                excludeGmax,
                dexKey,
                name);

        // return null; // replace this
        return pokemonList.stream().map(PokemonDTO.Summary::new).collect(Collectors.toList());
    }
}
