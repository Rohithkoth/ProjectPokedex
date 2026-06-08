// =============================================================
//  api/dex.js — Dex API calls
// =============================================================

import axios from 'axios'

const api = axios.create({
  baseURL: '/api',
  headers: { 'Content-Type': 'application/json' },
})

// Get all dex keys with counts — used by landing page
export const getAllDexes = () =>
  api.get('/dex').then(r => r.data)

// Get all pokemon for a group of dex keys
// keys is a comma-separated string e.g. "kalos_central,kalos_coastal,kalos_mountain"
export const getPokemonForGroup = (keys) =>
  api.get('/dex/group', { params: { keys } }).then(r => r.data)
