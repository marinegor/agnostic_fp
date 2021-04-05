.headers on
.mode csv
.output bioactivity.csv
SELECT md.chembl_id AS compound_chembl_id,
cs.canonical_smiles,
act.standard_type,
act.standard_value,
act.standard_units,
act.pchembl_value,
td.chembl_id AS target_chembl_id,
td.organism,  
td.pref_name,
c.accession AS protein_accession

FROM target_dictionary td
  JOIN assays a ON td.tid = a.tid
  JOIN activities act ON a.assay_id = act.assay_id
  JOIN molecule_dictionary md ON act.molregno = md.molregno
  JOIN compound_structures cs ON md.molregno   = cs.molregno
  JOIN organism_class oc ON td.tax_id = oc.tax_id
  JOIN component_sequences c ON tc.component_id = c.component_id
  JOIN target_components tc ON td.tid = tc.tid;
.quit
