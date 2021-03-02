{ pkgs ? import <nixpkgs> {}, ...}:

with pkgs;

let
  inherit (darwin.apple_sdk.frameworks) CoreServices ApplicationServices Security;
  darwin_packages = [ CoreServices ApplicationServices Security];

  # Python virtualenv
  pythonPackages = python3Packages;
  venvDir = "./.venv";

  other_services = [packer rustc cargo];

in mkShell rec {
  name = "ansible-docker-base";

  buildInputs = [
    docker-compose
    cmake
    coreutils
    autoconf
    cyrus_sasl
    bash-completion
    bison
    cairo
    gdbm
    groff
    libffi
    libiconv
    libtool
    libunwind
    libxml2
    libxslt
    libyaml
    ncurses
    openssl
    pkgconfig
    pythonPackages.python
    zlib
  ] ++ other_services ++ lib.optional stdenv.isDarwin darwin_packages;

  shellHook = ''
    # For python virtualenv
    SOURCE_DATE_EPOCH=$(date +%s)
    if [ -d "${venvDir}" ]; then
      echo "Skipping venv creation, '${venvDir}' already exists"
    else
      echo "Creating new venv environment in path: '${venvDir}'"
      ${pythonPackages.python.interpreter} -m venv "${venvDir}"
    fi
    PYTHONPATH=$PWD/${venvDir}/${pythonPackages.python.sitePackages}/:$PYTHONPATH
    source "${venvDir}/bin/activate"

    # Add additional folders to to XDG_DATA_DIRS if they exists, which will get sourced by bash-completion
    for p in ''${buildInputs}; do
      if [ -d "$p/share/bash-completion" ]; then
        XDG_DATA_DIRS="$XDG_DATA_DIRS:$p/share"
      fi
    done

    source ${bash-completion}/etc/profile.d/bash_completion.sh
  '';
}
