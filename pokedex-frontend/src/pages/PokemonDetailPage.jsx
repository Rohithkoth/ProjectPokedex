import { useState, useEffect } from 'react'
import { useParams, useNavigate } from 'react-router-dom'
import { getPokemonBySlug } from '../api'
import styles from './PokemonDetailPage.module.css'

// ── Type colors ───────────────────────────────────────────────
const TYPE_COLORS = {
  fire: '#f97316', water: '#3b82f6', grass: '#22c55e',
  electric: '#eab308', psychic: '#ec4899', ice: '#67e8f9',
  dragon: '#7c3aed', dark: '#44403c', fairy: '#f9a8d4',
  normal: '#78716c', fighting: '#b91c1c', flying: '#60a5fa',
  poison: '#a855f7', ground: '#d97706', rock: '#92400e',
  bug: '#65a30d', ghost: '#4c1d95', steel: '#64748b',
}

// ── Image path builder ────────────────────────────────────────
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

// ── Gender display ────────────────────────────────────────────
const formatGender = (gender1, gender2) => {
  const codes = { mf: 'Male / Female', md: 'Male', fd: 'Female', mo: 'Male Only', fo: 'Female Only', uk: 'Unknown' }
  if (gender2) return `${codes[gender1] || gender1} / ${codes[gender2] || gender2}`
  return codes[gender1] || gender1 || '—'
}

const formatGenderRatio = (ratio) => {
  if (ratio === null || ratio === undefined) return null
  if (ratio === 0) return 'Female Only'
  if (ratio === 8) return 'Male Only'
  if (ratio === -1) return 'Genderless'
  const malePct = Math.round((ratio / 8) * 100 * 10) / 10
  return `${malePct}% Male / ${100 - malePct}% Female`
}

// ── Hidden moves parser ───────────────────────────────────────
const parseHiddenMoves = (hiddenMovesStr) => {
  if (!hiddenMovesStr || hiddenMovesStr === '{}') return []
  try {
    const obj = typeof hiddenMovesStr === 'string'
      ? JSON.parse(hiddenMovesStr)
      : hiddenMovesStr
    return Object.keys(obj)
  } catch {
    return []
  }
}

// ── Main component ────────────────────────────────────────────
function PokemonDetailPage() {
  const { slug } = useParams()
  const navigate = useNavigate()
  const [pokemon, setPokemon] = useState(null)
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState(null)
  const [imgError, setImgError] = useState(false)

  useEffect(() => {
    setLoading(true)
    setError(null)
    setImgError(false)
    getPokemonBySlug(slug)
      .then(data => {
        setPokemon(data)
        setLoading(false)
      })
      .catch(() => {
        setError('Pokémon not found.')
        setLoading(false)
      })
  }, [slug])

  if (loading) return <div className={styles.message}>Loading...</div>
  if (error) return <div className={styles.error}>{error}</div>
  if (!pokemon) return null

  const hiddenMoves = parseHiddenMoves(pokemon.hiddenMoves)
  const genderRatio = formatGenderRatio(pokemon.genderRatio)

  // Build flags list
  const flags = [
    pokemon.isLegendary && 'Legendary',
    pokemon.isMythical && 'Mythical',
    pokemon.isSublegendary && 'Sub-Legendary',
    pokemon.isMega && 'Mega',
    pokemon.isParadox && 'Paradox',
    pokemon.isBattleOnly && 'Battle Only',
    pokemon.hasGigantamax && 'Has Gigantamax',
  ].filter(Boolean)

  return (
    <div className={styles.page}>

      {/* Back button */}
      <button className={styles.backBtn} onClick={() => navigate(-1)}>
        ← Back
      </button>

      {/* Hero section */}
      <div className={styles.hero}>

        {/* Sprite */}
        <div className={styles.spriteContainer}>
          {!imgError && (
            <img
              className={styles.sprite}
              src={buildImagePath(pokemon)}
              alt={pokemon.name}
              onError={() => setImgError(true)}
            />
          )}
          {imgError && (
            <div className={styles.noSprite}>No image</div>
          )}
        </div>

        {/* Name + types */}
        <div className={styles.heroInfo}>
          <span className={styles.number}>
            #{String(pokemon.baseId).padStart(4, '0')}
          </span>
          <h1 className={styles.name}>{pokemon.name}</h1>
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
            {pokemon.type2 && (
              <span
                className={styles.typeBadge}
                style={{ backgroundColor: TYPE_COLORS[pokemon.type2] }}
              >
                {pokemon.type2}
              </span>
            )}
          </div>

          {/* Quick stats row */}
          <div className={styles.quickStats}>
            {pokemon.generation && <span>Gen {pokemon.generation}</span>}
            {pokemon.color && <span>{pokemon.color}</span>}
            {pokemon.experienceGroup && <span>{pokemon.experienceGroup}</span>}
          </div>
        </div>
      </div>

      {/* Base Stats */}
      {pokemon.hp && (
        <div className={styles.section}>
          <h2 className={styles.sectionTitle}>Base Stats</h2>
          <div className={styles.statList}>
            {[
              { name: 'HP', value: pokemon.hp },
              { name: 'Attack', value: pokemon.attack },
              { name: 'Defense', value: pokemon.defense },
              { name: 'Sp. Atk', value: pokemon.spAtk },
              { name: 'Sp. Def', value: pokemon.spDef },
              { name: 'Speed', value: pokemon.speed },
            ].map(stat => (
              <div key={stat.name} className={styles.statRow}>
                <span className={styles.statName}>{stat.name}</span>
                <span className={styles.statValue}>{stat.value}</span>
                <div className={styles.statBarBg}>
                  <div
                    className={styles.statBarFill}
                    style={{
                      width: `${Math.min((stat.value / 255) * 100, 100)}%`,
                      backgroundColor: stat.value >= 100 ? '#22c55e'
                        : stat.value >= 60 ? '#eab308'
                          : '#ef4444'
                    }}
                  />
                </div>
              </div>
            ))}

            <div className={styles.statRow}>
              <span className={styles.statName}>Total</span>
              <span className={styles.statValue}>
                {pokemon.hp + pokemon.attack + pokemon.defense + pokemon.spAtk + pokemon.spDef + pokemon.speed}
              </span>
              <div />
            </div>
          </div>
        </div>
      )}

      {/* Info section */}
      <div className={styles.section}>
        <h2 className={styles.sectionTitle}>Info</h2>
        <div className={styles.infoGrid}>

          {/* Egg Groups */}
          <div className={styles.infoRow}>
            <span className={styles.infoLabel}>Egg Groups</span>
            <span className={styles.infoValue}>
              {[pokemon.eggGroup1, pokemon.eggGroup2].filter(Boolean).join(' / ') || '—'}
            </span>
          </div>
          {pokemon.height && (
            <div className={styles.infoRow}>
              <span className={styles.infoLabel}>Height</span>
              <span className={styles.infoValue}>
                {(pokemon.height / 10).toFixed(1)} m
                ({Math.floor(pokemon.height / 10 * 3.281)}′{Math.round((pokemon.height / 10 * 3.281 % 1) * 12)}″)
              </span>
            </div>
          )}

          {pokemon.weight && (
            <div className={styles.infoRow}>
              <span className={styles.infoLabel}>Weight</span>
              <span className={styles.infoValue}>
                {(pokemon.weight / 10).toFixed(1)} kg
                ({(pokemon.weight / 10 * 2.205).toFixed(1)} lbs)
              </span>
            </div>
          )}

          {/* Gender */}
          <div className={styles.infoRow}>
            <span className={styles.infoLabel}>Gender</span>
            <span className={styles.infoValue}>
              {formatGender(pokemon.gender1, pokemon.gender2)}
            </span>
          </div>

          {/* Gender Ratio */}
          {genderRatio && (
            <div className={styles.infoRow}>
              <span className={styles.infoLabel}>Gender Ratio</span>
              <span className={styles.infoValue}>{genderRatio}</span>
            </div>
          )}

          {/* Experience Group */}
          {pokemon.experienceGroup && (
            <div className={styles.infoRow}>
              <span className={styles.infoLabel}>Experience</span>
              <span className={styles.infoValue}>{pokemon.experienceGroup}</span>
            </div>
          )}

          {/* Generation */}
          {pokemon.generation && (
            <div className={styles.infoRow}>
              <span className={styles.infoLabel}>Generation</span>
              <span className={styles.infoValue}>{pokemon.generation}</span>
            </div>
          )}

          {/* Color */}
          {pokemon.color && (
            <div className={styles.infoRow}>
              <span className={styles.infoLabel}>Color</span>
              <span className={styles.infoValue}>{pokemon.color}</span>
            </div>
          )}

          {/* Flags */}
          {flags.length > 0 && (
            <div className={styles.infoRow}>
              <span className={styles.infoLabel}>Flags</span>
              <div className={styles.flags}>
                {flags.map(f => (
                  <span key={f} className={styles.flag}>{f}</span>
                ))}
              </div>
            </div>
          )}

        </div>
      </div>

      {/* Hidden Moves section */}
      {hiddenMoves.length > 0 && (
        <div className={styles.section}>
          <h2 className={styles.sectionTitle}>Hidden Moves</h2>
          <div className={styles.moveList}>
            {hiddenMoves.map(move => (
              <span key={move} className={styles.move}>{move}</span>
            ))}
          </div>
        </div>
      )}

    </div>
  )
}

export default PokemonDetailPage
