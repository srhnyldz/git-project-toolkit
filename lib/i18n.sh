#!/bin/bash

# Loads language settings
load_language() {
    local lang_code="$1"
    local script_dir="$2"
    local default_lang="en"

    if [ -z "$lang_code" ]; then
        lang_code="en"
    fi

    local lang_file="${script_dir}/../lang/lang_${lang_code}.sh"

    if [ -f "$lang_file" ]; then
        source "$lang_file"
    else
        source "${script_dir}/../lang/lang_${default_lang}.sh"
    fi
}