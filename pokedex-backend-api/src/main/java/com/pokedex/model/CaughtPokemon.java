package com.pokedex.model;

import jakarta.persistence.*;

import java.lang.annotation.Inherited;
import java.time.LocalDateTime;

import javax.annotation.processing.Generated;

// =============================================================
//  CaughtPokemon.java — Entity
// =============================================================
//
//  WHAT THIS FILE IS:
//  Maps to the caught_pokemon table in the DB.
//  Each row = one Pokémon caught by one user in one game.
//
//  Same pattern as Pokemon.java — annotations tell Hibernate
//  how to map each Java field to a DB column.
//
//  NEW CONCEPT — @PrePersist:
//  A lifecycle callback that runs automatically just before
//  Hibernate inserts a new row. Use it to set default values
//  so you never have to set them manually in the service.
//  Think of it like a constructor that runs at DB insert time.
// =============================================================

@Entity
@Table(name = "caught_pokemon")
public class CaughtPokemon {

    // Primary Key ───────────────────────────────────
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    // Column fields ─────────────────────────────────
    @Column(name = "user_id")
    private Integer userId;
    @Column(name = "game")
    private String game;
    @Column(name = "pokemon_id")
    private Long pokemonId;
    @Column(name = "caught_at")
    private LocalDateTime caughtAt;
    @Column(name = "is_caught", nullable = false)
    private Boolean isCaught;

    @Column(name = "updated_at", nullable = false)
    private LocalDateTime updatedAt;

    //@PrePersist ───────────────────────────────────
    @PrePersist
    public void prePersist() {
        this.caughtAt = LocalDateTime.now();
        this.updatedAt = LocalDateTime.now();
        if (this.userId == null)
            this.userId = 1;
        // if (this.game == null)
        //     this.game = "HOME";
        if (this.isCaught == null)
            this.isCaught = true;
    }

    @PreUpdate
    public void preUpdate() {
        this.updatedAt = LocalDateTime.now();
    }

    // No-args constructor ───────────────────────────
    //

    public CaughtPokemon() {

    }

    // Getters and Setters ───────────────────────────
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getGame() {
        return game;
    }

    public void setGame(String game) {
        this.game = game;
    }

    public Long getPokemonId() {
        return pokemonId;
    }

    public void setPokemonId(Long pokemonId) {
        this.pokemonId = pokemonId;
    }

    public LocalDateTime getCaughtAt() {
        return caughtAt;
    }

    public void setCaughtAt(LocalDateTime caughtAt) {
        this.caughtAt = caughtAt;
    }

    public Boolean getIsCaught() {
        return isCaught;
    }

    public void setIsCaught(Boolean isCaught) {
        this.isCaught = isCaught;
    }

    public LocalDateTime getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(LocalDateTime updatedAt) {
        this.updatedAt = updatedAt;
    }

}
