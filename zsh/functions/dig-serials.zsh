# Query all nameservers for their serial
function dig-serials () {
  dig $1 +nssearch | cut -d' ' -f4,11
}
