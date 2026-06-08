// =============================================================
//  components/PokemonGrid.jsx — The Grid of Cards
// =============================================================
//
//  WHAT THIS FILE IS:
//  A component that renders the full grid of Pokémon cards.
//  It handles three states:
//    1. Loading  → show a loading message
//    2. Error    → show an error message
//    3. Success  → show the grid of PokemonCard components
//
//  PROPS THIS COMPONENT RECEIVES:
//  - pokemon  → array of Summary DTOs from the API
//  - loading  → boolean, true while API is fetching
//  - error    → string error message or null
//
//  WHAT IS THE KEY PROP?
//  When rendering a list with .map(), React needs a unique
//  "key" on each item so it can efficiently update the DOM
//  when the list changes. Always use a stable unique value
//  like the database id — never use the array index.
// =============================================================

import PokemonCard from './PokemonCard'
import styles from './PokemonGrid.module.css'

// Build the component ───────────────────────────────
function PokemonGrid({ pokemon, loading, error }) {
    //   Handle loading state first:
    if (loading) return <div className={styles.message}>Loading Pokémon...</div>
    //   Handle error state:
    if (error) return <div className={styles.error}>{error}</div>
    //   Handle empty results:
    if (pokemon.length === 0) return <div className={styles.message}>No Pokémon found.</div>
    //   Otherwise render the grid:
    return (
        <div className={styles.grid}>
            {pokemon.map(p => (
                <PokemonCard key={p.id} pokemon={p} />
            ))}
        </div>
    )
}


//Export ─────────────────────────────────────────────
export default PokemonGrid
