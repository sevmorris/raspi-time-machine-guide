# Raspberry Pi Time Machine — Guide

A vendor-neutral guide for hosting a macOS **Time Machine** destination on a **Raspberry Pi** over **SMB**.

**Read it here: https://sevmorris.github.io/raspi-time-machine-guide/**

## What's inside

- `docs/index.html` — the guide. A single self-contained page: build runbook, full
  `smb.conf` and `fstab`, macOS client setup, operations, a symptom-first
  troubleshooting playbook, and captured reference output from a working install.
- `docs/.nojekyll` — the page is hand-written HTML, so GitHub serves it as-is
  rather than running it through Jekyll.
- `tools/collect-tm-docs.sh` — collects configs and logs from the Pi, with redaction.

## Editing

The published page is `docs/index.html`. Edit it directly and push; GitHub Pages
serves `/docs` on `master` with no build step, so changes are live in under a minute.

```bash
git clone https://github.com/sevmorris/raspi-time-machine-guide.git
cd raspi-time-machine-guide
open docs/index.html          # preview locally — no server needed
```

This replaced an MkDocs site. The guide is now one file with no build
dependency, no Python toolchain, and nothing to keep in sync. The previous
Markdown source remains in the git history.

## Contributing

Issues and PRs welcome. Keep examples depersonalized — use placeholders like
`<username>`, `<pi-hostname>`, `<LAN_IP>`, `<share-name>`, and `<your-disk-uuid>`
rather than real hostnames, addresses, or disk identifiers.
