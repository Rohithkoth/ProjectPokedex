import axios from 'axios'

const api = axios.create({
  baseURL: '/api',
  headers: { 'Content-Type': 'application/json' },
})

export const getCaughtIds = (game = 'home') =>
  api.get(`/catch/${game}`).then(r => r.data)

export const toggleCaught = (game, pokemonId) =>
  api.post(`/catch/${game}/${pokemonId}`).then(r => r.data)

export const getCaughtCount = (game = 'home') =>
  api.get(`/catch/${game}/count`).then(r => r.data)
