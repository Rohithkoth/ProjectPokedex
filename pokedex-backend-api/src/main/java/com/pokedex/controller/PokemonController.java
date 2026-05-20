package com.pokedex.controller;

import com.pokedex.dto.PokemonDTO;
import com.pokedex.dto.PokemonSearchCriteria;
import com.pokedex.service.PokemonService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import org.springframework.web.bind.annotation.GetMapping;
// import org.springframework.web.bind.annotation.RequestParam;
// import org.springframework.web.service.annotation.GetExchange;



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
//  Controllers should be thin — no business logic, no DB calls.
//  All of that lives in the service and repository layers.
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
//  REACT FRONTEND USAGE (future reference):
//  Your React app will call these with axios like:
//
//    // Single Pokémon
//    const res = await axios.get(`/api/pokemon/${slug}`);
//
//    // Search with filters (build params from UI state)
//    const res = await axios.get('/api/pokemon/search', {
//      params: { type: 'fire', generation: 1 }
//    });
//    // axios automatically builds: /api/pokemon/search?type=fire&generation=1
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

@RestController
@RequestMapping("/api/pokemon")
@CrossOrigin(origins = "http://localhost:5173")
public class PokemonController {

    private final PokemonService pokemonService;

    public PokemonController(PokemonService pokemonService){
        this.pokemonService =pokemonService;
    }

    // =========================================================
    //  API 1: GET /api/pokemon/{slug}
    //  Returns: full PokemonDTO.Detail as JSON
    //
    //  Examples:
    //    GET /api/pokemon/bulbasaur
    //    GET /api/pokemon/charizard-mega-x
    //    GET /api/pokemon/eevee
    // =========================================================

    //
    @GetMapping("/{slug}")
    public ResponseEntity<PokemonDTO.Detail> getPokemonBySlug( @PathVariable String slug){
        PokemonDTO.Detail result = pokemonService.getPokemonBySlug(slug);
        return ResponseEntity.ok(result); 
    }
    

    // =========================================================
    //  API 2: GET /api/pokemon/search
    //  Returns: list of PokemonDTO.Summary as JSON
    //
    //  All query params are optional. Mix and match freely:
    //    ?type=fire
    //    ?generation=1
    //    ?color=red
    //    ?experienceGroup=Slow
    //    ?hiddenMove=surf
    //    ?legendary=true
    //    ?mythical=true
    //    ?mega=true
    //    ?paradox=true
    //    ?baseFormOnly=true
    //
    //  Combined examples:
    //    ?type=fire&generation=1&baseFormOnly=true
    //    ?legendary=true&generation=3
    // =========================================================

    // Implement the search endpoint ─────────────────
    //
 
    //
    @GetMapping("/search")
    public ResponseEntity<List<PokemonDTO.Summary>> searchPokemon(
        @ModelAttribute PokemonSearchCriteria criteria
    ){
        List<PokemonDTO.Summary> result = pokemonService.searchPokemon(criteria);
        return ResponseEntity.ok(result);
    }
    

    // Error handler ─────────────────────────────────
    // When getPokemonBySlug can't find a Pokémon, the service throws
    // a RuntimeException. Without this handler, Spring would return
    // a generic 500 error. This catches it and returns a proper 404.
    //
    // Your React frontend can check for 404 and show a "Not found" message.
    //
    @ExceptionHandler (RuntimeException.class)
    public ResponseEntity<String> handleNotFound(RuntimeException ex){
        return ResponseEntity.status(404).body(ex.getMessage());
    }
}
