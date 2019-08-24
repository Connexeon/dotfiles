# Check if dependencies are installed & install if needed
# __check_deps

# & consistent OK / FL / WA indicators.
# Some basic env variables to bring color

export  N=$(tput sgr0)
export BD=$(tput bold)
export GR=$(tput setaf 2; tput bold)
export YE=$(tput setaf 3)
export  R=$(tput setaf 1)
export OK="$GR 🆗$N\n"
export FL="$R ✗$N\n"
export WA="$R ❗️$N\n"
export NX="$BD➜$N "
