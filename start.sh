#!/bin/sh

set -e

search_and_replace () {

    FILE="${1}"
    SEARCH_PATTERN="${2}"
    REPLACE_WITH="${3}"

    SED="$(command -v sed) -i"
    ECHO="$(command -v echo) -e"

    ${SED} "s#${SEARCH_PATTERN}#${REPLACE_WITH}#g" "${FILE}"

}

start_varnishd () {

    VARNISHD="$(command -v varnishd)"
    FILE="${1}"

    if [ -z "${FILE}" ]; then

        ${VARNISHD} -s malloc,"${VARNISH_MEMORY}" \
            -a :8080 \
            -b "${VARNISH_BACKEND_ADDRESS}:${VARNISH_BACKEND_PORT}"

    else

        ${VARNISHD} -s malloc,"${VARNISH_MEMORY}" \
            -a :8080 \
            -f "${FILE}"

    fi

}

if [ ${VARNISH_VCL_CUSTOM_PATH} == "YOUR-VCL-PATH" ]; then

    echo "You did not configure your vcl-path properly."
    echo "See docs for configuration-exmaple."
    exit 1

fi

if ! [ -s "${VARNISH_VCL_CUSTOM_PATH}" ]; then

    echo "Provided VCL is either empty or not existent:"
    echo "${VARNISH_VCL_CUSTOM_PATH}"
    exit 1

fi

start_varnishd "${VARNISH_VCL_CUSTOM_PATH}"


sleep 10

varnishlog