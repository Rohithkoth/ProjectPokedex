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
// =============================================================

import PokemonCard from './PokemonCard'
import styles from './PokemonGrid.module.css'
import { useInfiniteScroll } from '../hooks/useInfiniteScroll'

function PokemonGrid({ pokemon, loading, error, caughtIds, onToggleCaught, loadMore, hasMore }) {
    if (loading) return <div className={styles.message}>Loading Pokémon...</div>
    if (error) return <div className={styles.error}>{error}</div>
    if (pokemon.length === 0) return <div className={styles.message}>No Pokémon found.</div>

    const sentinelRef = useInfiniteScroll(loadMore, hasMore && !loading)
    return (
        <>
            <div className={styles.grid}>
                {pokemon.map(p => (
                    <PokemonCard
                        key={p.id}
                        pokemon={p}
                        isCaught={caughtIds.has(p.id)}
                        onToggleCaught={onToggleCaught}
                    />
                ))}
            </div>

            {/* Sentinel — triggers loadMore when visible */}
            <div ref={sentinelRef} className={styles.sentinel} />

            {loading && pokemon.length > 0 && (
                <div className={styles.message}>Loading more...</div>
            )}

            {!hasMore && pokemon.length > 0 && (
                <div className={styles.message}>All {pokemon.length} Pokémon loaded</div>
            )}
        </>
    )

}


export default PokemonGrid
