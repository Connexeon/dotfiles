# IP addresses
alias ippub="dig +short myip.opendns.com @resolver1.opendns.com"
alias iploc="ifconfig -a | perl -nle'/(\d+\.\d+\.\d+\.\d+)/ && print $1'"
