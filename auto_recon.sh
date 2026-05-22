#!/bin/bash

BASE="$HOME/BB-Recon"
DATA="$BASE/bounty-targets-data/data/domains.txt"

echo "[+] Pulling latest targets..."

cd "$BASE/bounty-targets-data" || exit
git pull --quiet

echo "[+] Extracting newest 20 targets..."

tail -100 "$DATA" \
| sort -u \
> "$BASE/new_targets.txt"

TOTAL=$(wc -l < "$BASE/new_targets.txt")

echo "[+] Targets selected: $TOTAL"

echo "[+] Running httpx..."

cat "$BASE/new_targets.txt" | httpx \
-silent \
-follow-redirects \
-threads 50 \
-timeout 10 \
-o "$BASE/live_targets.txt"

LIVE=$(wc -l < "$BASE/live_targets.txt")

echo
echo "========== RESULTS =========="
echo "Selected Targets : $TOTAL"
echo "Live Targets     : $LIVE"
echo "============================="
echo

cat "$BASE/live_targets.txt"
