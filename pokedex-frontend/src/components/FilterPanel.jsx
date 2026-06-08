import styles from './FilterPanel.module.css'

function FilterPanel({ filters, setFilters, clearFilters }) {

    return (
        <div className={styles.panel}>
            <div className={styles.header}>
                <h2 className={styles.title}>Filters</h2>
                <button className={styles.clearBtn} onClick={clearFilters}>
                    Clear all
                </button>
            </div>

            {/* Type filter — text input */}
            <div className={styles.group}>
                <label className={styles.label}>Type</label>
                <input
                    className={styles.input}
                    type="text"
                    placeholder="e.g. fire"
                    value={filters.type || ''}
                    onChange={e => setFilters(prev => ({
                        ...prev,
                        type: e.target.value || null
                    }))}
                />
            </div>

            {/* Generation filter — number input */}
            <div className={styles.group}>
                <label className={styles.label}>Generation</label>
                <input
                    className={styles.input}
                    type="number"
                    placeholder="1-9"
                    min="1"
                    max="9"
                    value={filters.generation || ''}
                    onChange={e => setFilters(prev => ({
                        ...prev,
                        generation: e.target.value ? Number(e.target.value) : null
                    }))}
                />
            </div>

            {/* Checkbox filters */}
            <div className={styles.group}>
                <label className={styles.label}>Special</label>

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

                <label className={styles.checkLabel}>
                    <input
                        type="checkbox"
                        checked={filters.baseFormOnly || false}
                        onChange={e => setFilters(prev => ({
                            ...prev,
                            baseFormOnly: e.target.checked || null
                        }))}
                    />
                    Base forms only
                </label>
            </div>

        </div>
    )
}

export default FilterPanel