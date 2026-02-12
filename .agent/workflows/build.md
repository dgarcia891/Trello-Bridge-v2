---
name: build
description: Parallel Swarm Execution (Tests + Code)
---
## Steps
1. **Context Load**: `node scripts/consult.js`
2. **Drift Check**: `node scripts/drift_check.js` (Ensure Arch alignment)
3. **Swarm Spawn**:
   - **Mock-Writer**: "Write jest-chrome unit tests in `tests/unit/` based on `architecture.md`."
   - **Builder**: "Write the implementation code in `src/` to pass the tests."
4. **Integration**:
   - Run: `npm run test:unit`
   - If fail: Trigger `/fix`.
