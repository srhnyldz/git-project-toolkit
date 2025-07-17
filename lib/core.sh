#!/bin/bash

# --- COLOR CODES ---
# Use tput for portability and to respect terminal capabilities
if command -v tput >/dev/null 2>&1 && [[ $(tput colors) -ge 8 ]]; then
    NC=$(tput sgr0)
    GREEN=$(tput setaf 2)
    YELLOW=$(tput setaf 3)
    RED=$(tput setaf 1)
    BLUE=$(tput setaf 4)
    CYAN=$(tput setaf 6)
    MAGENTA=$(tput setaf 5)
    WHITE=$(tput setaf 7)
    BOLD=$(tput bold)
    NORMAL=$(tput sgr0)
else
    # Fallback to raw ANSI codes if tput is not available or terminal has no color support
    NC='\033[0m' # No Color
    GREEN='\033[0;32m'
    YELLOW='\033[0;33m'
    RED='\033[0;31m'
    BLUE='\033[0;34m'
    CYAN='\033[0;36m'
    MAGENTA='\033[0;35m'
    WHITE='\033[1;37m'
    BOLD='\033[1m'
    NORMAL='\033[0m'
fi

# --- SETTINGS ---
DELIM=$'\x1F'

# --- LOGGING FUNCTIONS ---

# Generic message function (internal use)
_log() {
    local type="$1"
    local color="$2"
    local message="$3"
    echo -e "${color}${BOLD}${type}:${NORMAL}${NC} ${message}"
}

# User-facing logging functions
info() {
    _log "INFO" "${BLUE}" "$@"
}

success() {
    _log "SUCCESS" "${GREEN}" "$@"
}

warning() {
    _log "WARNING" "${YELLOW}" "$@"
}

error() {
    _log "ERROR" "${RED}" "$@"
}

# Export functions to be available in subshells
export -f _log info success warning error