# Intro

## What's that?
It's a repository for the "Sequence-agnostic protein fingerprints" challenge on [biohackaton.dk](https://biohackathon.biolib.com/event/2021-protein-edition/).

## How to use that?
If you want to jump into the challenge, clone the repository and run `make all` target:

```
git clone https://github.com/marinegor/agnostic_fp.git && cd agnostic_fp
make all
```

This will fetch a latest issue of the Chembl database and prepare a to-go csv file that contains columns that I think are necessary.
Namely, it runs `get_bioactivities.sql` SQL script -- feel free to modify it if you need to get more columns from the database.

Warning: the script runs in about 40 minutes.

## What's next?
I suggest you run through the example notebook `tSNE_by_organism.ipynb` to see the example of how the decomposition works in code.
Don't worry that the final tSNE doesn't look clear and separated -- it's not mean to, since the agnostic fingerprints probably won't be a good predictor for protein's organism of origin.

## Useful links

	- Chembl's FTP server: https://chembl.gitbook.io/chembl-interface-documentation/downloads
	- SQL script examples: https://chembl.gitbook.io/chembl-interface-documentation/frequently-asked-questions/schema-questions-and-sql-examples
	- Database schema: https://www.ebi.ac.uk/chembl/db_schema
	- my pitch presentation: https://yadi.sk/i/L3du8ZLl2shHSQ 
	- more in-depth presentation: https://yadi.sk/i/ldv_AkcYvN3A0w


