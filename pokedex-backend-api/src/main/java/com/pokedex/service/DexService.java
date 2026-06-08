package com.pokedex.service;

import com.pokedex.dto.DexDTO;
import com.pokedex.dto.PokemonDTO;
import com.pokedex.repository.CaughtPokemonRepository;
import com.pokedex.repository.GameDexRepository;
import com.pokedex.repository.PokemonRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@Service
@Transactional(readOnly = true)
public class DexService {

    private static final Integer DEFAULT_USER_ID = 1;

    private final GameDexRepository      gameDexRepository;
    private final PokemonRepository      pokemonRepository;
    private final CaughtPokemonRepository caughtPokemonRepository;

    public DexService(
            GameDexRepository gameDexRepository,
            PokemonRepository pokemonRepository,
            CaughtPokemonRepository caughtPokemonRepository) {
        this.gameDexRepository       = gameDexRepository;
        this.pokemonRepository       = pokemonRepository;
        this.caughtPokemonRepository  = caughtPokemonRepository;
    }

    // ── Get all dexes with counts ──────────────────────────────
    // Used by landing page — returns all individual dex keys with counts
    // Frontend uses dexGroups.js to aggregate into game cards
    public List<DexDTO> getAllDexes() {
        List<Object[]> summaries = gameDexRepository.findAllDexSummaries();

        return summaries.stream().map(row -> {
            String dexKey    = (String) row[0];
            String dexName   = (String) row[1];
            long   totalCount = ((Number) row[2]).longValue();
            long   caughtCount = caughtPokemonRepository
                    .countByUserIdAndGameAndIsCaughtTrue(DEFAULT_USER_ID, dexKey);

            return new DexDTO(dexKey, dexName, totalCount, caughtCount);
        }).collect(Collectors.toList());
    }

    // ── Get all pokemon for a group of dex keys ────────────────
    // Called when user opens a game page.
    // dexKeys is a comma-separated list of all keys in the group.
    // Returns Summary DTOs with dexKey set so frontend can split
    // them into sections with dividers.
    public List<PokemonDTO.Summary> getPokemonForGroup(String dexKeys) {
        List<Object[]> rows = gameDexRepository
                .findPokemonWithDexKeyByDexKeys(dexKeys);

        List<PokemonDTO.Summary> result = new ArrayList<>();
        for (Object[] row : rows) {
            Long   pokemonId = ((Number) row[0]).longValue();
            String dexKey    = (String) row[1];

            pokemonRepository.findById(pokemonId).ifPresent(pokemon -> {
                PokemonDTO.Summary dto = new PokemonDTO.Summary(pokemon);
                dto.setDexKey(dexKey); // set which section this pokemon belongs to
                result.add(dto);
            });
        }
        return result;
    }
}
