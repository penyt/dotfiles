# nvm lazy load
# - Prepend the default node's bin to PATH so node/npm/npx and global CLIs work
#   immediately without loading nvm
# - Source nvm.sh only on the first `nvm` call (saves ~0.3-1s of startup time)

export NVM_DIR="${NVM_DIR:-$HOME/.nvm}"
[[ -s "$NVM_DIR/nvm.sh" ]] || return 0
(( $+functions[nvm] )) && return 0   # skip if nvm was already loaded elsewhere

# Resolve the default alias (e.g. "24" or "v24.14.1") to the newest matching installed version
() {
  local alias_def ver
  local -a cands
  [[ -r "$NVM_DIR/alias/default" ]] && alias_def="$(<"$NVM_DIR/alias/default")"
  alias_def="${alias_def#v}"
  if [[ -n "$alias_def" && "$alias_def" == [0-9]* ]]; then
    cands=("$NVM_DIR"/versions/node/v${alias_def}(|.*)(N/nOn))
  fi
  # Fall back to the newest installed version if the alias can't be resolved (lts/*, node, ...)
  (( $#cands )) || cands=("$NVM_DIR"/versions/node/v*(N/nOn))
  (( $#cands )) || return
  ver="${cands[1]}"
  path=("$ver/bin" $path)
  export NVM_BIN="$ver/bin"
}

nvm() {
  unfunction nvm
  source "$NVM_DIR/nvm.sh"
  [[ -s "$NVM_DIR/bash_completion" ]] && source "$NVM_DIR/bash_completion"
  nvm "$@"
}
