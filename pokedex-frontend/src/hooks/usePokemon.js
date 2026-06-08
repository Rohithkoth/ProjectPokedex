import { searchPokemon } from '../api'
import { getCaughtIds, toggleCaught } from '../api/catch'
import { getPokemonForGroup } from '../api/dex'
import DEX_GROUPS from '../dexGroups'
import { useState, useEffect, useCallback, useMemo } from 'react'

const INITIAL_FILTERS = {
  typeAnd1: null,
  typeAnd2: null,
  typeOrList: [],
  generation: null,
  generationList: null,
  color: null,
  legendary: null,
  mythical: null,
  mega: null,
  paradox: null,
  baseFormOnly: true,
  hiddenMove: null,
  experienceGroup: null,
  excludeMega: null,
  excludeGmax: null,
}

export function usePokemon(groupKey) {
  const [pokemon, setPokemon] = useState([])
  const [loading, setLoading] = useState(false)
  const [error, setError] = useState(null)
  const [filters, setFilters] = useState(INITIAL_FILTERS)
  const [caughtIds, setCaughtIds] = useState(new Set())
  const [page, setPage] = useState(0)
  const [hasMore, setHasMore] = useState(true)
  const [nameQuery, setNameQuery] = useState('')   // search bar
  const [caughtFilter, setCaughtFilter] = useState('all') // 'all' | 'caught' | 'uncaught'

  // Fetch caught IDs when game changes
  useEffect(() => {
    const game = groupKey || 'home'
    getCaughtIds(game).then(ids => setCaughtIds(new Set(ids)))
  }, [groupKey])

  // Main fetch effect
  useEffect(() => {
    const timer = setTimeout(() => {
      setLoading(true)
      setError(null)

      if (groupKey) {
        const group = DEX_GROUPS.find(g => g.key === groupKey)
        if (group) {
          const allKeys = group.sections.flatMap(s => s.dexKeys).join(',')

          getPokemonForGroup(allKeys)
            .then(data => {
              let filtered = data

              // Form filters
              if (filters.baseFormOnly) {
                filtered = filtered.filter(p =>
                  p.formId === 0 ||
                  ['Alolan Form', 'Galarian Form', 'Hisuian Form', 'Paldean Form'].includes(p.formName) ||
                  p.isMega ||
                  p.formName === 'Gigantamax Form'
                )
              }
              if (filters.excludeMega) filtered = filtered.filter(p => !p.isMega)
              if (filters.excludeGmax) filtered = filtered.filter(p => p.formName !== 'Gigantamax Form')

              // Type filters
              if (filters.typeAnd1) {
                filtered = filtered.filter(p => p.type1 === filters.typeAnd1 || p.type2 === filters.typeAnd1)
              }
              if (filters.typeAnd2) {
                filtered = filtered.filter(p => p.type1 === filters.typeAnd2 || p.type2 === filters.typeAnd2)
              }
              if (filters.typeOrList?.length > 0) {
                filtered = filtered.filter(p =>
                  filters.typeOrList.includes(p.type1) || filters.typeOrList.includes(p.type2)
                )
              }

              // Generation filter
              if (filters.generationList?.length > 0 && filters.generationList.length < 9) {
                filtered = filtered.filter(p => filters.generationList.includes(p.generation))
              }

              // Special filters
              if (filters.legendary) filtered = filtered.filter(p => p.isLegendary)
              if (filters.mythical) filtered = filtered.filter(p => p.isMythical)
              if (filters.mega) filtered = filtered.filter(p => p.isMega)
              if (filters.paradox) filtered = filtered.filter(p => p.isParadox)

              // ── Name filter (client-side for dex mode) ──────────
              if (nameQuery.trim()) {
                filtered = filtered.filter(p =>
                  p.name.toLowerCase().includes(nameQuery.trim().toLowerCase())
                )
              }

              // ── Caught filter ─────────────────────────────────────────
              if (caughtFilter === 'caught') {
                filtered = filtered.filter(p => caughtIds.has(p.id))
              } else if (caughtFilter === 'uncaught') {
                filtered = filtered.filter(p => !caughtIds.has(p.id))
              }

              setPokemon(filtered)
              setLoading(false)
            })
            .catch(() => {
              setError('Failed to load Pokémon. Is the API running?')
              setLoading(false)
            })
          return
        }
      }

      // Search mode — build params and hit backend
      const params = Object.fromEntries(
        Object.entries(filters).filter(([_, v]) => v !== null)
      )
      if (!params.typeOrList || params.typeOrList.length === 0) {
        delete params.typeOrList
      } else {
        params.typeOrList = params.typeOrList.join(',')
      }
      if (params.generationList) {
        if (params.generationList.length === 0 || params.generationList.length === 9) {
          delete params.generationList
        } else {
          params.generationList = params.generationList.join(',')
        }
      }

      // ── Name filter (backend param for search mode) ─────────
      if (nameQuery.trim()) params.name = nameQuery.trim()

      params.page = page
      params.size = 100

      searchPokemon(params)
        .then(data => {
          if (page === 0) {
            setPokemon(data.content || data)
          } else {
            setPokemon(prev => [...prev, ...(data.content || data)])
          }
          setHasMore(data.last === false ? false : !(data.content || data).length < 100)
          setLoading(false)
        })
        .catch(() => {
          setError('Failed to load Pokémon. Is the API running?')
          setLoading(false)
        })
    }, 300)

    return () => clearTimeout(timer)
  }, [filters, groupKey, nameQuery, page, caughtFilter])  // ← nameQuery added

  // Reset page + results when filters or nameQuery change in search mode
  useEffect(() => {
    if (!groupKey) {
      setPage(0)
      setPokemon([])
    }
  }, [filters, groupKey, nameQuery, caughtFilter])  // ← nameQuery added

  const handleToggleCaught = (pokemonId) => {
    const game = groupKey || 'home'
    toggleCaught(game, pokemonId).then(({ caught }) => {
      setCaughtIds(prev => {
        const next = new Set(prev)
        caught ? next.add(pokemonId) : next.delete(pokemonId)
        return next
      })
    })
  }

  const loadMore = useCallback(() => {
    if (!loading && hasMore && !groupKey) {
      setPage(prev => prev + 1)
    }
  }, [loading, hasMore, groupKey])

  // ... all useEffects and handlers above ...

  const displayedPokemon = useMemo(() => {
    if (caughtFilter === 'caught') return pokemon.filter(p => caughtIds.has(p.id))
    if (caughtFilter === 'uncaught') return pokemon.filter(p => !caughtIds.has(p.id))
    return pokemon
  }, [pokemon, caughtIds, caughtFilter])


  const clearFilters = () => setFilters(INITIAL_FILTERS)

  return {
    pokemon: displayedPokemon,
    loading,
    error,
    filters,
    setFilters,
    clearFilters,
    caughtIds,
    handleToggleCaught,
    loadMore,
    hasMore,
    nameQuery,      //search
    setNameQuery,
    caughtFilter,
    setCaughtFilter   //caught status filtering
  }
}