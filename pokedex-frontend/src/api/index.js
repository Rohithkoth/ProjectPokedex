// =============================================================
//  api/index.js — API Layer
// =============================================================
//
//  WHAT THIS FILE IS:
//  The only file in the frontend that talks to the backend.
//  All API calls live here — no axios calls anywhere else.
//  This keeps backend communication in one place so if the
//  URL or structure changes, you only update this file.
//
//  HOW IT WORKS:
//  axios.create() sets up a base configuration so every
//  request automatically starts with /api and sends JSON.
//  The Vite proxy in vite.config.js then forwards /api
//  requests to http://localhost:8080 automatically.
//
//  USAGE IN COMPONENTS:
//  import { getPokemonBySlug, searchPokemon } from '../api'
//
//  const pokemon = await getPokemonBySlug('charizard')
//  const results = await searchPokemon({ type: 'fire', generation: 1 })
// =============================================================

import axios from 'axios'

// Base axios instance — all requests go through this
const api = axios.create({
  baseURL: '/api',
  headers: { 'Content-Type': 'application/json' },
})

// ── API 1: Get a single Pokémon by slug ───────────────────────
// Calls: GET /api/pokemon/{slug}
// Returns: PokemonDTO.Detail object
// Example: getPokemonBySlug('charizard')
export const getPokemonBySlug = (slug) =>
  api.get(`/pokemon/${slug}`).then(r => r.data)

// ── API 2: Search / filter Pokémon ───────────────────────────
// Calls: GET /api/pokemon/search?type=fire&generation=1&...
// Returns: Array of PokemonDTO.Summary objects
//
// params is an object — pass only the filters you want:
//   searchPokemon({ type: 'fire' })
//   searchPokemon({ generation: 1, legendary: true })
//   searchPokemon({})  ← no filters, returns all Pokémon
//
// axios automatically converts the params object into
// query string format: ?type=fire&generation=1
// Null/undefined values are automatically omitted.
export const searchPokemon = (params = {}) =>
  api.get('/pokemon/search', { params }).then(r => r.data)
