package com.pokedex.dto;

// =============================================================
//  PokemonSearchCriteria.java  — Search Filter Object
// =============================================================
//
//  WHAT THIS FILE IS:
//  A plain Java class that holds all the filter options a user
//  can send from the React frontend to the search API.
//
//  HOW IT WORKS:
//  The React frontend will send a GET request with query parameters:
//    GET /api/pokemon/search?type=fire&generation=1&legendary=true
//
//  Spring automatically maps those query params into this object.
//  Each field here corresponds to one filter the frontend can apply.
//  All fields are Optional (nullable) — if the frontend doesn't send
//  a param, that field will just be null and the filter is ignored.
//
//  FUTURE USE (checklist feature):
//  When you add the user checklist feature later, you can add
//  a "caughtOnly" or "uncaughtOnly" boolean field here and the
//  frontend can filter the list to show only caught/uncaught Pokémon.


public class PokemonSearchCriteria {

    //Declare the filter fields ─────────────────────
    private String type;
    private Integer generation;
    private String color;
    private String experienceGroup;
    private String hiddenMove;
    private Boolean legendary;
    private Boolean mythical;
    private Boolean mega;
    private Boolean paradox;
    private Boolean baseFormOnly;

    //Add getters and setters ───────────────────────

    // Spring needs the setters to inject the query param values
    // into this object when a request comes in.
    //
    // Spring needs the getters so the service layer can read
    // the values and build the right DB query.

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
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
}


// URL arrives:
// ?type=fire&generation=1&legendary=true
//         ↓
// Spring creates empty PokemonSearchCriteria
//         ↓
// Spring calls setters:
//   criteria.setType("fire")
//   criteria.setGeneration(1)
//   criteria.setLegendary(true)
//   // mythical, mega, paradox, baseFormOnly stay null
//         ↓
// Spring passes criteria to controller method
//         ↓
// Service calls getters:
//   criteria.getType()        → "fire"
//   criteria.getGeneration()  → 1
//   criteria.getLegendary()   → true
//   criteria.getMythical()    → null  ← filter ignored in SQL
//         ↓
// Repository search() called with extracted values
//         ↓
// SQL runs with IS NULL checks handling the nulls gracefully