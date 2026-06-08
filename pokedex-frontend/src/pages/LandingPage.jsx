// =============================================================
//  pages/LandingPage.jsx — Game Selection Landing Page
// =============================================================

import { useState, useEffect } from 'react'
import { useNavigate } from 'react-router-dom'
import { getAllDexes } from '../api/dex'
import DEX_GROUPS from '../dexGroups'
import styles from './LandingPage.module.css'
import { getCaughtCount } from '../api/catch'

function LandingPage() {
  const [dexStats, setDexStats] = useState({})
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState(null)
  const navigate = useNavigate()
  const [groupCaughtCounts, setGroupCaughtCounts] = useState({})


  useEffect(() => {
    getAllDexes()
      .then(data => {
        const stats = {}
        data.forEach(d => {
          stats[d.dexKey] = {
            totalCount: d.totalCount,
            caughtCount: d.caughtCount,
          }
        })
        setDexStats(stats)
        setLoading(false)
      })

    // Fetch caught counts per group key separately
    Promise.all(
      DEX_GROUPS.map(group =>
        getCaughtCount(group.key).then(r => ({ key: group.key, count: r.count }))
      )
    ).then(counts => {
      const groupCounts = {}
      counts.forEach(({ key, count }) => {
        groupCounts[key] = count
      })
      setGroupCaughtCounts(groupCounts)
    })
  }, [])

  if (loading) return <div className={styles.message}>Loading dexes...</div>
  if (error) return <div className={styles.error}>{error}</div>

  // Calculate totals for a group by summing across all its dex keys
  const getGroupStats = (group) => {
    let total = 0
    let caught = 0
    group.sections.forEach(section => {
      section.dexKeys.forEach(key => {
        if (dexStats[key]) {
          total += dexStats[key].totalCount
        }
      })
    })
    // Caught count is stored under the group key not individual dex keys
    caught = groupCaughtCounts[group.key] || 0
    return { total, caught }
  }

  return (
    <div className={styles.page}>

      {/* Header */}
      <div className={styles.header}>
        <h1 className={styles.title}>Pokédex</h1>
        <p className={styles.subtitle}>Choose a game to view its Pokédex</p>
      </div>

      {/* Game grid */}
      <div className={styles.grid}>
        {DEX_GROUPS.map(group => {
          const { total, caught } = getGroupStats(group)
          const pct = total > 0 ? (caught / total) * 100 : 0

          return (
            <div
              key={group.key}
              className={styles.card}
              onClick={() => navigate(`/dex/${group.key}`)}
            >
              {/* Game image */}
              <div className={styles.imageContainer}>
                <img
                  className={styles.gameImage}
                  src={`/img/games/${group.key}.png`}
                  alt={group.name}
                  onError={e => { e.target.style.display = 'none' }}
                />
              </div>

              {/* Game info */}
              <div className={styles.info}>
                <h2 className={styles.name}>{group.name}</h2>

                {/* Section count hint */}
                {group.sections.length > 1 && (
                  <p className={styles.sections}>
                    {group.sections.length} sections
                  </p>
                )}

                {/* Progress */}
                <div className={styles.progress}>
                  <span className={styles.caught}>{caught} caught</span>
                  <span className={styles.divider}>/</span>
                  <span className={styles.total}>{total} total</span>
                </div>

                {/* Progress bar */}
                <div className={styles.progressBar}>
                  <div
                    className={styles.progressFill}
                    style={{ width: `${pct}%` }}
                  />
                </div>
              </div>
            </div>
          )
        })}
      </div>
    </div>
  )
}

export default LandingPage
