---
name: webapp-testing
description: Toolkit for interacting with and testing local web applications using agent-browser. Supports verifying frontend functionality, debugging UI behavior, capturing browser screenshots, and viewing browser logs.
license: Complete terms in LICENSE.txt
---

Adapted for Casama (Apache-2.0). `agent-browser` and Chromium are already installed on the computer — do not install Python `playwright` or download a second browser.

# Web Application Testing

To test local web applications, use `agent-browser` (or the `browser.*` tools).

**Helper Scripts Available**:
- `scripts/with_server.py` - Manages server lifecycle (supports multiple servers)

**Always run scripts with `--help` first** to see usage.

## Decision Tree: Choosing Your Approach

```
User task → Is it static HTML?
    ├─ Yes → Read HTML file directly, or serve locally and inspect with agent-browser
    └─ No (dynamic webapp) → Is the server already running?
        ├─ No → Start it with `python3 scripts/with_server.py --server "<cmd>" --port <port> -- <test script>`
        └─ Yes → Reconnaissance-then-action with agent-browser:
            1. Open the URL and wait for networkidle
            2. Take an interactive snapshot or screenshot
            3. Identify refs/selectors from rendered state
            4. Click, fill, and verify
```

## Example: Using `agent-browser`

```bash
agent-browser open http://localhost:5173
agent-browser wait --load networkidle
agent-browser snapshot -i
agent-browser screenshot /tmp/inspect.png
agent-browser console
agent-browser errors
```

With `scripts/with_server.py`:

```bash
python3 scripts/with_server.py \
  --server "npm run dev" --port 5173 -- \
  bash -lc 'agent-browser open http://localhost:5173 && agent-browser wait --load networkidle && agent-browser snapshot -i'
```

## Best Practices

- Never run `pip install playwright` or `playwright install` — `agent-browser` is already installed and uses the system browser.
- Wait for `networkidle` before snapshotting dynamic SPAs.
- Use `agent-browser snapshot -i` to discover interactive element refs (`@e1`, `@e2`, …) before clicking or typing.
- Keep at most 4 tabs open to stay within the computer's memory budget.
