// =============================================================
//  api/index.js — API Layer
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
export const searchPokemon = (params = {}) =>
  api.get('/pokemon/search', { params }).then(r => r.data)
