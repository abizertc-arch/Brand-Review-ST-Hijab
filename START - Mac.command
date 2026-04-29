#!/bin/bash
# ============================================================
# Smack Touch Website Review — Mac launcher
# Double-click this file to start a local server and open the site.
# ============================================================

cd "$(dirname "$0")"

echo ""
echo "  ============================================"
echo "   SMACK TOUCH - WEBSITE REVIEW"
echo "  ============================================"
echo ""
echo "  Starting local preview server..."
echo ""

# Open browser in background
sleep 1 && open "http://localhost:8765/index.html" &

# Try Python 3
if command -v python3 >/dev/null 2>&1; then
    echo "  [Python 3 found] Opening browser at http://localhost:8765"
    echo "  Press Ctrl+C to stop the server."
    echo ""
    python3 -m http.server 8765
elif command -v python >/dev/null 2>&1; then
    echo "  [Python found] Opening browser at http://localhost:8765"
    echo "  Press Ctrl+C to stop the server."
    echo ""
    python -m http.server 8765
else
    echo "  [No Python found] Opening file directly."
    echo "  Some browsers block local video playback when opened this way."
    open "index.html"
fi
