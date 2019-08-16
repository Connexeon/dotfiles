# IP addresses
alias extip="dig +short myip.opendns.com @resolver1.opendns.com"
alias locips="ifconfig -a | perl -nle'/(\d+\.\d+\.\d+\.\d+)/ && print $1'"
