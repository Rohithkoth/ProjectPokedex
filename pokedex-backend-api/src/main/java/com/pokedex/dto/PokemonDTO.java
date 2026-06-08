package com.pokedex.dto;

import com.pokedex.model.Pokemon;

// =============================================================
//  PokemonDTO.java  — Data Transfer Objects
// =============================================================
//
//  WHAT THIS FILE IS:
//  DTOs control exactly what data gets sent back in API responses.
//  We never return the raw Pokemon entity directly from a controller
//  because:
//    1. It can expose internal fields you don't want to send
//    2. You might want different shapes for different endpoints
//    3. Raw entities can cause issues with JPA lazy loading
//
//  WE HAVE TWO DTOs:
//
//  PokemonDTO.Summary  — lightweight, used in LIST responses
//    The React frontend will use this to render a grid/list of
//    Pokémon cards. Only includes the fields needed for a card:
//    name, types, generation, color.
//
//  PokemonDTO.Detail   — full data, used in SINGLE Pokémon responses
//    The React frontend will use this to render a full Pokémon
//    profile page with all stats, moves, egg groups, etc.
//
// =============================================================

public class PokemonDTO {

    // =========================================================
    // INNER CLASS 1: Summary
    // Used for: GET /api/pokemon/search (list of results)
    // =========================================================
    public static class Summary {
        //  Declare fields ────────────────────────────
        // These flags let the frontend show special icons/badges on cards.
        //
        private Long id;
        private Integer baseId;
        private Integer formId;
        private String slug;
        private String name;
        private String formName;
        private String type1;
        private String type2;
        private String color;
        private Integer generation;
        private Boolean isLegendary;
        private Boolean isMythical;
        private Boolean isMega;
        private Boolean isParadox;
        private Boolean hasGigantamax;

        //No-args constructor ───────────────────────    
        //
        public Summary() {
        }

        //Mapping constructor ───────────────────────
        public Summary(Pokemon p) {
            this.id = p.getId();
            this.baseId = p.getBaseId();
            this.formId = p.getFormId();
            this.slug = p.getSlug();
            this.name = p.getName();
            this.formName = p.getFormName();
            this.type1 = p.getType1();
            this.type2 = p.getType2();
            this.color = p.getColor();
            this.generation = p.getGeneration();
            this.isLegendary = p.getIsLegendary();
            this.isMythical = p.getIsMythical();
            this.isMega = p.getIsMega();
            this.isParadox = p.getIsParadox();
            this.hasGigantamax = p.getHasGigantamax();
        }

        //Getters ───────────────────────────────────
        public Long getId() {
            return id;
        }

        public Integer getBaseId() {
            return baseId;
        }

        public Integer getFormId() {
            return formId;
        }

        public String getSlug() {
            return slug;
        }

        public String getName() {
            return name;
        }

        public String getFormName() {
            return formName;
        }

        public String getType1() {
            return type1;
        }

        public String getType2() {
            return type2;
        }

        public String getColor() {
            return color;
        }

        public Integer getGeneration() {
            return generation;
        }

        public Boolean getIsLegendary() {
            return isLegendary;
        }

        public Boolean getIsMythical() {
            return isMythical;
        }

        public Boolean getIsMega() {
            return isMega;
        }

        public Boolean getIsParadox() {
            return isParadox;
        }

        public Boolean getHasGigantamax() {
            return hasGigantamax;
        }

    }

    // =========================================================
    // INNER CLASS 2: Detail
    // Used for: GET /api/pokemon/{slug} (single Pokémon)
    // =========================================================
    public static class Detail {

        // Declare fields ────────────────────────────
        //
        private Long id;
        private Integer baseId;
        private Integer formId;
        private String slug;
        private String name;
        private String formName;
        private String type1;
        private String type2;
        private String color;
        private Integer generation;
        private Boolean isLegendary;
        private Boolean isMythical;
        private Boolean isMega;
        private Boolean isParadox;
        private Boolean hasGigantamax;

        // Detail-only fields
        private String eggGroup1; // ← flat column, not array
        private String eggGroup2; // ← null if only one egg group
        private String gender1; // ← flat column, not array
        private String gender2; // ← null if only one gender code
        private Integer genderRatio;
        private String experienceGroup;
        private Integer shape;
        private String evolutionIds; // ← raw JSON string e.g. "[[2,0],[3,0]]"
        private String hiddenMoves; // ← raw JSON string e.g. {"surf":[1,2,3]}
        private Boolean isBattleOnly;
        private Boolean isSublegendary;

        // No-args constructor ───────────────────────
        //
        public Detail() {
        }

        // Mapping constructor ───────────────────────
        //
        //
        public Detail(Pokemon p) {
            // Summary fields
            this.id = p.getId();
            this.baseId = p.getBaseId();
            this.formId = p.getFormId();
            this.slug = p.getSlug();
            this.name = p.getName();
            this.formName = p.getFormName();
            this.type1 = p.getType1();
            this.type2 = p.getType2();
            this.color = p.getColor();
            this.generation = p.getGeneration();
            this.isLegendary = p.getIsLegendary();
            this.isMythical = p.getIsMythical();
            this.isMega = p.getIsMega();
            this.isParadox = p.getIsParadox();
            this.hasGigantamax = p.getHasGigantamax();

            // Detail-only fields
            this.eggGroup1 = p.getEggGroup1();
            this.eggGroup2 = p.getEggGroup2();
            this.gender1 = p.getGender1();
            this.gender2 = p.getGender2();
            this.genderRatio = p.getGenderRatio();
            this.experienceGroup = p.getExperienceGroup();
            this.shape = p.getShape();
            this.evolutionIds = p.getEvolutionIds();
            this.hiddenMoves = p.getHiddenMoves();
            this.isBattleOnly = p.getIsBattleOnly();
            this.isSublegendary = p.getIsSublegendary();
        }

        //Getters ───────────────────────────────────
        public Long getId() {
            return id;
        }

        public Integer getBaseId() {
            return baseId;
        }

        public Integer getFormId() {
            return formId;
        }

        public String getSlug() {
            return slug;
        }

        public String getName() {
            return name;
        }

        public String getFormName() {
            return formName;
        }

        public String getType1() {
            return type1;
        }

        public String getType2() {
            return type2;
        }

        public String getColor() {
            return color;
        }

        public Integer getGeneration() {
            return generation;
        }

        public Boolean getIsLegendary() {
            return isLegendary;
        }

        public Boolean getIsMythical() {
            return isMythical;
        }

        public Boolean getIsMega() {
            return isMega;
        }

        public Boolean getIsParadox() {
            return isParadox;
        }

        public Boolean getHasGigantamax() {
            return hasGigantamax;
        }

        public String getEggGroup1() {
            return eggGroup1;
        }

        public String getEggGroup2() {
            return eggGroup2;
        }

        public String getGender1() {
            return gender1;
        }

        public String getGender2() {
            return gender2;
        }

        public Integer getGenderRatio() {
            return genderRatio;
        }

        public String getExperienceGroup() {
            return experienceGroup;
        }

        public Integer getShape() {
            return shape;
        }

        public String getEvolutionIds() {
            return evolutionIds;
        }

        public String getHiddenMoves() {
            return hiddenMoves;
        }

        public Boolean getIsBattleOnly() {
            return isBattleOnly;
        }

        public Boolean getIsSublegendary() {
            return isSublegendary;
        }
    }
}
