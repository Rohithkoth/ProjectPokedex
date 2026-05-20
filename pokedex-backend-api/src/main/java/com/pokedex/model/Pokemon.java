package com.pokedex.model;

import io.hypersistence.utils.hibernate.type.json.JsonBinaryType;
import jakarta.persistence.*;
import org.hibernate.annotations.Type;

// =============================================================
//  Pokemon.java  — The Entity (Model)
// =============================================================
//
//  WHAT THIS FILE IS:
//  A Java class that maps directly to the "pokemon" table in your
//  PostgreSQL database. Each field below = one column in that table.
//  Hibernate uses this class to read rows from the DB and turn them
//  into Java objects your code can work with.
// =============================================================

@Entity
@Table(name = "pokemon")
public class Pokemon {

    // Primary Key ───────────────────────────────────

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    // Simple integer/string columns ─────────────────


    @Column(name = "base_id")
    private Integer baseId;
    @Column(name = "form_id")
    private Integer formId;
    private String slug;
    private String name;
    @Column(name = "form_name")
    private String formName;
    private String color;
    private Integer shape;
    private Integer generation;

    //String columns with slightly different names ──

    @Column(name = "experience_group")
    private String experienceGroup;

    @Column(name = "gender_ratio")
    private Integer genderRatio;

// Flat type, egg group and gender columns ───────
//
// Since each Pokémon has at most 2 types, 2 egg groups, and
// 2 gender codes, we use plain String columns instead of arrays.
// type2, eggGroup2, and gender2 are nullable — they will be
// null when a Pokémon only has one value.

    // Types
    @Column(name = "type1")
    private String type1;
    @Column(name = "type2")
    private String type2;

    // egg groups
    @Column(name = "egg_group_1")
    private String eggGroup1;
    @Column(name = "egg_group_2")
    private String eggGroup2;

    // Gender
    @Column(name = "gender_1")
    private String gender1;
    @Column(name = "gender_2")
    private String gender2;

    //JSONB columns ─────────────────────────────────
    //
    // We store these as String for simplicity. The JSON content
    // will come back as a raw string like: "[[2,0],[3,0]]"
    // The React frontend can parse that with JSON.parse().

    @Type(JsonBinaryType.class)
    @Column(name = "evolution_ids", columnDefinition = "jsonb")
    private String evolutionIds; // DB column: evolution_ids → e.g. "[[2,0]]"

    @Type(JsonBinaryType.class)
    @Column(name = "hidden_moves", columnDefinition = "jsonb")
    private String hiddenMoves; // DB column: hidden_moves → e.g. {"surf":[1,2,3]}

    // Boolean flag columns ─────────────────────────
    // DB column names:
    // is_mega, is_battle_only, has_gigantamax,
    // is_legendary, is_mythical, is_sublegendary, is_paradox
    //

    @Column(name = "is_mega")
    private Boolean isMega;

    @Column(name = "is_battle_only")
    private Boolean isBattleOnly;

    @Column(name = "has_gigantamax")
    private Boolean hasGigantamax;

    @Column(name = "is_legendary")
    private Boolean isLegendary;

    @Column(name = "is_mythical")
    private Boolean isMythical;

    @Column(name = "is_sublegendary")
    private Boolean isSublegendary;

    @Column(name = "is_paradox")
    private Boolean isParadox;

    // No-args constructor ───────────────────────────


    public Pokemon() {
    }

    //Getters and Setters ───────────────────────────

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Integer getBaseId() {
        return baseId;
    }

    public void setBaseId(Integer baseId) {
        this.baseId = baseId;
    }

    public Integer getFormId() {
        return formId;
    }

    public void setFormId(Integer formId) {
        this.formId = formId;
    }

    public String getSlug() {
        return slug;
    }

    public void setSlug(String slug) {
        this.slug = slug;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getFormName() {
        return formName;
    }

    public void setFormName(String formName) {
        this.formName = formName;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public Integer getShape() {
        return shape;
    }

    public void setShape(Integer shape) {
        this.shape = shape;
    }

    public Integer getGeneration() {
        return generation;
    }

    public void setGeneration(Integer generation) {
        this.generation = generation;
    }

    public String getExperienceGroup() {
        return experienceGroup;
    }

    public void setExperienceGroup(String experienceGroup) {
        this.experienceGroup = experienceGroup;
    }

    public Integer getGenderRatio() {
        return genderRatio;
    }

    public void setGenderRatio(Integer genderRatio) {
        this.genderRatio = genderRatio;
    }

    // ✅ type1 and type2
    public String getType1() {
        return type1;
    }

    public void setType1(String type1) {
        this.type1 = type1;
    }

    public String getType2() {
        return type2;
    }

    public void setType2(String type2) {
        this.type2 = type2;
    }

    // ✅ egg groups
    public String getEggGroup1() {
        return eggGroup1;
    }

    public void setEggGroup1(String eggGroup1) {
        this.eggGroup1 = eggGroup1;
    }

    public String getEggGroup2() {
        return eggGroup2;
    }

    public void setEggGroup2(String eggGroup2) {
        this.eggGroup2 = eggGroup2;
    }

    // ✅ gender
    public String getGender1() {
        return gender1;
    }

    public void setGender1(String gender1) {
        this.gender1 = gender1;
    }

    public String getGender2() {
        return gender2;
    }

    public void setGender2(String gender2) {
        this.gender2 = gender2;
    }

    public String getEvolutionIds() {
        return evolutionIds;
    }

    public void setEvolutionIds(String evolutionIds) {
        this.evolutionIds = evolutionIds;
    }

    public String getHiddenMoves() {
        return hiddenMoves;
    }

    public void setHiddenMoves(String hiddenMoves) {
        this.hiddenMoves = hiddenMoves;
    }

    public Boolean getIsMega() {
        return isMega;
    }

    public void setIsMega(Boolean isMega) {
        this.isMega = isMega;
    }

    public Boolean getIsBattleOnly() {
        return isBattleOnly;
    }

    public void setIsBattleOnly(Boolean isBattleOnly) {
        this.isBattleOnly = isBattleOnly;
    }

    public Boolean getHasGigantamax() {
        return hasGigantamax;
    }

    public void setHasGigantamax(Boolean hasGigantamax) {
        this.hasGigantamax = hasGigantamax;
    }

    public Boolean getIsLegendary() {
        return isLegendary;
    }

    public void setIsLegendary(Boolean isLegendary) {
        this.isLegendary = isLegendary;
    }

    public Boolean getIsMythical() {
        return isMythical;
    }

    public void setIsMythical(Boolean isMythical) {
        this.isMythical = isMythical;
    }

    public Boolean getIsSublegendary() {
        return isSublegendary;
    }

    public void setIsSublegendary(Boolean isSublegendary) {
        this.isSublegendary = isSublegendary;
    }

    public Boolean getIsParadox() {
        return isParadox;
    }

    public void setIsParadox(Boolean isParadox) {
        this.isParadox = isParadox;
    }

}
