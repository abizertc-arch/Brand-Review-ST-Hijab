@echo off
REM ============================================================
REM Smack Touch Website Review — Windows launcher
REM Double-click this file to start a local server and open the site.
REM ============================================================

cd /d "%~dp0"

echo.
echo  ============================================
echo   SMACK TOUCH - WEBSITE REVIEW
echo  ============================================
echo.
echo  Starting local preview server...
echo.

REM Try Python 3 first (most common)
where python >nul 2>nul
if %errorlevel%==0 (
    echo  [Python found] Opening browser at http://localhost:8765
    echo  Press Ctrl+C in this window to stop the server.
    echo.
    start "" "http://localhost:8765/index.html"
    python -m http.server 8765
    goto :end
)

REM Fall back to Python launcher
where py >nul 2>nul
if %errorlevel%==0 (
    echo  [Python found via py launcher] Opening browser at http://localhost:8765
    echo  Press Ctrl+C in this window to stop the server.
    echo.
    start "" "http://localhost:8765/index.html"
    py -3 -m http.server 8765
    goto :end
)

REM Fallback: open index.html directly (videos may not play)
echo  [No Python found] Opening file directly in browser.
echo  WARNING: Some browsers block local video playback when opened
echo  this way. For best results, install Python from python.org.
echo.
start "" "index.html"

:end
pause
