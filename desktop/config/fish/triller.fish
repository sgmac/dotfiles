set -x VAULT_ADDR http://localhost:8200


function _og
   cat ~/.triller/github.repos | fzf +s | xargs -I {} xdg-open  "https://github.com/TrillerCo/{}"   
end

function _trillerfish
  vim ~/.config/fish/triller.fish
end

function _showcert
  openssl x509 -in $argv -notext -noout
end


function _hubclone
  hub clone TrillerCo/$argv
end
