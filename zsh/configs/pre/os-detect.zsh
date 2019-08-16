####################################################################
# Detect OS & distribution
####################################################################

# OS detection
case $(uname) in
    Darwin)
      OS='OSX'
      DISTRO='osx'
      ;;
    CYGWIN_NT-* | MSYS_NT-*)
      OS='Windows'
      DISTRO='windows'
      ;;
    FreeBSD)
      OS='BSD'
      DISTRO='freebsd'
      ;;
    OpenBSD)
      OS='BSD'
      DISTRO='openbsd'
      ;;
    DragonFly)
      OS='BSD'
      DISTRO='dragonfly'
      ;;
    Linux)
      OS='Linux'
      # Detect distribution
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
