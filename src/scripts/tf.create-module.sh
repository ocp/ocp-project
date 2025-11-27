#!/usr/bin/env bash

# Create a Terraform module with a well-specified structure.
#
# You can also use the boilerplate template method, but this is a quick and
# easy way to get the files in place for building a new module that follows the
# expected OCP structure.
#
# The resulting module doesn't cleave to 'terraform_standard_module_structure'
# (in fact, it does, but it's a superset) as understood by tflint. That
# prescribed shape is too constrained for my tastes, I prefer some additional
# files to help enforce my own conventions. So you'll need to disable that rule
# if you are tflint-ing your Terraform.
#
# https://developer.hashicorp.com/terraform/language/modules/develop/structure
set -eou pipefail

usage() {
  echo "Usage: ${0} <directory> <module>" >&2
}

err() {
  echo "[$(date +'%Y-%m-%dT%H:%M:%S%z')]: $*" >&2;
}

touchp() {
  for file in "${@}"; do
    mkdir -p "$(dirname "${file}")" && touch "${file}"
  done
}

tf-create-module() {
  if [ "${#}" -ne 2 ]; then
    err "Missing required arguments"
    usage >&2
    return 1
  fi

  local dir="${1}"
  local module="${2}"

  if [ -z "${dir}" ] || [ -z "${module}" ]; then
    err "Both directory and module arguments must be provided"
    usage >&2
    return 1
  fi

  local module_dir="${dir}/${module}"
  local readme="${module_dir}/README.md"

  if [ -e "${readme}" ]; then
    err "File ${path} already exists. Skipping."
  else
    touchp "${readme}"
    echo "# ${module^}" > "${readme}"
    err "Created ${readme}"
  fi

  local filenames=( \
    'data' \
    'iam' \
    'labels' \
    'main' \
    'outputs' \
    'variables' \
    'versions' \
  )

  for filename in "${filenames[@]}"; do
    path="${module_dir}/${filename}.tf"

    if [ -e "${path}" ]; then
      err "File ${path} already exists. Skipping."
      continue
    else
      touchp "${path}"

      if [ "${filename}" == 'data' ]; then
        echo "# Data sources for the ${module} module." > "${path}"
      elif [ "${filename}" == 'iam' ]; then
        echo "# IAM roles and permissions for the ${module} module." > "${path}"
      elif [ "${filename}" == 'main' ]; then
        echo "# Resources for the ${module} module." > "${path}"
      elif [ "${filename}" == 'versions' ]; then
        echo "# Providers for the ${module} module." > "${path}"
      else
        echo "# ${filename^} for the ${module} module." > "${path}"
      fi

    fi
    err "Created ${path}"
  done
}

tf-create-module "${@}"
