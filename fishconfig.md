# Fish shell configuration

## Configurating fish prompt 

### Git branch + fish prompt

```fish
function fish_prompt
    set -l git_branch (git branch ^/dev/null | sed -n '/* /s///p')
    echo -n (whoami)'@'(hostname)':'(prompt_pwd)'{'"git_branch"'}  '
end
```

