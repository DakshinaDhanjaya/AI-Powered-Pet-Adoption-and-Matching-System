// Local development defaults (localhost). In production these read from Vite env vars:
// VITE_API_BASE, VITE_AI_API_BASE, VITE_REC_API_BASE
export const API_BASE = import.meta.env.DEV
	? 'http://localhost:8080'
	: (import.meta.env.VITE_API_BASE || '')

export const AI_API_BASE = import.meta.env.DEV
	? 'http://localhost:5000'
	: (import.meta.env.VITE_AI_API_BASE || '')

export const REC_API_BASE = import.meta.env.DEV
	? 'http://localhost:5001'
	: (import.meta.env.VITE_REC_API_BASE || '')
