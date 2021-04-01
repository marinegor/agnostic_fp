SHELL := bash

.PHONY: download clean unpack

all: download unpack
	@echo "Prepared all data"

download: download.sh
	bash download.sh

unpack: chembl_28_chemreps.txt.gz chembl_28.fps.gz chembl_28.sdf.gz chembl_28_sqlite.tar.gz 
	gzip -d *.gz
	for name in *.tar; do tar xvf $${name}; done

clean:
	rm -rf ./ftp.ebi.ac.uk       ;\
	rm -rf ./chembl_28           ;\
	rm -f checksums.txt          ;\
	rm -f chembl_28.{fps,sdf}    ;\
	rm -f chembl_28_sqlite.tar   ;\
	rm -r chembl_28_chemreps.txt ;\
	rm -f chembl_uniprot_mapping.txt
