#!/bin/bash

set -e
set -o pipefail

_DIR=$(dirname "$(readlink -e "${0}")")

echo Zakładam linki:
for file in .gitconfig .gitignore .tmux.conf .vimrc
do
  echo -n '*' "${file}: "
  [[ ! -f "${file}" ]] && {
    ln -fs "${_DIR}/${file}" ~/"${file}"
    echo OK
  } || {
    echo istnieje
  }
done

echo -n "Konfiguracja lokalna GITa: "
[[ ! -e ~/.gitconfig_private ]] && {

cat <<EOF > ~/.gitconfig_private
[user]
#   name        = Gal Anonim
#   email       = GalAnonim@mail
EOF
echo OK
echo
echo Ustaw swoje dane osobowe w ~/.gitconfig_private
echo

} || {
  echo istnieje
}

echo -n "Prompt Oh My Bash: "
[[ ! -d ~/.oh-my-bash ]] && {
  echo
  bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh | sed 's/exec bash.*$/exec bash -c true/')"
  sed -i 's/^OSH_THEME=.*$/OSH_THEME="morris"/' ~/.bashrc
  sed -i 's/^.*DISABLE_AUTO_UPDATE=.*$/DISABLE_AUTO_UPDATE="true"/' ~/.bashrc
  sed -i 's/\${TITLEBAR}//' ~/.oh-my-bash/themes/morris/morris.theme.sh
  echo Uruchom ponownie powłokę BASH lub zastosuj polecenie: source ~/.bashrc
} || {
  echo istnieje
}

echo Koniec
