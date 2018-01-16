#!/bin/sh

set -e

start_varnishd () {

    VARNISHD="$(command -v varnishd)"
    FILE="${1}"

    if [ -z "${FILE}" ]; then

        ${VARNISHD} -s malloc,"${VARNISH_MEMORY}" \
            -F \
            -a :8080 \
            -b "${VARNISH_BACKEND_ADDRESS}:${VARNISH_BACKEND_PORT}"
    else

        exit 1

    fi

}

if [ ${VARNISH_VCL_PATH} == "YOUR-VCL-PATH" ]; then

    echo "You did not configure your vcl-path properly."
    echo "See docs for configuration-exmaple."
    exit 1

fi

if ! [ -s "${VARNISH_VCL_PATH}" ]; then

    echo "Provided VCL is either empty or not existent:"
    echo "${VARNISH_VCL_PATH}"
    exit 1

fi

start_varnishd "${VARNISH_VCL_PATH}"