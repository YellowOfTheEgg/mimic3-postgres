CREATE FUNCTION copy_csv(data_path varchar, table_name varchar, csv_name varchar)
   RETURNS void
   AS $$  
   BEGIN
      IF exists(select * from pg_ls_dir(data_path) as file where file  = csv_name) THEN
         EXECUTE format ('copy %s FROM %L DELIMITER '','' CSV HEADER NULL ''''',table_name,(data_path || csv_name));  
      END IF;
   END;   
   $$ LANGUAGE plpgsql;

DO $$
DECLARE
data_path varchar := '/docker-entrypoint-initdb.d/data/';
BEGIN
PERFORM copy_csv(data_path,'CALLOUT','CALLOUT.csv');
PERFORM copy_csv(data_path,'ADMISSIONS','ADMISSIONS.csv');
PERFORM copy_csv(data_path,'CAREGIVERS','CAREGIVERS.csv');
PERFORM copy_csv(data_path,'CHARTEVENTS','CHARTEVENTS.csv');
PERFORM copy_csv(data_path,'CPTEVENTS','CPTEVENTS.csv');
PERFORM copy_csv(data_path,'DATETIMEEVENTS','DATETIMEEVENTS.csv');
PERFORM copy_csv(data_path,'DIAGNOSES_ICD','DIAGNOSES_ICD.csv');
PERFORM copy_csv(data_path,'DRGCODES','DRGCODES.csv');
PERFORM copy_csv(data_path,'D_CPT','D_CPT.csv');
PERFORM copy_csv(data_path,'D_ICD_DIAGNOSES','D_ICD_DIAGNOSES.csv');
PERFORM copy_csv(data_path,'D_ICD_PROCEDURES','D_ICD_PROCEDURES.csv');
PERFORM copy_csv(data_path,'D_ITEMS','D_ITEMS.csv');
PERFORM copy_csv(data_path,'D_LABITEMS','D_LABITEMS.csv');
PERFORM copy_csv(data_path,'ICUSTAYS','ICUSTAYS.csv');
PERFORM copy_csv(data_path,'INPUTEVENTS_CV','INPUTEVENTS_CV.csv');
PERFORM copy_csv(data_path,'INPUTEVENTS_MV','INPUTEVENTS_MV.csv');
PERFORM copy_csv(data_path,'LABEVENTS','LABEVENTS.csv');
PERFORM copy_csv(data_path,'MICROBIOLOGYEVENTS','MICROBIOLOGYEVENTS.csv');
PERFORM copy_csv(data_path,'NOTEEVENTS','NOTEEVENTS.csv');
PERFORM copy_csv(data_path,'OUTPUTEVENTS','OUTPUTEVENTS.csv');
PERFORM copy_csv(data_path,'PATIENTS','PATIENTS.csv');
PERFORM copy_csv(data_path,'PRESCRIPTIONS','PRESCRIPTIONS.csv');
PERFORM copy_csv(data_path,'PROCEDUREEVENTS_MV','PROCEDUREEVENTS_MV.csv');
PERFORM copy_csv(data_path,'PROCEDURES_ICD','PROCEDURES_ICD.csv');
PERFORM copy_csv(data_path,'SERVICES','SERVICES.csv');
PERFORM copy_csv(data_path,'TRANSFERS','TRANSFERS.csv');
END;
$$;