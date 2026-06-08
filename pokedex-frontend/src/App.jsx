// =============================================================
//  App.jsx — Root Component
// =============================================================

import PokedexPage from './pages/PokedexPage'
import { BrowserRouter, Routes, Route } from 'react-router-dom'
import LandingPage from './pages/LandingPage'
import PokemonDetailPage from './pages/PokemonDetailPage'

// import PokedexPage from './pages/PokedexPage'
//
function App() {
  return (
    <BrowserRouter>
      <Routes>
        <Route path="/" element={<LandingPage />} />
        <Route path="/dex/:groupKey" element={<PokedexPage />} />
        <Route path="/pokemon/:slug" element={<PokemonDetailPage />} />  {/* ← ADD */}
      </Routes>
    </BrowserRouter>
  )
}

export default App
