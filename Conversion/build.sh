#!/usr/bin/env bash
export SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
export TARGET_DIR="${SCRIPT_DIR}/../target"

# make sure that the TARGET_DIR exists
[[ ! -d "${TARGET_DIR}" ]] && mkdir -p "${TARGET_DIR}"

# List of scripts to compile as apps
scripts_to_apps=(
  Pages2Word-Drop
)

for script in "${scripts_to_apps[@]}"; do
  if [[ -f "${SCRIPT_DIR}/${script}.scpt" ]]; then
    echo "Compiling App ${TARGET_DIR}/${script}.app"
    osacompile -o "${TARGET_DIR}/${script}.app" "${SCRIPT_DIR}/${script}.scpt"
  else
    echo "ERROR: Missing Script ${SCRIPT_DIR}/${script}.scpt"
  fi
done