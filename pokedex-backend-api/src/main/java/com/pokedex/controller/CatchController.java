package com.pokedex.controller;

import com.pokedex.service.CatchService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.tags.Tag;

// =============================================================
//  CatchController.java — HTTP Layer
// =============================================================
//
//  WHAT THIS FILE IS:
//  Exposes three REST endpoints for caught Pokémon management.
//  Thin layer — receives requests, delegates to service, returns.
//  Same pattern as PokemonController.
//
//  BASE PATH: /api/catch
//  All endpoints start with this prefix via @RequestMapping.
//
//  THREE ENDPOINTS:
//
//  ── GET /api/catch ────────────────────────────────────────────
//  Returns all caught Pokémon IDs for the current user+game.
//  Called ONCE on page load by the frontend to build a Set
//  of caught IDs that is checked locally per card.
//  Return type: ResponseEntity<List<Long>>
//  Frontend usage: axios.get('/api/catch')
//
//  ── POST /api/catch/{pokemonId} ───────────────────────────────
//  Toggles caught status for one Pokémon.
//  If caught → uncatches it. If uncaught → catches it.
//  Uses @PathVariable to extract pokemonId from the URL.
//  Returns { "caught": true } or { "caught": false }
//  so the frontend knows the new state without refetching.
//  Return type: ResponseEntity<Map<String, Boolean>>
//  Frontend usage: axios.post('/api/catch/6')
//
//  ── GET /api/catch/count ──────────────────────────────────────
//  Returns total number of caught Pokémon for the current user+game.
//  Useful for showing progress: "You've caught 42 / 1420 Pokémon"
//  Returns { "count": 42 }
//  Return type: ResponseEntity<Map<String, Long>>
// =============================================================

@Tag(name = "Catch Tracker", description = "Track caught Pokémon")
@RestController
@RequestMapping("/api/catch")
@CrossOrigin(origins = "http://localhost:5173")
public class CatchController {


    private final CatchService catchService;

    public CatchController(CatchService catchService) {
        this.catchService = catchService;
    }
    //
    @Operation(summary = "Get all caught Pokémon IDs", description = "Returns list of all caught Pokémon IDs for the current user in HOME. Call once on page load.")
    @GetMapping("/{game}")
    public ResponseEntity<List<Long>> getCaughtIds(@PathVariable String game) {
        List<Long> result = catchService.getCaughtIds(game);
        return ResponseEntity.ok(result);
    }

    @Operation(summary = "Toggle caught status", description = "Catches or uncatches a Pokémon. Returns { caught: true } if now caught, { caught: false } if now uncaught.")
    @PostMapping("/{game}/{pokemonId}")
    public ResponseEntity<Map<String, Boolean>> toggleCaught(
            @PathVariable Long pokemonId,@PathVariable String game) {
        boolean result = catchService.toggleCaught(pokemonId,game);
        return ResponseEntity.ok(Map.of("caught", result));
    }

    @Operation(summary = "Get total caught count", description = "Returns total number of Pokémon caught. Example response: { count: 42 }")
    @GetMapping("/{game}/count")
    public ResponseEntity<Map<String, Long>> getCaughtCount(@PathVariable String game) {
        long result = catchService.getCaughtCount(game);
        return ResponseEntity.ok(Map.of("count", result));
    }
    //
}
