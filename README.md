# Raspberry Pi Time Machine — Guide

A vendor‑neutral guide for hosting a macOS **Time Machine** destination on a **Raspberry Pi** over **SMB**.

## Quick links
- **Full Guide (Markdown):** [`docs/RasPi-Time-Machine_Guide.md`](docs/RasPi-Time-Machine_Guide.md)
- **Collector script:** [`tools/collect-tm-docs.sh`](tools/collect-tm-docs.sh)

## What’s inside
- `docs/` — The primary guide you can read on GitHub or publish to GitHub Pages (MkDocs).
- `tools/collect-tm-docs.sh` — Helper script to collect configs/logs from your Pi (with safe redaction).
- `.gitignore`, `LICENSE` — Basics for a clean, portable repo.

## Getting started (local)

```bash
git clone https://github.com/sevmorris/raspi-time-machine-guide.git
cd raspi-time-machine-guide
# Edit docs as needed, then commit/push
```

## Contributing
Issues and PRs are welcome. Keep examples depersonalized using placeholders like `<username>`, `<pi-hostname>`, `192.168.X.Y`, `<workgroup>`, `<share-name>`.

---

## GitHub Pages (MkDocs)

This repo includes a MkDocs site and an Actions workflow to deploy to **GitHub Pages**.

### Enable Pages
1. Push to the **`master`** branch (or update the workflow to whichever branch you use).
2. In **Settings → Pages**, set:
   - **Source:** GitHub Actions
3. The workflow will publish to the `github-pages` environment. Your site will be live at:
   `https://<YOUR-USER>.github.io/raspi-time-machine-guide/`

### Local preview
```bash
python -m pip install --upgrade pip
python -m pip install mkdocs mkdocs-material
mkdocs serve
# open http://127.0.0.1:8000
```
