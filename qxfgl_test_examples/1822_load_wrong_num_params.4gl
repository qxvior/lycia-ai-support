DATABASE stores

MAIN
  WHENEVER ERROR CONTINUE
    DROP TABLE test_decimal
  WHENEVER ERROR STOP
  
  CREATE TABLE test_decimal(
  tDec DECIMAL(2,0),
    PRIMARY KEY (tDec)
  );
  LOAD FROM "1822/1822_load_wrong_num_params.unl" INSERT INTO test_decimal
END MAIN
