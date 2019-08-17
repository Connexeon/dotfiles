# Some basic env variables to bring color
# & consistent OK / FL / WA indicators.

export  N=$(tput sgr0)
export BD=$(tput bold)
export GR=$(tput setaf 2; tput bold)
export YE=$(tput setaf 3)
export  R=$(tput setaf 1)
export OK=" [$GR OK $N]\n"
export FL=" [$R FAILED $N]\n"
export WA=" [$R WARNING $N]\n"
