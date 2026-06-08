// =============================================================
//  hooks/usePokemon.js — Custom Hook
// =============================================================
//
//  WHAT THIS FILE IS:
//  A custom React hook that manages all Pokémon data fetching
//  and search state in one place.
//  WHAT THIS HOOK MANAGES:
//  - pokemon      → the current list of Pokémon to display
//  - loading      → true while fetching, false when done
//  - error        → error message if fetch failed, null if ok
//  - filters      → the current filter state (type, generation, etc.)
//  - setFilters   → function to update filters
//  - clearFilters → function to reset all filters
// =============================================================

import { useState, useEffect } from 'react'
import { searchPokemon } from '../api'

//Define the initial/empty filter state ─────────────

const INITIAL_FILTERS = {
  type: null,
  generation: null,
  color: null,
  legendary: null,
  mythical: null,
  mega: null,
  paradox: null,
  baseFormOnly: null,
  hiddenMove: null,
  experienceGroup: null,
}

export function usePokemon() {

  //Declare state variables ───────────────────────
  const [pokemon, setPokemon] = useState([])

  const [loading, setLoading] = useState(false)

  const [error, setError] = useState(null)

  const [filters, setFilters] = useState(INITIAL_FILTERS)



  //Fetch data when filters change ─────────────────
  useEffect(() => {
    setLoading(true)
    setError(null)
    const params = Object.fromEntries(
      Object.entries(filters).filter(([_, v]) => v !== null)
    )
    searchPokemon(params)
      .then(data => {
        setPokemon(data)
        setLoading(false)
      })
      .catch(err => {
        setError('Failed to load Pokémon. Is the API running?')
        setLoading(false)
      })
  }, [filters])

  //Define the clearFilters function ───────────────
  const clearFilters = () => {
    setFilters(INITIAL_FILTERS)
  }
 


  //Return everything the component needs ─────────
  return {
    pokemon,
    loading,
    error,
    filters,
    setFilters,
    clearFilters,
  }

}
