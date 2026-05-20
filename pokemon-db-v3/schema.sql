-- ============================================================
--  Pokémon Database Schema v3
--  Changes from v2:
--    - pokemon_type TEXT[]  →  type1 TEXT, type2 TEXT (nullable)
--    - egg_group TEXT[]     →  egg_group_1 TEXT, egg_group_2 TEXT (nullable)
--    - gender TEXT[]        →  gender TEXT (single value, see note below)
--  Note on gender: most Pokémon have one gender code ("mf", "mo", "fo", "uk")
--  A small number have two codes (e.g. ["fd","md"] for gender differences).
--  We store the primary code in gender_1 and the secondary in gender_2.
-- ============================================================

DROP TABLE IF EXISTS pokemon CASCADE;
DROP VIEW  IF EXISTS base_pokemon;
DROP VIEW  IF EXISTS special_pokemon;

CREATE TABLE pokemon (
    id                  BIGSERIAL          PRIMARY KEY,
    base_id             INTEGER         NOT NULL,
    form_id             INTEGER         NOT NULL DEFAULT 0,

    -- Names
    slug                TEXT            NOT NULL UNIQUE,
    name                TEXT            NOT NULL,
    form_name           TEXT,

    -- Types (max 2, type2 is NULL for single-type Pokémon)
    type1               TEXT            NOT NULL,
    type2               TEXT,

    -- Egg groups (max 2, egg_group_2 is NULL if only one group)
    egg_group_1         TEXT            NOT NULL,
    egg_group_2         TEXT,

    -- Gender (most have one code, some have two for gender differences)
    gender_1            TEXT            NOT NULL,
    gender_2            TEXT,

    -- -1 = genderless, 0–8 = ratio index
    gender_ratio        INTEGER,

    color               TEXT,
    experience_group    TEXT,
    shape               INTEGER,
    generation          INTEGER         NOT NULL,

    -- Evolution targets stored as JSONB: [[base_id, form_id], ...]
    evolution_ids       JSONB           NOT NULL DEFAULT '[]',

    -- Hidden moves stored as JSONB: { "surf": [1,2,3], "fly": [2,3] }
    hidden_moves        JSONB           NOT NULL DEFAULT '{}',

    -- Boolean flags
    is_mega             BOOLEAN         NOT NULL DEFAULT FALSE,
    is_battle_only      BOOLEAN         NOT NULL DEFAULT FALSE,
    has_gigantamax      BOOLEAN         NOT NULL DEFAULT FALSE,
    is_legendary        BOOLEAN         NOT NULL DEFAULT FALSE,
    is_mythical         BOOLEAN         NOT NULL DEFAULT FALSE,
    is_sublegendary     BOOLEAN         NOT NULL DEFAULT FALSE,
    is_paradox          BOOLEAN         NOT NULL DEFAULT FALSE,

    CONSTRAINT uq_base_form UNIQUE (base_id, form_id)
);

-- ── Indexes ───────────────────────────────────────────────────

-- Pokédex number lookup
CREATE INDEX idx_pokemon_base_id
    ON pokemon (base_id);

-- Type filtering — now just simple equality checks, no GIN needed
CREATE INDEX idx_pokemon_type1
    ON pokemon (type1);

CREATE INDEX idx_pokemon_type2
    ON pokemon (type2);

-- Egg group filtering
CREATE INDEX idx_pokemon_egg_group_1
    ON pokemon (egg_group_1);

-- Generation filtering
CREATE INDEX idx_pokemon_generation
    ON pokemon (generation);

-- Boolean flag filtering
CREATE INDEX idx_pokemon_flags
    ON pokemon (is_legendary, is_mythical, is_paradox, is_mega);

-- JSONB GIN index for hidden_moves key existence queries
-- e.g. WHERE hidden_moves ? 'surf'
CREATE INDEX idx_pokemon_hidden_moves_gin
    ON pokemon USING GIN (hidden_moves);


-- ── Views ─────────────────────────────────────────────────────

-- Base forms only (no megas, no alternate forms)
CREATE VIEW base_pokemon AS
    SELECT * FROM pokemon
    WHERE form_id = 0
    ORDER BY base_id;

-- All special Pokémon
CREATE VIEW special_pokemon AS
    SELECT * FROM pokemon
    WHERE is_legendary OR is_mythical OR is_sublegendary
    ORDER BY base_id;
