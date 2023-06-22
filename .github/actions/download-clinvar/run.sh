#!/usr/bin/bash

set -euo pipefail
set -x

mkdir -p $CLINVAR_DIR

export TMPDIR=$(mktemp -d)
trap "rm -rf $TMPDIR" EXIT ERR

if [[ ! -e $CLINVAR_DIR/ClinVarFullRelease_${CLINVAR_RELEASE}.xml.gz ]]; then
    wget -O $CLINVAR_DIR/ClinVarFullRelease_${CLINVAR_RELEASE}.xml.gz \
        https://ftp.ncbi.nlm.nih.gov/pub/clinvar/xml/weekly_release/ClinVarFullRelease_${CLINVAR_RELEASE}.xml.gz
fi