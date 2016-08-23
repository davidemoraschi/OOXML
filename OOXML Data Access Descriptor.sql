EXECUTE dbms_xdb.SETHTTPPORT(8081);

-- This deletes the Data Access Descriptor.
EXECUTE dbms_epg.drop_dad('OOXML');

-- This creates the Data Access Descriptor.
EXECUTE dbms_epg.create_dad('OOXML','/ooxml/*');
 
-- This authorizes the Data Access Descriptor.
EXECUTE dbms_epg.authorize_dad('OOXML','OOXML');

-- Create and set "<allow-repository-anonymous-access>" element to "true"
SET SERVEROUTPUT ON
DECLARE
  lv_configxml XMLTYPE;
  lv_value     VARCHAR2(5) := 'true'; -- (true/false)
BEGIN
  lv_configxml := DBMS_XDB.cfg_get();
 
  -- Check for the element.
  IF lv_configxml.existsNode('/xdbconfig/sysconfig/protocolconfig/httpconfig/allow-repository-anonymous-access') = 0 THEN
    -- Add missing element.
    SELECT insertChildXML
           ( lv_configxml
           , '/xdbconfig/sysconfig/protocolconfig/httpconfig'
           , 'allow-repository-anonymous-access'
           , XMLType('<allow-repository-anonymous-access xmlns="http://xmlns.oracle.com/xdb/xdbconfig.xsd">'
              || lv_value
              || '</allow-repository-anonymous-access>')
              , 'xmlns="http://xmlns.oracle.com/xdb/xdbconfig.xsd"')
    INTO   lv_configxml
    FROM   dual;
 
    DBMS_OUTPUT.put_line('Element inserted.');
  ELSE
    -- Update existing element.
    SELECT updateXML
           ( DBMS_XDB.cfg_get()
           , '/xdbconfig/sysconfig/protocolconfig/httpconfig/allow-repository-anonymous-access/text()'
           , lv_value
           , 'xmlns="http://xmlns.oracle.com/xdb/xdbconfig.xsd"')
    INTO   lv_configxml
    FROM   dual;
 
    DBMS_OUTPUT.put_line('Element updated.');
  END IF;
 
  -- Configure the element.
  DBMS_XDB.cfg_update(lv_configxml);
  DBMS_XDB.cfg_refresh;
END;
/

-- Unlock the user account.
ALTER USER anonymous ACCOUNT UNLOCK;
--ALTER USER anonymous ACCOUNT LOCK;
-- Ensure a password is assigned to the account so you can create a synonym later.
ALTER USER anonymous IDENTIFIED BY ANONYMOUS;
--ALTER USER anonymous IDENTIFIED BY NULL;
GRANT CREATE ANY SYNONYM TO ANONYMOUS;
REVOKE CREATE ANY SYNONYM FROM ANONYMOUS; 

-- Open the anonymous account by setting the database-username parameter and value.
EXECUTE dbms_epg.set_dad_attribute('OOXML','database-username','ANONYMOUS');