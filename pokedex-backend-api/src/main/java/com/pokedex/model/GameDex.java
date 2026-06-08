package com.pokedex.model;

import jakarta.persistence.*;

@Entity
@Table(name = "game_dex")
public class GameDex {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "dex_key", nullable = false)
    private String dexKey;

    @Column(name = "dex_name", nullable = false)
    private String dexName;

    @Column(name = "dex_number", nullable = false)
    private Integer dexNumber;

    @Column(name = "base_id", nullable = false)
    private Integer baseId;

    @Column(name = "form_id", nullable = false)
    private Integer formId;

    public GameDex() {}

    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public String getDexKey() { return dexKey; }
    public void setDexKey(String dexKey) { this.dexKey = dexKey; }

    public String getDexName() { return dexName; }
    public void setDexName(String dexName) { this.dexName = dexName; }

    public Integer getDexNumber() { return dexNumber; }
    public void setDexNumber(Integer dexNumber) { this.dexNumber = dexNumber; }

    public Integer getBaseId() { return baseId; }
    public void setBaseId(Integer baseId) { this.baseId = baseId; }

    public Integer getFormId() { return formId; }
    public void setFormId(Integer formId) { this.formId = formId; }
}
