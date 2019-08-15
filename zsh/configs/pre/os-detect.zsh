####################################################################
# Get System Info
####################################################################
#
# # Determine OS platform
# UNAME=$(uname | tr "[:upper:]" "[:lower:]")
# # If Linux, try to determine specific distribution
# if [ "$UNAME" = "linux" ]; then
#   # If available, use LSB to identify distribution
#   if [ -f /etc/lsb-release -o -d /etc/lsb-release.d ]; then
#     export DISTRO=$(lsb_release -i | cut -d: -f2 | sed s/'^\t'// | tr "[:upper:]" "[:lower:]")
#     # Otherwise, use release de file
#   else
#     export DISTRO=$(ls -d /etc/[A-Za-z]*[_-][rv]e[lr]* | grep -v "lsb" | cut -d'/' -f3 | cut -d'-' -f1 | cut -d'_' -f1 | tr "[:upper:]" "[:lower:]")
#   fi
# fi
#
# # For everything else (or if above failed), just use generic identifier
# [ "$DISTRO" = "" ] && export DISTRO=$UNAME
# unset UNAME


# OS detection
case $(uname) in
    Darwin)
      OS='OSX'
      ;;
    CYGWIN_NT-* | MSYS_NT-*)
      OS='Windows'
      ;;
    FreeBSD)
      OS='BSD'
      ;;
    OpenBSD)
      OS='BSD'
      ;;
    DragonFly)
      OS='BSD'
      ;;
    Linux)
      OS='Linux'
      if [ -f /etc/os-release ]; then
        [[ ${(f)"$((</etc/os-release) 2>/dev/null)"} =~ "ID=([A-Za-z]+)" ]] && os_release_id="${match[1]}"
      fi
      case "$os_release_id" in
        *arch*)
        DISTRO='arch'
        ;;
        *debian*)
        DISTRO='debian'
        ;;
       *ubuntu*)
        DISTRO='ubuntu'
        ;;
       *elementary*)
        DISTRO='elementary'
        ;;
       *fedora*)
        DISTRO='fedora'
        ;;
       *coreos*)
        DISTRO='coreos'
        ;;
       *gentoo*)
        DISTRO='gentoo'
        ;;
       *mageia*)
        DISTRO='mageia'
        ;;
       *centos*)
        DISTRO='centos'
        ;;
       *opensuse*|*tumbleweed*)
        DISTRO='opensuse'
        ;;
       *sabayon*)
        DISTRO='sabayon'
        ;;
       *slackware*)
        DISTRO='slackware'
        ;;
       *linuxmint*)
        DISTRO='mint'
        ;;
       *alpine*)
        DISTRO='alpine'
        ;;
       *aosc*)
        DISTRO='aosc'
        ;;
       *nixos*)
        DISTRO='nixos'
        ;;
       *devuan*)
        DISTRO='devuan'
        ;;
       *manjaro*)
        DISTRO='manjaro'
        ;;
        *)
        OS='Linux'
        DISTRO='linux'
        ;;
      esac

      # Check if we're running on Android
      case $(uname -o 2>/dev/null) in
        Android)
          OS='Android'
          DISTRO='android'
          ;;
      esac
      ;;
    SunOS)
      OS='Solaris'
      DISTRO='sun'
      ;;
    *)
      OS=''
      DISTRO=''
      ;;
esac
