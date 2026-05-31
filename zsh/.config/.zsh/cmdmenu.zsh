cmdmenu() {
  local file first label category selected cmd_escaped cmd

  file="$HOME/.config/cmdmenu/commands.sh"

  first=$(
    awk '
      BEGIN {
        RS = ""
        FS = "\n"
      }

      NF >= 2 {
        desc = $1
        sub(/^#[[:space:]]*/, "", desc)

        cmd = ""
        for (i = 2; i <= NF; i++) {
          if (cmd == "") {
            cmd = $i
          } else {
            cmd = cmd "\n" $i
          }
        }

        out = cmd
        gsub(/\\/, "\\\\", out)
        gsub(/\n/, "\\n", out)

        if (desc ~ /\//) {
          cat = desc
          sub("/.*", "", cat)

          if (!seen_cat[cat]++) {
            print cat "/\t"
          }
        } else {
          print desc "\t" out
        }
      }
    ' "$file" |
    fzf \
      --height 40% \
      --layout=reverse \
      --border \
      --prompt="cmd > " \
      --delimiter=$'\t' \
      --with-nth=1 \
      --preview='printf "%b\n" {2}' \
      --preview-window=down:6:wrap
  ) || return

  label="${first%%$'\t'*}"

  if [[ "$label" != */ ]]; then
    cmd_escaped="${first#*$'\t'}"
    cmd=$(printf "%b" "$cmd_escaped")

    LBUFFER="$cmd"
    CURSOR=${#BUFFER}
    zle redisplay
    return
  fi

  category="${label%/}"

  selected=$(
    awk -v target="$category" '
      BEGIN {
        RS = ""
        FS = "\n"
      }

      NF >= 2 {
        desc = $1
        sub(/^#[[:space:]]*/, "", desc)

        if (desc ~ /\//) {
          cat = desc
          sub("/.*", "", cat)

          title = desc
          sub("^[^/]*/", "", title)
        } else {
          next
        }

        if (cat == target) {
          cmd = ""
          for (i = 2; i <= NF; i++) {
            if (cmd == "") {
              cmd = $i
            } else {
              cmd = cmd "\n" $i
            }
          }

          out = cmd
          gsub(/\\/, "\\\\", out)
          gsub(/\n/, "\\n", out)

          print title "\t" out
        }
      }
    ' "$file" |
    fzf \
      --height 40% \
      --layout=reverse \
      --border \
      --prompt="$category > " \
      --delimiter=$'\t' \
      --with-nth=1 \
      --preview='printf "%b\n" {2}' \
      --preview-window=down:6:wrap
  ) || return

  cmd_escaped="${selected#*$'\t'}"
  cmd=$(printf "%b" "$cmd_escaped")

  LBUFFER="$cmd"
  CURSOR=${#BUFFER}
  zle redisplay
}

zle -N cmdmenu
bindkey '^G' cmdmenu
