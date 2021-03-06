# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/Users/specoul/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"


### Aliase perso
alias richou="sudo docker-compose up" 
alias am="/Users/specoul/workspace/FDJ/Appli-Maitre"
alias jordan="/Users/specoul/workspace/tickandlive-ios"
alias fuckxcode="pkill Xcode; pkill launchd_sim; opx"  
alias nexity="/Users/specoul/workspace/nexity-ios"
### Scripts perso


## Git checkout sur un repo iOS avec cocoapod
## Le script est chargé de vérifier le podfile.lock et de lancer un pod install si il n’est pas bon
co(){

  ### Couleurs
  RED='\033[0;31m'
  BLUE='\033[1;34m'
  GREEN='\033[1;32m'
  NC='\033[0m' # No Color

  if [ -z "$1" ];  then
	  echo -e "${RED}missing branch name${NC}"
    return
  fi   
  
  git checkout $1
  
  if [ -f "Podfile.lock" ]; then
  
    diff "Podfile.lock" "Pods/Manifest.lock" > /dev/null
    if [ $? != 0 ] ; then
      echo "${BLUE}Sandbox not sync with Podfile.lock"
      echo "We run pod install${NC}"
      pod install
      echo "${GREEN}Sandbox is synced with project${NC}"
    else 
        echo "${BLUE}Sandbox is synced with project no need to run pod install${NC}"  
    fi

  else
    echo "${BLUE}Pas de Podfile.lock, on ne fait rien ${NC}"  
  fi

}

## Ouvre un deepLink sur le simu IOS 
## $1 -> lien du deepLink
dl(){
  xcrun simctl openurl booted $1
}

## Ouvre le Xcworkspace
opx(){
  ll=$(ls | grep *.xcworkspace); open $ll
}



