#!/bin/sh

set -e

start_varnishd () {

    VARNISHD="exec $(command -v varnishd)"
    FILE="${1}"

    if ! [ -z "${FILE}" ]; then

        ${VARNISHD} -s malloc,"${VARNISH_MEMORY}" \
            -F \
            -a :"${VARNISH_PORT}" \
            -f "${VARNISH_VCL_PATH}" ${VARNISHD_OPTS}
    else

        echo "Missing vcl operand. State path to vcl in first argument."
        exit 1

    fi

}

if ! [ -s "${VARNISH_VCL_PATH}" ]; then

    echo "Provided VCL is either empty or not existent:"
    echo "${VARNISH_VCL_PATH}"
    exit 1

fi

start_varnishd "${VARNISH_VCL_PATH}"
