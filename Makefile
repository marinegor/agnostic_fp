SHELL := bash

.PHONY: download clean unpack prepare

all: download unpack prepare
	@echo "Prepared all data"

prepare:
	@echo "Warning: this takes around 40 minutes!"
	sqlite3 chembl_28/chembl_28_sqlite/chembl_28.db < get_bioactivities.sql

download: download.sh
	bash download.sh

unpack: chembl_28_chemreps.txt.gz chembl_28.fps.gz chembl_28.sdf.gz chembl_28_sqlite.tar.gz 
	gzip -d *.gz
	for name in *.tar; do tar xvf $${name} && rm -f $${name}; done

clean:
	rm -rf ./ftp.ebi.ac.uk       ;\
	rm -rf ./chembl_28           ;\
	rm -f checksums.txt          ;\
	rm -f chembl_28.{fps,sdf}    ;\
	rm -f chembl_28_sqlite.tar   ;\
	rm -r chembl_28_chemreps.txt ;\
	rm -f bioactivity.csv        ;\
	rm -f chembl_uniprot_mapping.txt
