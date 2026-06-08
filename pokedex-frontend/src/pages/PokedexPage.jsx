// =============================================================
//  pages/PokedexPage.jsx — Main Pokédex Page
// =============================================================

import { useParams, useNavigate } from 'react-router-dom'
import { usePokemon } from '../hooks/usePokemon'
import FilterPanel from '../components/FilterPanel'
import PokemonGrid from '../components/PokemonGrid'
import PokemonCard from '../components/PokemonCard'
import DEX_GROUPS from '../dexGroups'
import styles from './PokedexPage.module.css'
import NameSearchBar from '../components/NameSearchBar'

// ── Sectioned grid with dividers ──────────────────────────────
function SectionedGrid({ group, pokemon, loading, error, caughtIds, onToggleCaught }) {
  if (loading) return <div className={styles.message}>Loading Pokémon...</div>
  if (error) return <div className={styles.error}>{error}</div>
  if (pokemon.length === 0) return <div className={styles.message}>No Pokémon found.</div>

  return (
    <div>
      {group.sections.map((section, idx) => {
        // Filter pokemon belonging to this section by dexKey
        const sectionPokemon = pokemon.filter(p =>
          section.dexKeys.includes(p.dexKey)
        )

        if (sectionPokemon.length === 0) return null

        return (
          <div key={idx} className={styles.section}>
            <div className={styles.divider}>
              <span className={styles.dividerLabel}>{section.label}</span>
            </div>
            <div className={styles.grid}>
              {sectionPokemon.map(p => (
                <PokemonCard
                  key={p.id}
                  pokemon={p}
                  isCaught={caughtIds.has(p.id)}
                  onToggleCaught={onToggleCaught}
                />
              ))}
            </div>
          </div>
        )
      })}
    </div>
  )
}

// ── Main page ─────────────────────────────────────────────────
function PokedexPage() {
  const { groupKey } = useParams()
  const navigate = useNavigate()
  const group = DEX_GROUPS.find(g => g.key === groupKey)

  const {
    pokemon,
    loading,
    error,
    filters,
    setFilters,
    clearFilters,
    caughtIds,
    handleToggleCaught,
    loadMore,
    hasMore,
    nameQuery,
    setNameQuery,
    caughtFilter,
    setCaughtFilter,
  } = usePokemon(groupKey)

  const isMultiSection = group && group.sections.length > 1

  return (
    <div className={styles.page}>

      <aside className={styles.sidebar}>
        <FilterPanel
          filters={filters}
          setFilters={setFilters}
          clearFilters={clearFilters}
          caughtFilter={caughtFilter}      //CATCH STATUS FILTER
          setCaughtFilter={setCaughtFilter}
        />
      </aside>

      <main className={styles.main}>

        <div className={styles.header}>
          <div className={styles.headerMeta}>
            <button className={styles.backBtn} onClick={() => navigate('/')}>
              ← Games
            </button>
            {!loading && (
              <span className={styles.count}>
                {pokemon.length} Pokémon — {pokemon.filter(p => caughtIds.has(p.id)).length} caught
              </span>
            )}
          </div>
          <h1 className={styles.title}>
            {group ? group.name : groupKey}
          </h1>
        </div>

        <NameSearchBar value={nameQuery} onChange={setNameQuery} />

        {isMultiSection
          ? <SectionedGrid
            group={group}
            pokemon={pokemon}
            loading={loading}
            error={error}
            caughtIds={caughtIds}
            onToggleCaught={handleToggleCaught}
          />
          : <PokemonGrid
            pokemon={pokemon}
            loading={loading}
            error={error}
            caughtIds={caughtIds}
            onToggleCaught={handleToggleCaught}
            loadMore={loadMore}
            hasMore={hasMore}
          />
        }

      </main>
    </div>
  )
}

export default PokedexPage
