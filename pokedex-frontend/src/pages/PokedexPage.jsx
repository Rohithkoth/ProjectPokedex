// =============================================================
//  pages/PokedexPage.jsx — Main Page
// =============================================================
//
//  WHAT THIS FILE IS:
//  The top-level page component that composes everything together.
//  It uses the usePokemon hook to get data and state, then passes
//  that data down to the FilterPanel and PokemonGrid components.
//
//  THIS IS WHERE THE LAYOUT LIVES:
//  The page controls the overall structure — sidebar on the left,
//  main content area on the right. Components just fill their slot.
//
//  In this page:
//    PokedexPage (owns all state via usePokemon)
//      ├── FilterPanel receives: filters, setFilters, clearFilters
//      │     └── When user changes a filter, calls setFilters
//      │           → usePokemon re-fetches → pokemon updates
//      │                 → PokemonGrid re-renders with new data
//      └── PokemonGrid receives: pokemon, loading, error
//
//
//  RESULT COUNT:
//  Show the number of results above the grid.
//  pokemon.length gives you the count.
// =============================================================

import { usePokemon } from '../hooks/usePokemon'
import FilterPanel from '../components/FilterPanel'
import PokemonGrid from '../components/PokemonGrid'
import styles from './PokedexPage.module.css'

// Build the page component ──────────────────────────
//
function PokedexPage() {
  //
  //Call the hook to get everything you need
  const { pokemon, loading, error, filters, setFilters, clearFilters } = usePokemon()
  //
  //Return the layout JSX:
  return (
    <div className={styles.page}>

      {/* Sidebar */}
      <aside className={styles.sidebar}>
        <FilterPanel
          filters={filters}
          setFilters={setFilters}
          clearFilters={clearFilters}
        />
      </aside>

      {/* Main content */}
      <main className={styles.main}>

        {/* Header */}
        <div className={styles.header}>
          <h1 className={styles.title}>Pokédex</h1>
          {!loading && (
            <span className={styles.count}>
              {pokemon.length} Pokémon
            </span>
          )}
        </div>

        {/* Grid */}
        <PokemonGrid
          pokemon={pokemon}
          loading={loading}
          error={error}
        />

      </main>
    </div>
  )
}


//Export ─────────────────────────────────────────────
export default PokedexPage
