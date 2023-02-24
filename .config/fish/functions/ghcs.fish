function ghcs --wraps='gh repo create --private --source=. --push' --description 'alias ghcs gh repo create --private --source=. --push'
  gh repo create --private --source=. --push $argv; 
end
