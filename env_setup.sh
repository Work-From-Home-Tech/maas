#!/usr/bin/env bash

set -ex

SCRIPT_DIRECTORY="$(readlink -f "$(dirname "${BASH_SOURCE[0]}")")"

function check_is_sudo_or_exit() 
{
    if [[ "$(id -u "${USER}")" == "0" ]]; then
        echo "Run this script as non-root user (UID!=0)."
        echo "You will be prompted for password if needed."
        exit 1
    fi
}

function check_upgrade_apt_packages()
{
    check_is_sudo_or_exit
    sudo apt update
    sudo apt upgrade -y
    sudo apt satisfy -y "python3 (>=3.9), python3-dev (>= 3.9), python3-pip"
    sudo apt install -y libevent-dev
}

function check_add_userspace_bin_path()
{
    USERSPACE_BIN="$(readlink -f "${HOME}/.local/bin")"
    if [[ ! $(grep "${USERSPACE_BIN}" <<< "${PATH}") ]]
    then
        export PATH="${USERSPACE_BIN}:${PATH}"
        echo 'PATH="'${USERSPACE_BIN}':${PATH}"' >> "/etc/environment"
        echo 'export PATH="'${USERSPACE_BIN}':${PATH}"' >> "${HOME}/.bashrc"
    fi
}

function check_install_python3_pip_packages()
{
    check_add_userspace_bin_path
    python3 -m pip install --user pipenv
}

function install_full_pipenv_environment()
{
    cd "${SCRIPT_DIRECTORY}"
    pipenv install
    pipenv run ansible-galaxy collection install -r "${SCRIPT_DIRECTORY}/collections.yaml"
}

function run_install_pipeline()
{
    echo -e "Starting preconfiguration script. Running... \n\tcheck_upgrade_apt_packages..."
    check_upgrade_apt_packages
    echo -e "\n\tcheck_install_python3_pip_packages..."
    check_install_python3_pip_packages
    echo -e "\n\tinstall_full_pipenv_environment..."
    install_full_pipenv_environment
    echo -e "\nPipenv was installed as intended.\nTo use it, type 'pipenv shell' inside directory ${SCRIPT_DIRECTORY}"
    echo -e "For more information please refer to the source documentation of pipenv tool.\n\n\tContact creator by e-mail: milosz.linkiewicz@intel.com"
}

run_install_pipeline
