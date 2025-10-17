#!/usr/bin/env bash
set -Eeuo pipefail

OUTFILE="${1:-tm-collector-$(date +%Y%m%d-%H%M%S).txt}"

redact() {
  sed -E     -e 's/[0-9]{1,3}(\.[0-9]{1,3}){3}/<LAN_IP>/g'     -e 's/(user(name)?=)[^ ]+/\1<USERNAME>/gi'     -e 's/(password|pass|secret|token)=\S+/\1=<REDACTED>/gi'     -e 's/([A-Za-z0-9._%+-]+)@([A-Za-z0-9.-]+\.[A-Za-z]{2,})/<EMAIL>/g'     -e 's/([[:<:]])sev([[:>:]])/<USERNAME>/gi'     -e 's/raspi/<PI-HOSTNAME>/gi'
}

log() { printf '=== %s ===\n' "$1" | tee -a "$OUTFILE" ; }

: > "$OUTFILE"

log "System"
{
  uname -a || true
  cat /etc/os-release || true
} | redact | tee -a "$OUTFILE"

log "Network"
{
  hostname -f 2>/dev/null || true
  ip -4 addr 2>/dev/null || true
} | redact | tee -a "$OUTFILE"

log "Samba"
{
  test -f /etc/samba/smb.conf && cat /etc/samba/smb.conf
  test -f /var/log/samba/log.smbd && tail -n 200 /var/log/samba/log.smbd
  systemctl status smbd 2>/dev/null || true
} | redact | tee -a "$OUTFILE"

log "Avahi (Bonjour)"
{
  test -f /etc/avahi/avahi-daemon.conf && cat /etc/avahi/avahi-daemon.conf
  systemctl status avahi-daemon 2>/dev/null || true
} | redact | tee -a "$OUTFILE"

log "Disks"
{
  lsblk -o NAME,FSTYPE,SIZE,MOUNTPOINT,MODEL 2>/dev/null || true
  df -h 2>/dev/null || true
} | redact | tee -a "$OUTFILE"

log "Users and groups (sanitized)"
{
  getent group sambashare 2>/dev/null || true
  getent passwd | awk -F: '{print $1":"$6}' | head -n 50
} | redact | tee -a "$OUTFILE"

echo
echo "Collected to: $OUTFILE"
