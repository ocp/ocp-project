#!/usr/bin/env bash

# Script to apply a series/graph of terragrunt modules in a given order.
#
# I don't use the built-in terragrunt dependency handling as it leads to a
# qudratic time/space complexity explosion as the DAG grows in size. Instead I
# manually register or compute the graph of modules and apply them
# sequentially.
#
# This script is non-interactive, so it's suitable for use during continuous
# deployment.
set -eou pipefail

usage() {
  echo "Usage: ${0} <modules_dir> <module1 module2 ...>" >&2
}

err() {
  echo "[$(date +'%Y-%m-%dT%H:%M:%S%z')]: $*" >&2;
}

error_handler() {
  err "Error encountered while applying dependency graph"
  exit 1
}

tf-apply() {
  trap 'error_handler' ERR

  if [ "${#}" -lt 2 ]; then
    err "Missing required arguments"
    usage >&2
    return 1
  fi

  local modules_dir="${1}"
  local modules="${2}"

  if [ -z "${modules_dir}" ] || [ -z "${modules}" ]; then
    err "Both modules directory and modules must be provided"
    usage >&2
    return 1
  fi

  for module in ${modules}; do
    module_path="${modules_dir}/${module}"

    if [[ ! -d "${module_path}" ]]; then
      err "Module '${module_path}' does not exist"
      exit 1
    fi

    msg="Applying ops module: ${module}"
    printf -v dashes '%*s' ${#msg} ''; printf '%s\n' "${dashes// /-}" 1>&2
    echo "${msg}" 1>&2
    printf -v dashes '%*s' ${#msg} ''; printf '%s\n' "${dashes// /-}" 1>&2

    terragrunt apply \
      -auto-approve \
      --terragrunt-source-update \
      --terragrunt-non-interactive \
      --terragrunt-working-dir "${1}/${module}"

    echo "" 1>&2
  done
}

tf-apply "${@}"
