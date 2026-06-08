package com.pokedex.controller;

import com.pokedex.dto.DexDTO;
import com.pokedex.dto.PokemonDTO;
import com.pokedex.service.DexService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Tag(name = "Game Dex", description = "Per-game Pokédex data")
@RestController
@RequestMapping("/api/dex")
@CrossOrigin(origins = "http://localhost:5173")
public class DexController {

    private final DexService dexService;

    public DexController(DexService dexService) {
        this.dexService = dexService;
    }

    // GET /api/dex
    // Returns all individual dex keys with counts
    // Frontend uses dexGroups.js to group them into game cards
    @Operation(
        summary = "List all dexes with counts",
        description = "Returns all dex keys with total and caught counts. Frontend groups them using dexGroups.js config."
    )
    @GetMapping
    public ResponseEntity<List<DexDTO>> getAllDexes() {
        return ResponseEntity.ok(dexService.getAllDexes());
    }

    // GET /api/dex/group?keys=kalos_central,kalos_coastal,kalos_mountain
    // Returns all pokemon for a comma-separated list of dex keys
    // ordered by section order then dex number
    // Each pokemon has dexKey set so frontend can split into sections
    @Operation(
        summary = "Get Pokémon for a group of dex keys",
        description = "Returns Pokémon for multiple dex keys ordered by section. Each pokemon includes dexKey for section splitting. Pass comma-separated keys e.g. ?keys=kalos_central,kalos_coastal,kalos_mountain"
    )
    @GetMapping("/group")
    public ResponseEntity<List<PokemonDTO.Summary>> getPokemonForGroup(
            @RequestParam String keys) {
        return ResponseEntity.ok(dexService.getPokemonForGroup(keys));
    }
}
