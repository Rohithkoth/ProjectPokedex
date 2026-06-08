package com.pokedex.dto;

// DTO for a single dex entry in the landing page grid
// Contains everything needed to render a game card
public class DexDTO {

    private String dexKey;   // e.g. "kanto_home"
    private String dexName;  // e.g. "Kanto Region"
    private long totalCount; // total pokemon in this dex
    private long caughtCount; // how many the user has caught

    public DexDTO(String dexKey, String dexName, long totalCount, long caughtCount) {
        this.dexKey     = dexKey;
        this.dexName    = dexName;
        this.totalCount  = totalCount;
        this.caughtCount = caughtCount;
    }

    public String getDexKey()    { return dexKey; }
    public String getDexName()   { return dexName; }
    public long getTotalCount()  { return totalCount; }
    public long getCaughtCount() { return caughtCount; }
}
