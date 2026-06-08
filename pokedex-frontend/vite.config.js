import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react'

export default defineConfig({
  plugins: [react()],
  server: {
    port: 5173,
    proxy: {
      // Forwards any request starting with /api to the Spring Boot backend.
      // This means in your React code you call '/api/pokemon/charizard'
      // and Vite silently forwards it to 'http://localhost:8080/api/pokemon/charizard'.
      // No CORS issues because the browser thinks it's talking to port 5173 the whole time.
      '/api': {
        target: 'http://localhost:8080',
        changeOrigin: true,
      },
    },
  },
})
