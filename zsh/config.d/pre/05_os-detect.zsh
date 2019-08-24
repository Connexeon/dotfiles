####################################################################
# Detect OS & distribution
####################################################################

# set -x

# Architecture
export ARCH=$(uname -m)
export ARCH2=$(dpkg --print-architecture)

# OS/distro detection
case $(uname) in
    Darwin)
      export OS='OSX'
      export DISTRO='osx'
      ;;
    CYGWIN_NT-* | MSYS_NT-*)
      export OS='Windows'
      export DISTRO='windows'
      ;;
    FreeBSD)
      export OS='BSD'
      export DISTRO='freebsd'
      ;;
    OpenBSD)
      export OS='BSD'
      export DISTRO='openbsd'
      ;;
    DragonFly)
      export OS='BSD'
      export DISTRO='dragonfly'
      ;;
    Linux)
      export OS='Linux'
      # Detect distribution
      if [ -f /etc/os-release ]; then
        [[ ${(f)"$((</etc/os-release) 2>/dev/null)"} =~ "ID=([A-Za-z]+)" ]] && os_release_id="${match[1]}"

        if [ ! -v $os_release_id ]; then
          [[ ${(f)"$((</etc/os-release) 2>/dev/null)"} =~ 'ID="([A-Za-z]+)"' ]] && os_release_id="${match[1]}"
        fi
      fi
      case "$os_release_id" in
        *arch*)
        export DISTRO='arch'
        ;;
        *debian*)
        export DISTRO='debian'
        ;;
        *raspbian*)
        export DISTRO='raspbian'
        ;;
       *ubuntu*)
        export DISTRO='ubuntu'
        ;;
       *elementary*)
        export DISTRO='elementary'
        ;;
       *fedora*)
        export DISTRO='fedora'
        ;;
       *coreos*)
        export DISTRO='coreos'
        ;;
       *gentoo*)
        export DISTRO='gentoo'
        ;;
       *mageia*)
        export DISTRO='mageia'
        ;;
       *centos*)
        export DISTRO='centos'
        ;;
       *opensuse*|*tumbleweed*)
        export DISTRO='opensuse'
        ;;
       *sabayon*)
        export DISTRO='sabayon'
        ;;
       *slackware*)
        export DISTRO='slackware'
        ;;
       *linuxmint*)
        export DISTRO='mint'
        ;;
       *alpine*)
        export DISTRO='alpine'
        ;;
       *aosc*)
        export DISTRO='aosc'
        ;;
       *nixos*)
        export DISTRO='nixos'
        ;;
       *devuan*)
        export DISTRO='devuan'
        ;;
       *manjaro*)
        export DISTRO='manjaro'
        ;;
        *)
        export OS='Linux'
        export DISTRO='linux'
        ;;
      esac

      # Check if we're running on Android
      case $(uname -o 2>/dev/null) in
        Android)
          export OS='Android'
          export DISTRO='android'
          ;;
      esac
      ;;
    SunOS)
      export OS='Solaris'
      export DISTRO='sun'
      ;;
    *)
      export OS=''
      export DISTRO=''
      ;;
esac

echo "OS: $OS / DISTRO: $DISTRO / ARCH: $ARCH|$export ARCH2"
