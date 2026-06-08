// =============================================================
//  components/PokemonCard.jsx — Individual Pokémon Card
// =============================================================

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
import { useNavigate } from 'react-router-dom'


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
//   ── Required ──────────────────────────────────────────────
//   pokemon.baseId    → the Pokédex number e.g. #006
//   pokemon.name      → the display name e.g. "Charizard"
//   pokemon.formName  → form label if not null e.g. "Mega Charizard X"
//   pokemon.type1     → first type badge
//   pokemon.type2     → second type badge (only if not null)
//   pokemon.generation → e.g. "Gen 1"
//
//   ── Special badges (only show if true) ───────────────────
//   pokemon.isLegendary  → show "Legendary" badge
//   pokemon.isMythical   → show "Mythical" badge
//   pokemon.isMega       → show "Mega" badge
//   pokemon.isParadox    → show "Paradox" badge
//   pokemon.hasGigantamax → show "Gigantamax" badge


const buildImagePath = (pokemon) => {
  const base = String(pokemon.baseId).padStart(4, '0')
  const form = String(pokemon.formId).padStart(3, '0')
  const gender = pokemon.gender1 || 'uk'

  if (pokemon.formName === 'Gigantamax Form') {
    const gmaxForm = pokemon.slug === 'urshifu-rapid-strike-gmax' ? '001' : '000'
    const gmaxGender = pokemon.gender1 === 'uk' ? 'uk' : 'mf'
    return `/img/pokemon/${base}_${gmaxForm}_${gmaxGender}_g.png`  // ← gmaxGender not gender
  }
  return `/img/pokemon/${base}_${form}_${gender}_n.png`
}

function PokemonCard({ pokemon, isCaught, onToggleCaught }) {
  const navigate = useNavigate()
  return (
    <div className={styles.card} onClick={() => navigate(`/pokemon/${pokemon.slug}`)}>

      {/* Pokémon sprite image */}
      <img
        className={styles.sprite}
        src={buildImagePath(pokemon)}
        alt={pokemon.name}
        onError={e => { e.target.style.display = 'none' }}
      />

      {/* Pokédex number — padStart turns 6 into "0006" */}
      <span className={styles.number}>
        #{String(pokemon.baseId).padStart(4, '0')}
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
        {pokemon.formName === 'Gigantamax Form' && <span className={styles.flag}>Gigantamax</span>}
      </div>
      {/* Caught toggle — Pokéball button */}
      <button
        className={`${styles.caughtBtn} ${isCaught ? styles.caught : styles.uncaught}`}
        onClick={e => { e.stopPropagation(); onToggleCaught(pokemon.id) }}
        title={isCaught ? 'Mark as not caught' : 'Mark as caught'}
      >
        <span className={styles.pokeballIcon}>{isCaught ? '🟢' : '⚪'}</span>
        <span className={styles.caughtText}>{isCaught ? 'Caught' : 'Not caught'}</span>
      </button>
    </div>
  )
}

//Export the component ──────────────────────────────
export default PokemonCard

