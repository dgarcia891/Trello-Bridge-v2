# Orchestrator Manifest (v21.1)
## 1. Chrome Constraints (Manifest V3)
- **Runtime:** Service Workers ONLY (No background pages).
- **State:** `chrome.storage.local` ONLY. Global variables are forbidden (they die on sleep).
- **Security:** CSP Strict. No `eval()`. No inline scripts.
- **Async:** All `chrome.runtime.sendMessage` must check `chrome.runtime.lastError`.

## 2. The Two-Strike Rule
- Attempt 1: Fix bug.
- Attempt 2: Fix bug.
- **FAILURE:** STOP. Spawn Research Agent. Do not loop.

## 3. The 500-Line Limit
- Any file > 500 lines MUST be refactored.
