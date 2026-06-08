package com.pokedex.dto;

// =============================================================
//  PokemonSearchCriteria.java  — Search Filter Object
// =============================================================
//
//  WHAT THIS FILE IS:
//  A plain Java class that holds all the filter options a user
//  can send from the React frontend to the search API.
// =============================================================

public class PokemonSearchCriteria {

    // Declare the filter fields ─────────────────────
    private String typeAnd1;
    private String typeAnd2;
    private String[] typeOrList;
    private Integer generation;
    private String color;
    private String experienceGroup;
    private String hiddenMove;
    private Boolean legendary;
    private Boolean mythical;
    private Boolean mega;
    private Boolean paradox;
    private Boolean baseFormOnly;
    private Boolean excludeMega;
    private Boolean excludeGmax;
    private String generationList;
    private String dexKey;
    private String name;

    public Boolean getExcludeGmax() {
        return excludeGmax;
    }

    public void setExcludeGmax(Boolean excludeGmax) {
        this.excludeGmax = excludeGmax;
    }

    // Add getters and setters ───────────────────────

    public String getTypeAnd1() {
        return typeAnd1;
    }

    public void setTypeAnd1(String typeAnd1) {
        this.typeAnd1 = typeAnd1;
    }

    public String getTypeAnd2() {
        return typeAnd2;
    }

    public void setTypeAnd2(String typeAnd2) {
        this.typeAnd2 = typeAnd2;
    }

    public String[] getTypeOrList() {
        return typeOrList;
    }

    public void setTypeOrList(String[] typeOrList) {
        this.typeOrList = typeOrList;
    }

    public Integer getGeneration() {
        return generation;
    }

    public void setGeneration(Integer generation) {
        this.generation = generation;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public String getExperienceGroup() {
        return experienceGroup;
    }

    public void setExperienceGroup(String experienceGroup) {
        this.experienceGroup = experienceGroup;
    }

    public String getHiddenMove() {
        return hiddenMove;
    }

    public void setHiddenMove(String hiddenMove) {
        this.hiddenMove = hiddenMove;
    }

    public Boolean getLegendary() {
        return legendary;
    }

    public void setLegendary(Boolean legendary) {
        this.legendary = legendary;
    }

    public Boolean getMythical() {
        return mythical;
    }

    public void setMythical(Boolean mythical) {
        this.mythical = mythical;
    }

    public Boolean getMega() {
        return mega;
    }

    public void setMega(Boolean mega) {
        this.mega = mega;
    }

    public Boolean getParadox() {
        return paradox;
    }

    public void setParadox(Boolean paradox) {
        this.paradox = paradox;
    }

    public Boolean getBaseFormOnly() {
        return baseFormOnly;
    }

    public void setBaseFormOnly(Boolean baseFormOnly) {
        this.baseFormOnly = baseFormOnly;
    }

    public Boolean getExcludeMega() {
        return excludeMega;
    }

    public void setExcludeMega(Boolean excludeMega) {
        this.excludeMega = excludeMega;
    }

    public String getGenerationList() {
        return generationList;
    }

    public void setGenerationList(String generationList) {
        this.generationList = generationList;
    }

    public String getDexKey() {
        return dexKey;
    }

    public void setDexKey(String dexKey) {
        this.dexKey = dexKey;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}


