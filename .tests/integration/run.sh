#!/bin/bash

set -eu
rm -rf test_results

snakemake -F --use-conda -j1 --use-conda --configfile tests/integration/toy_config.yaml
max_len=$( egrep -o '[0-9]+$' test_results/assem/toy_k19_max_contig.txt )
if [[ "$max_len"  > 300 ]] ; then echo PASS ; else echo FAIL ; fi
