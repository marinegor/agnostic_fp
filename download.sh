#!/bin/bash

CHEMBL="https://ftp.ebi.ac.uk/pub/databases/chembl/ChEMBLdb/latest"
chembl_folder="${CHEMBL##*//}"

files=(\
"checksums.txt" \
"chembl_uniprot_mapping.txt" \
"chembl_28_sqlite.tar.gz" \
"chembl_28.sdf.gz" \
"chembl_28_chemreps.txt.gz" \
"chembl_28.fps.gz" 
)

checksum_file="${chembl_folder}/checksums.txt"

for file in "${files[@]}"; do
	wget --no-check-certificate -c -x "${CHEMBL}/${file}"
   #  if grep "${file}" ${checksum_file}; then
   #      while [[ $(grep "${file}" ${checksum_file} | awk '{print $1}') != $(sha256sum "${chembl_folder}/${file}" | awk '{print $1}') ]]; do
   #          wget --no-check-certificate -c -x "${CHEMBL}/${file}"
   #      done
   #  fi
done

mv "${chembl_folder}"/* .
rm -r "${chembl_folder%%/*}"

echo "Finished download"
echo "sha256 checksums are:"
sha256sum ./* | sort 

echo "sha256 checksums should be:"
sort checksums.txt

