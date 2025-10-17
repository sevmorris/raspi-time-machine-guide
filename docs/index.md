# Raspberry Pi Time Machine — Guide

This site explains how to run a **macOS Time Machine** destination on a **Raspberry Pi** over **SMB**. It focuses on a clean, vendor‑neutral configuration using Debian/Raspberry Pi OS packages.

## Start here
- Read the full walkthrough: **[Guide](RasPi-Time-Machine_Guide.md)**
- Use generic placeholders in commands:
  - `<username>` (your Linux user)
  - `<pi-hostname>` (e.g., `raspi`)
  - `192.168.X.Y` (your LAN IP)
  - `<share-name>` (e.g., `TimeMachine`)

## Why depersonalize?
Keeping examples generic prevents accidental leakage of personal data and makes the guide easier to reuse.

> Tip: If you copy/paste debug output, scrub usernames, hostnames, emails, IPs, and tokens first.
