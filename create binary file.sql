-- Create resource
DECLARE
  v_xml     BFILE;
  v_result  BOOLEAN;
BEGIN

  v_xml :=  BFILENAME('DATA_PUMP_DIR', 'fc_zizou_sans-medium-webfont.eot');

  -- Using DBMS_XDB
  v_result := DBMS_XDB.createResource(
                '/fonts/fc_zizou_sans-medium-webfont.eot',
                v_xml);
  
  COMMIT;
END;
/