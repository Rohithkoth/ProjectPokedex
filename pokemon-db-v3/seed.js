/**
 * seed.js — Pokémon Database Seeder v3
 *
 * Changes from v2:
 *   - pokemon_type array → type1, type2 columns
 *   - egg_group array    → egg_group_1, egg_group_2 columns
 *   - gender array       → gender_1, gender_2 columns
 *
 * Usage:
 *   npm install
 *   PGPASSWORD=yourpassword npm run seed
 */

import pg from 'pg'
import data from './pokemon.js'

// ── DB connection ─────────────────────────────────────────────
const DB_CONFIG = {
  host:     process.env.PGHOST     || 'localhost',
  port:     parseInt(process.env.PGPORT || '5432'),
  database: process.env.PGDATABASE || 'starter_db',
  user:     process.env.PGUSER     || 'postgres',
  password: process.env.PGPASSWORD || '',
}

const { Pool } = pg
const pool = new Pool(DB_CONFIG)

// ── Insert SQL ────────────────────────────────────────────────
const INSERT_SQL = `
  INSERT INTO pokemon (
    base_id, form_id, slug, name, form_name,
    type1, type2,
    egg_group_1, egg_group_2,
    gender_1, gender_2,
    gender_ratio, color, experience_group, shape, generation,
    evolution_ids, hidden_moves,
    is_mega, is_battle_only, has_gigantamax,
    is_legendary, is_mythical, is_sublegendary, is_paradox
  ) VALUES (
    $1,  $2,  $3,  $4,  $5,
    $6,  $7,
    $8,  $9,
    $10, $11,
    $12, $13, $14, $15, $16,
    $17, $18,
    $19, $20, $21,
    $22, $23, $24, $25
  )
  ON CONFLICT (base_id, form_id) DO UPDATE SET
    slug             = EXCLUDED.slug,
    name             = EXCLUDED.name,
    form_name        = EXCLUDED.form_name,
    type1            = EXCLUDED.type1,
    type2            = EXCLUDED.type2,
    egg_group_1      = EXCLUDED.egg_group_1,
    egg_group_2      = EXCLUDED.egg_group_2,
    gender_1         = EXCLUDED.gender_1,
    gender_2         = EXCLUDED.gender_2,
    gender_ratio     = EXCLUDED.gender_ratio,
    color            = EXCLUDED.color,
    experience_group = EXCLUDED.experience_group,
    shape            = EXCLUDED.shape,
    generation       = EXCLUDED.generation,
    evolution_ids    = EXCLUDED.evolution_ids,
    hidden_moves     = EXCLUDED.hidden_moves,
    is_mega          = EXCLUDED.is_mega,
    is_battle_only   = EXCLUDED.is_battle_only,
    has_gigantamax   = EXCLUDED.has_gigantamax,
    is_legendary     = EXCLUDED.is_legendary,
    is_mythical      = EXCLUDED.is_mythical,
    is_sublegendary  = EXCLUDED.is_sublegendary,
    is_paradox       = EXCLUDED.is_paradox
`

// ── Seed ──────────────────────────────────────────────────────
async function seed() {
  const client = await pool.connect()

  try {
    console.log(`🔌 Connected to ${DB_CONFIG.host}:${DB_CONFIG.port}/${DB_CONFIG.database}`)

    const entries = Object.entries(data)
    console.log(`📦 Seeding ${entries.length} Pokémon entries...\n`)

    let inserted = 0
    let failed   = 0

    await client.query('BEGIN')

    for (const [slug, p] of entries) {
      try {
        // ── Split arrays into flat values ──────────────────
        //
        // pokemon_type: ["fire", "dragon"] → type1="fire", type2="dragon"
        // pokemon_type: ["fire"]           → type1="fire", type2=null
        const type1 = p.pokemon_type?.[0] ?? null
        const type2 = p.pokemon_type?.[1] ?? null

        // egg_group: ["monster", "dragon"] → egg_group_1="monster", egg_group_2="dragon"
        // egg_group: ["bug"]               → egg_group_1="bug", egg_group_2=null
        const eggGroup1 = p.egg_group?.[0] ?? null
        const eggGroup2 = p.egg_group?.[1] ?? null

        // gender: ["mf"]         → gender_1="mf",  gender_2=null
        // gender: ["fd", "md"]   → gender_1="fd",  gender_2="md"
        const gender1 = p.gender?.[0] ?? null
        const gender2 = p.gender?.[1] ?? null

        await client.query(INSERT_SQL, [
          p.base_id,                              // $1
          p.form_id ?? 0,                         // $2
          slug,                                   // $3
          p.name,                                 // $4
          p.form_name ?? null,                    // $5

          type1,                                  // $6  type1 (never null)
          type2,                                  // $7  type2 (null if single type)

          eggGroup1,                              // $8  egg_group_1
          eggGroup2,                              // $9  egg_group_2

          gender1,                                // $10 gender_1
          gender2,                                // $11 gender_2

          p.gender_ratio     ?? null,             // $12
          p.color            ?? null,             // $13
          p.experience_group ?? null,             // $14
          p.shape            ?? null,             // $15
          p.generation,                           // $16

          JSON.stringify(p.evolution_ids ?? []),  // $17 jsonb
          JSON.stringify(p.hidden_moves  ?? {}),  // $18 jsonb

          p.is_mega          ?? false,            // $19
          p.is_battle_only   ?? false,            // $20
          p.has_gigantamax   ?? false,            // $21
          p.is_legendary     ?? false,            // $22
          p.is_mythical      ?? false,            // $23
          p.is_sublegendary  ?? false,            // $24
          p.is_paradox       ?? false,            // $25
        ])

        inserted++
      } catch (err) {
        console.error(`  ✗ Failed on "${slug}":`, err.message)
        failed++
      }
    }

    await client.query('COMMIT')

    console.log(`\n✅ Seeding complete!`)
    console.log(`   Inserted/updated : ${inserted}`)
    if (failed > 0) console.log(`   Failed           : ${failed}`)

  } catch (err) {
    await client.query('ROLLBACK')
    console.error('❌ Seed failed, rolled back:', err.message)
    process.exit(1)
  } finally {
    client.release()
    await pool.end()
  }
}

seed()
