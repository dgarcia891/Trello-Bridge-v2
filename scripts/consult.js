const fs = require('fs');
['docs/ORCHESTRATOR_MANIFEST.md', 'docs/logs/BUG_LOG.md'].forEach(f => {
    if (fs.existsSync(f)) console.log(`\n--- ${f} ---\n` + fs.readFileSync(f, 'utf8').slice(0, 1000));
});
