-- ── Game Dex Table ───────────────────────────────────────────
-- Stores the mapping of dex numbers to pokemon for each game.
-- Each row = one pokemon entry in one game's dex.
-- dex_key matches the key in dexes.js e.g. "kanto_home"
-- dex_number is the number within that specific dex
-- base_id + form_id identify the exact pokemon form

CREATE TABLE IF NOT EXISTS game_dex (
    id          BIGSERIAL   PRIMARY KEY,
    dex_key     TEXT        NOT NULL,
    dex_name    TEXT        NOT NULL,
    dex_number  INTEGER     NOT NULL,
    base_id     INTEGER     NOT NULL,
    form_id     INTEGER     NOT NULL DEFAULT 0,
    CONSTRAINT uq_game_dex UNIQUE (dex_key, base_id, form_id)
);

CREATE INDEX IF NOT EXISTS idx_game_dex_key
    ON game_dex (dex_key);

CREATE INDEX IF NOT EXISTS idx_game_dex_base_form
    ON game_dex (base_id, form_id);
