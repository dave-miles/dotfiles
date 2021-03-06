# load custom executable functions
for function in ~/.zsh/functions/*; do
  source $function
done

# extra files in ~/.zsh/configs/pre , ~/.zsh/configs , and ~/.zsh/configs/post
# these are loaded first, second, and third, respectively.
_load_settings() {
  _dir="$1"
  if [ -d "$_dir" ]; then
    if [ -d "$_dir/pre" ]; then
      for config in "$_dir"/pre/**/*(N-.); do
        if [ ${config:e} = "zwc" ] ; then continue ; fi
        . $config
      done
    fi

    for config in "$_dir"/**/*(N-.); do
      case "$config" in
        "$_dir"/pre/*)
          :
          ;;
        "$_dir"/post/*)
          :
          ;;
        *)
          if [[ -f $config && ${config:e} != "zwc" ]]; then
            . $config
          fi
          ;;
      esac
    done

    if [ -d "$_dir/post" ]; then
      for config in "$_dir"/post/**/*(N-.); do
        if [ ${config:e} = "zwc" ] ; then continue ; fi
        . $config
      done
    fi
  fi
}
_load_settings "$HOME/.zsh/configs"

# Local config
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local

# aliases
[[ -f ~/.aliases ]] && source ~/.aliases

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /home/dmiles/.asdf/installs/nodejs/9.8.0/.npm/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh ]] && . /home/dmiles/.asdf/installs/nodejs/9.8.0/.npm/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /home/dmiles/.asdf/installs/nodejs/9.8.0/.npm/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh ]] && . /home/dmiles/.asdf/installs/nodejs/9.8.0/.npm/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh
# tabtab source for slss package
# uninstall by removing these lines or running `tabtab uninstall slss`
[[ -f /home/dmiles/.asdf/installs/nodejs/9.8.0/.npm/lib/node_modules/serverless/node_modules/tabtab/.completions/slss.zsh ]] && . /home/dmiles/.asdf/installs/nodejs/9.8.0/.npm/lib/node_modules/serverless/node_modules/tabtab/.completions/slss.zsh