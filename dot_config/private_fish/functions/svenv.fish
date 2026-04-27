function svenv --wraps='source .venv/bin/activate.fish' --description 'alias svenv source .venv/bin/activate.fish'
    source .venv/bin/activate.fish $argv
end
