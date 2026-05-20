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
//
//  WHY HAVE A SERVICE LAYER AT ALL?
//  The controller should only handle HTTP concerns (routing, status codes).
//  The repository should only handle DB concerns (SQL queries).
//  The service handles everything in between — logic, validation,
//  data transformation. This separation makes each layer easier to
//  test and change independently.
//
//  FUTURE USE (checklist feature):
//  When you add user checklists, the service is where you'll look up
//  which Pokémon the user has caught and set the "isCaught" field
//  on each Summary DTO before returning it to the frontend.
//
//  KEY JAVA CONCEPT — Streams:
//  You'll use Java streams to convert List<Pokemon> → List<DTO>.
//  The pattern looks like this:
//
// =============================================================

@Service
@Transactional
public class PokemonService {

    //Inject the repository ────────────────────────
    // This pattern is called "constructor injection" and is preferred
    // over @Autowired because it makes testing easier and makes
    // dependencies explicit.
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

    @Transactional(readOnly = true)
    public PokemonDTO.Detail getPokemonBySlug(String slug) {
        // return null;
        Pokemon foundPokemon = pokemonRepository.findBySlug(slug)
                .orElseThrow(() -> new RuntimeException("Pokemon not found: " + slug));
        return new PokemonDTO.Detail(foundPokemon);
    }

    // =========================================================
    // API 2: Search / Filter Pokémon
    // Used by: GET /api/pokemon/search?type=fire&generation=1&...
    // Returns: List<PokemonDTO.Summary> (lightweight list)
    // =========================================================

    @Transactional(readOnly = true)
    public List<PokemonDTO.Summary> searchPokemon(PokemonSearchCriteria criteria) {
        //extract all filter values from the criteria object
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

        // return null;
        return pokemonList.stream().map(PokemonDTO.Summary::new).collect(Collectors.toList());
    }
}
