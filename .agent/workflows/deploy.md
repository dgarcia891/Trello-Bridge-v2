---
name: deploy
description: Secure Release (Tests + Version Bump + Build)
---
## Steps
1. **Security**: `node scripts/security_scan.js`
2. **Test**: `npm run test:unit`
3. **Version**: `node scripts/release.js patch`
4. **Push**: `git push origin main`
