function ls --wraps='exa -lgh --icons' --description 'alias ls=exa -lgh --icons'
  exa -lgh --icons $argv; 
end
