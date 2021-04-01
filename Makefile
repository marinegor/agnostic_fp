.PHONY: download clean

download: download.sh
	bash download.sh

clean:
	rm -r ./ftp.ebi.ac.uk
