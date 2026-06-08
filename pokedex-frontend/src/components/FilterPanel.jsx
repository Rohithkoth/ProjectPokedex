import { useState } from 'react'
import styles from './FilterPanel.module.css'

function FilterPanel({ filters, setFilters, clearFilters, caughtFilter, setCaughtFilter }) {
    const ALL_TYPES = [
        'normal', 'fire', 'water', 'electric', 'grass', 'ice',
        'fighting', 'poison', 'ground', 'flying', 'psychic', 'bug',
        'rock', 'ghost', 'dragon', 'dark', 'steel', 'fairy'
    ]

    const [typeMode, setTypeMode] = useState('or')
    const ALL_GENERATIONS = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    const handleTypeChange = (type, checked) => {
        if (typeMode === 'or') {
            setFilters(prev => ({
                ...prev,
                typeOrList: checked
                    ? [...prev.typeOrList, type]
                    : prev.typeOrList.filter(t => t !== type)
            }))
        } else {
            setFilters(prev => {
                if (!checked) {
                    return {
                        ...prev,
                        typeAnd1: prev.typeAnd1 === type ? null : prev.typeAnd1,
                        typeAnd2: prev.typeAnd2 === type ? null : prev.typeAnd2,
                    }
                }
                if (!prev.typeAnd1) return { ...prev, typeAnd1: type }
                if (!prev.typeAnd2) return { ...prev, typeAnd2: type }
                return prev // already 2 selected, ignore
            })
        }
    }

    return (
        <div className={styles.panel}>
            <div className={styles.header}>
                <h2 className={styles.title}>Filters</h2>
                <button className={styles.clearBtn} onClick={clearFilters}>
                    Clear all
                </button>
            </div>

            {/* Type filter — AND/OR mode with checkboxes */}
            <div className={styles.group}>
                <label className={styles.label}>Type</label>

                <div className={styles.modeToggle}>
                    <label className={styles.radioLabel}>
                        <input
                            type="radio"
                            name="typeMode"
                            value="or"
                            checked={typeMode === 'or'}
                            onChange={() => {
                                setTypeMode('or')
                                setFilters(prev => ({
                                    ...prev,
                                    typeAnd1: null,
                                    typeAnd2: null,
                                    typeOrList: []
                                }))
                            }}
                        />
                        Any of these (OR)
                    </label>
                    <label className={styles.radioLabel}>
                        <input
                            type="radio"
                            name="typeMode"
                            value="and"
                            checked={typeMode === 'and'}
                            onChange={() => {
                                setTypeMode('and')
                                setFilters(prev => ({
                                    ...prev,
                                    typeAnd1: null,
                                    typeAnd2: null,
                                    typeOrList: []
                                }))
                            }}
                        />
                        Combination (AND)
                    </label>
                </div>

                <div className={styles.typeGrid}>
                    {ALL_TYPES.map(type => (
                        <label key={type} className={styles.typeChip}>
                            <input
                                type="checkbox"
                                checked={
                                    typeMode === 'and'
                                        ? filters.typeAnd1 === type || filters.typeAnd2 === type
                                        : filters.typeOrList.includes(type)
                                }
                                onChange={e => handleTypeChange(type, e.target.checked)}
                            />
                            {type}
                        </label>
                    ))}
                </div>

                {typeMode === 'and' && (
                    <p className={styles.hint}>Select exactly 2 types.</p>
                )}
            </div>

            {/* Generation filter — checkboxes */}
            <div className={styles.group}>
                <label className={styles.label}>Generation</label>
                <div className={styles.typeGrid}>
                    {ALL_GENERATIONS.map(g => (
                        <label key={g} className={styles.typeChip}>
                            <input
                                type="checkbox"
                                checked={
                                    !filters.generationList ||
                                    filters.generationList.length === 0 ||
                                    filters.generationList.includes(g)
                                }
                                onChange={e => {
                                    const current = filters.generationList &&
                                        filters.generationList.length > 0
                                        ? filters.generationList
                                        : ALL_GENERATIONS

                                    const next = e.target.checked
                                        ? [...current, g]
                                        : current.filter(x => x !== g)
                                    console.log('generationList next:', next)  // ← ADD THIS

                                    // If all 9 selected reset to null (no filter)
                                    setFilters(prev => ({
                                        ...prev,
                                        generationList: next.length === 9 ? null : next
                                    }))
                                }}
                            />
                            Gen {g}
                        </label>
                    ))}
                </div>
            </div>

            {/* Show/hide toggles */}
            <div className={styles.group}>
                <label className={styles.label}>Show</label>
                <div className={styles.dropdownGroup}>
                    <label className={styles.checkLabel}>
                        <input
                            type="checkbox"
                            checked={!filters.excludeMega}
                            onChange={e => setFilters(prev => ({
                                ...prev,
                                excludeMega: e.target.checked ? null : true
                            }))}
                        />
                        Show Mega forms
                    </label>
                    <label className={styles.checkLabel}>
                        <input
                            type="checkbox"
                            checked={!filters.excludeGmax}
                            onChange={e => setFilters(prev => ({
                                ...prev,
                                excludeGmax: e.target.checked ? null : true
                            }))}
                        />
                        Show Gigantamax forms
                    </label>
                    <label className={styles.checkLabel}>
                        <input
                            type="checkbox"
                            checked={!filters.baseFormOnly}
                            onChange={e => setFilters(prev => ({
                                ...prev,
                                baseFormOnly: e.target.checked ? null : true
                            }))}
                        />
                        Show Misc. Forms
                    </label>
                </div>


            </div>

            {/* Checkbox filters */}
            <div className={styles.group}>
                <label className={styles.label}>Special</label>
                <div className={styles.dropdownGroup}>

                    <label className={styles.checkLabel}>
                        <input
                            type="checkbox"
                            checked={filters.legendary || false}
                            onChange={e => setFilters(prev => ({
                                ...prev,
                                legendary: e.target.checked || null
                            }))}
                        />
                        Legendary only
                    </label>

                    <label className={styles.checkLabel}>
                        <input
                            type="checkbox"
                            checked={filters.mythical || false}
                            onChange={e => setFilters(prev => ({
                                ...prev,
                                mythical: e.target.checked || null
                            }))}
                        />
                        Mythical only
                    </label>

                    <label className={styles.checkLabel}>
                        <input
                            type="checkbox"
                            checked={filters.mega || false}
                            onChange={e => setFilters(prev => ({
                                ...prev,
                                mega: e.target.checked || null
                            }))}
                        />
                        Mega forms only
                    </label>

                    <label className={styles.checkLabel}>
                        <input
                            type="checkbox"
                            checked={filters.paradox || false}
                            onChange={e => setFilters(prev => ({
                                ...prev,
                                paradox: e.target.checked || null
                            }))}
                        />
                        Paradox only
                    </label>


                </div>

            </div>

            {/* Caught filter */}
            <div className={styles.group}>
                <label className={styles.label}>Caught Status</label>
                <div className={styles.caughtToggle}>
                    {['all', 'caught', 'uncaught'].map(option => (
                        <button
                            key={option}
                            className={`${styles.caughtOption} ${caughtFilter === option ? styles.caughtOptionActive : ''}`}
                            onClick={() => setCaughtFilter(option)}
                        >
                            {option === 'all' ? 'All' : option === 'caught' ? '🔴 Caught' : '⚪ Not Caught'}
                        </button>
                    ))}
                </div>
            </div>

        </div>
    )
}

export default FilterPanel