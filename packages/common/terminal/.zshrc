
export PATH=$PATH:$HOME/scripts
#export GIT_CLONE_PATH="$HOME"/projects/github.com
export GITHUB_PATH="$HOME"/projects/github.com

os_type="$(uname)"
arch_name="$(uname -m)"
echo ">>> ${os_type}/${arch_name} <<<"

# Homebrew, asdf-vm
if [ "${os_type}" = "Darwin" ]; then
    # macOS
    if [ "${arch_name}" = "x86_64" ]; then
        # Intel 
        if [ -f "/usr/local/bin/brew"  ]; then
            eval "$(/usr/local/bin/brew shellenv)"
            . $(brew --prefix asdf)/libexec/asdf.sh
        fi
    elif [ "${arch_name}" = "arm64" ]; then
        # ARM
        if [ -f "/opt/homebrew/bin/brew"  ]; then
            eval "$(/opt/homebrew/bin/brew shellenv)"
            . $(brew --prefix asdf)/libexec/asdf.sh
        fi
    fi
elif [ "${os_type}" = "Linux" ]; then
    # Linux
    if [ -f "/home/linuxbrew/.linuxbrew/bin/brew"  ]; then
        eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
        . $(brew --prefix asdf)/libexec/asdf.sh
        #. /opt/asdf-vm/asdf.sh
    fi
fi

if [ "${os_type}" = "Darwin" ]; then
    alias code="open -a 'Visual Studio Code'"
    alias lldlib="open ~/Library/Application\ Support/Electron"
    alias sim="open /Applications/Xcode.app/Contents/Developer/Applications/Simulator.app/"
    alias keycodes="cat /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/System/Library/Frameworks/Carbon.framework/Versions/A/Frameworks/HIToolbox.framework/Versions/A/Headers/Events.h"
    alias syncsh=". syncsh"
    alias cdrepo=". cdrepo"
    alias lscmd="ls ~/scripts"
    alias pr="gh pr view --web"
    alias prysm="~/prysm/prysm.sh"
fi

# Override
if [ -n "$(which z)" ]; then
    alias cd="z"
fi

if [ -n "$(which exa)" ]; then
    alias ls="exa"
fi

alias cat="bat"
alias ll="ls -lah --git"
alias lt="ll -TL 3 --ignore-glob=.git"
alias ps="procs"
alias top="ytop"
alias vi="nvim"
alias du="dust"

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"

export GPG_TTY=$(tty)

export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:$ANDROID_HOME/cmdline-tools/latest/bin

export PATH=$PATH:$(yarn global bin)
export FZF_DEFAULT_COMMAND="rg --files --hidden -l -g '!.git/*' -g '!node_modules/*'"
export FZF_DEFAULT_OPTS="-m --height 100% --border --preview 'cat {}'"

#. $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
# source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc'
# source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc'
bindkey '^e' autosuggest-accept

export PATH=$PATH:$GITHUB_PATH/dotfiles/packages/common/cli/scripts

export LF_ICONS="\
tw=:\
st=:\
ow=:\
dt=:\
di=:\
fi=:\
ln=:\
or=:\
ex=:\
*.c=:\
*.cc=:\
*.clj=:\
*.coffee=:\
*.cpp=:\
*.css=:\
*.d=:\
*.dart=:\
*.erl=:\
*.exs=:\
*.fs=:\
*.go=:\
*.h=:\
*.hh=:\
*.hpp=:\
*.hs=:\
*.html=:\
*.java=:\
*.jl=:\
*.js=:\
*.json=:\
*.lua=:\
*.md=:\
*.php=:\
*.pl=:\
*.pro=:\
*.py=:\
*.rb=:\
*.rs=:\
*.scala=:\
*.ts=:\
*.vim=:\
*.cmd=:\
*.ps1=:\
*.sh=:\
*.bash=:\
*.zsh=:\
*.fish=:\
*.tar=:\
*.tgz=:\
*.arc=:\
*.arj=:\
*.taz=:\
*.lha=:\
*.lz4=:\
*.lzh=:\
*.lzma=:\
*.tlz=:\
*.txz=:\
*.tzo=:\
*.t7z=:\
*.zip=:\
*.z=:\
*.dz=:\
*.gz=:\
*.lrz=:\
*.lz=:\
*.lzo=:\
*.xz=:\
*.zst=:\
*.tzst=:\
*.bz2=:\
*.bz=:\
*.tbz=:\
*.tbz2=:\
*.tz=:\
*.deb=:\
*.rpm=:\
*.jar=:\
*.war=:\
*.ear=:\
*.sar=:\
*.rar=:\
*.alz=:\
*.ace=:\
*.zoo=:\
*.cpio=:\
*.7z=:\
*.rz=:\
*.cab=:\
*.wim=:\
*.swm=:\
*.dwm=:\
*.esd=:\
*.jpg=:\
*.jpeg=:\
*.mjpg=:\
*.mjpeg=:\
*.gif=:\
*.bmp=:\
*.pbm=:\
*.pgm=:\
*.ppm=:\
*.tga=:\
*.xbm=:\
*.xpm=:\
*.tif=:\
*.tiff=:\
*.png=:\
*.svg=:\
*.svgz=:\
*.mng=:\
*.pcx=:\
*.mov=:\
*.mpg=:\
*.mpeg=:\
*.m2v=:\
*.mkv=:\
*.webm=:\
*.ogm=:\
*.mp4=:\
*.m4v=:\
*.mp4v=:\
*.vob=:\
*.qt=:\
*.nuv=:\
*.wmv=:\
*.asf=:\
*.rm=:\
*.rmvb=:\
*.flc=:\
*.avi=:\
*.fli=:\
*.flv=:\
*.gl=:\
*.dl=:\
*.xcf=:\
*.xwd=:\
*.yuv=:\
*.cgm=:\
*.emf=:\
*.ogv=:\
*.ogx=:\
*.aac=:\
*.au=:\
*.flac=:\
*.m4a=:\
*.mid=:\
*.midi=:\
*.mka=:\
*.mp3=:\
*.mpc=:\
*.ogg=:\
*.ra=:\
*.wav=:\
*.oga=:\
*.opus=:\
*.spx=:\
*.xspf=:\
*.pdf=:\
*.nix=:\
"