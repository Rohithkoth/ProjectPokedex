package com.pokedex.controller;

import com.pokedex.dto.PokemonDTO;
import com.pokedex.dto.PokemonSearchCriteria;
import com.pokedex.service.PokemonService;
import org.springframework.http.ResponseEntity;
// import org.springframework.web.bind.annotation.RequestParam;
// import org.springframework.web.service.annotation.GetExchange;
import org.springframework.web.bind.annotation.*;

import java.util.List;

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.tags.Tag;
import io.swagger.v3.oas.annotations.media.ExampleObject;

// =============================================================
//  PokemonController.java  — HTTP Layer (Two APIs)
// =============================================================
//
//  WHAT THIS FILE IS:
//  The entry point for all incoming HTTP requests.
//  Its only job is to:
//    1. Receive a request and extract the parameters
//    2. Call the right service method
//    3. Return the result as a JSON HTTP response
//
//  THIS FILE DEFINES TWO APIS:
//
//  API 1 — Single Pokémon lookup:
//    GET /api/pokemon/{slug}
//    Returns full detail for one Pokémon.
//    Example: GET /api/pokemon/charizard
//             GET /api/pokemon/charizard-mega-x
//
//  API 2 — Search / Filter:
//    GET /api/pokemon/search
//    Accepts optional query parameters to filter the list.
//    All params are optional — omit any you don't need.
//    Example: GET /api/pokemon/search?type=fire&generation=1
//             GET /api/pokemon/search?legendary=true
//             GET /api/pokemon/search?hiddenMove=surf&baseFormOnly=true
//             GET /api/pokemon/search              ← returns all Pokémon
//
//  ANNOTATIONS REFERENCE:
//  @RestController       — all methods return JSON automatically
//  @RequestMapping       — base URL prefix for all methods in this class
//  @CrossOrigin          — allows React (port 5173) to call this API
//  @GetMapping           — handles GET requests
//  @PathVariable         — extracts {slug} from the URL path
//  @ModelAttribute       — maps ALL query params into a single object
//  ResponseEntity<T>     — wrapper that lets you set HTTP status + body
// =============================================================

@Tag(name = "Pokémon")
@RestController
@RequestMapping("/api/pokemon")
@CrossOrigin(origins = "http://localhost:5173")
public class PokemonController {

        // Inject the service ────────────────────────────

        private final PokemonService pokemonService;

        public PokemonController(PokemonService pokemonService) {
                this.pokemonService = pokemonService;
        }

        // =========================================================
        // API 1: GET /api/pokemon/{slug}
        // Returns: full PokemonDTO.Detail as JSON
        //
        // Examples:
        // GET /api/pokemon/bulbasaur
        // GET /api/pokemon/charizard-mega-x
        // GET /api/pokemon/eevee
        // =========================================================
        // Single Pokémon endpoint ─────────
        //

        @Operation(summary = "Get a single Pokémon by slug", description = "Returns full detail for one Pokémon. Slug examples: bulbasaur, charizard, charizard-mega-x, venusaur-gmax")
        @GetMapping("/{slug}")
        public ResponseEntity<PokemonDTO.Detail> getPokemonBySlug(
                        @Parameter(description = "Pokémon slug e.g. charizard or charizard-mega-x") @PathVariable String slug) {
                PokemonDTO.Detail result = pokemonService.getPokemonBySlug(slug);
                return ResponseEntity.ok(result);
        }

        // =========================================================
        // API 2: GET /api/pokemon/search
        // Returns: list of PokemonDTO.Summary as JSON
        //
        // All query params are optional. Mix and match freely:
        // ?type=fire
        // ?generation=1
        // ?color=red
        // ?experienceGroup=Slow
        // ?hiddenMove=surf
        // ?legendary=true
        // ?mythical=true
        // ?mega=true
        // ?paradox=true
        // ?baseFormOnly=true
        //
        // Combined examples:
        // ?type=fire&generation=1&baseFormOnly=true
        // ?legendary=true&generation=3
        // =========================================================

        //search endpoint ─────────────────
        @Operation(summary = "Search and filter Pokémon", description = "Returns Pokémon matching the given filters. All parameters optional.")
        @GetMapping("/search")
        public ResponseEntity<List<PokemonDTO.Summary>> searchPokemon(
                        @RequestParam(required = false) String typeAnd1,
                        @RequestParam(required = false) String typeAnd2,
                        @RequestParam(required = false) String typeOrList,
                        @RequestParam(required = false) Integer generation,
                        @RequestParam(required = false) String color,
                        @RequestParam(required = false) String experienceGroup,
                        @RequestParam(required = false) String hiddenMove,
                        @RequestParam(required = false) Boolean legendary,
                        @RequestParam(required = false) Boolean mythical,
                        @RequestParam(required = false) Boolean mega,
                        @RequestParam(required = false) Boolean paradox,
                        @RequestParam(required = false) Boolean baseFormOnly,
                        @RequestParam(required = false) Boolean excludeMega,
                        @RequestParam(required = false) Boolean excludeGmax,
                        @RequestParam(required = false) String generationList,
                        @RequestParam(required = false) String dexKey,
                        @RequestParam(required = false) String name) {
                // Build criteria manually from individual params
                PokemonSearchCriteria criteria = new PokemonSearchCriteria();
                criteria.setTypeAnd1(typeAnd1);
                criteria.setTypeAnd2(typeAnd2);
                criteria.setTypeOrList(typeOrList != null ? new String[] { typeOrList } : null);
                criteria.setGeneration(generation);
                criteria.setColor(color);
                criteria.setExperienceGroup(experienceGroup);
                criteria.setHiddenMove(hiddenMove);
                criteria.setLegendary(legendary);
                criteria.setMythical(mythical);
                criteria.setMega(mega);
                criteria.setParadox(paradox);
                criteria.setBaseFormOnly(baseFormOnly != null ? baseFormOnly : true);
                criteria.setExcludeMega(excludeMega);
                criteria.setExcludeGmax(excludeGmax);
                criteria.setGenerationList(generationList);
                criteria.setDexKey(dexKey);
                criteria.setName(name);

                List<PokemonDTO.Summary> result = pokemonService.searchPokemon(criteria);
                return ResponseEntity.ok(result);
        }

        //Error handler ─────────────────────────────────
        //
        // hitting /api/pokemon/fakemon will return:
        // HTTP 404
        // Body: "Pokemon not found: fakemon"
        //
        @ExceptionHandler(RuntimeException.class)
        public ResponseEntity<String> handleNotFound(RuntimeException ex) {
                return ResponseEntity.status(404).body(ex.getMessage());
        }
}
