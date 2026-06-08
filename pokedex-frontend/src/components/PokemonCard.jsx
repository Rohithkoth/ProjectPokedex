// =============================================================
//  components/PokemonCard.jsx — Individual Pokémon Card
// =============================================================
//
//  THE DATA THIS CARD RECEIVES (PokemonDTO.Summary):
//  {
//    id, baseId, formId,
//    slug, name, formName,
//    type1, type2,
//    color, generation,
//    isLegendary, isMythical, isMega, isParadox, hasGigantamax
//  }
// =============================================================

import styles from './PokemonCard.module.css'

// ── TYPE COLORS ────────────────────────────────────────────────
// Maps each Pokémon type to a color for the type badge.
const TYPE_COLORS = {
  fire: '#f97316',
  water: '#3b82f6',
  grass: '#22c55e',
  electric: '#eab308',
  psychic: '#ec4899',
  ice: '#67e8f9',
  dragon: '#7c3aed',
  dark: '#44403c',
  fairy: '#f9a8d4',
  normal: '#78716c',
  fighting: '#b91c1c',
  flying: '#60a5fa',
  poison: '#a855f7',
  ground: '#d97706',
  rock: '#92400e',
  bug: '#65a30d',
  ghost: '#4c1d95',
  steel: '#64748b',
}

//Build the component function ──────────────────────
function PokemonCard({ pokemon }) {
  return (
    <div className={styles.card}>

      {/* Pokédex number — padStart turns 6 into "006" */}
      <span className={styles.number}>
        #{String(pokemon.baseId).padStart(3, '0')}
      </span>

      {/* Name */}
      <h2 className={styles.name}>{pokemon.name}</h2>

      {/* Form name — only shows if not null e.g. "Mega Charizard X" */}
      {pokemon.formName && (
        <p className={styles.formName}>{pokemon.formName}</p>
      )}

      {/* Type badges */}
      <div className={styles.types}>
        <span
          className={styles.typeBadge}
          style={{ backgroundColor: TYPE_COLORS[pokemon.type1] }}
        >
          {pokemon.type1}
        </span>

        {/* type2 only renders if the Pokémon has a second type */}
        {pokemon.type2 && (
          <span
            className={styles.typeBadge}
            style={{ backgroundColor: TYPE_COLORS[pokemon.type2] }}
          >
            {pokemon.type2}
          </span>
        )}
      </div>

      {/* Generation */}
      <p className={styles.generation}>Gen {pokemon.generation}</p>

      {/* Special flag badges — each only renders if true */}
      <div className={styles.flags}>
        {pokemon.isLegendary && <span className={styles.flag}>Legendary</span>}
        {pokemon.isMythical && <span className={styles.flag}>Mythical</span>}
        {pokemon.isMega && <span className={styles.flag}>Mega</span>}
        {pokemon.isParadox && <span className={styles.flag}>Paradox</span>}
        {pokemon.hasGigantamax && <span className={styles.flag}>Gigantamax</span>}
      </div>

    </div>
  )
}

//Export the component ──────────────────────────────
export default PokemonCard
