DECLARE 
  v_return  BOOLEAN; 
BEGIN 
--  v_return := dbms_xdb.createFolder('/css/');
--  v_return := dbms_xdb.createFolder('/fonts/');
--  v_return := dbms_xdb.createFolder('/fonts/fc_zizou/');
--  v_return := dbms_xdb.createFolder('/fonts/fc_kaiser/');
--  v_return := dbms_xdb.createFolder('/fonts/museo_sans/');--newsgott
  v_return := dbms_xdb.createFolder('/fonts/newsgott/');
  
  
--  v_return := dbms_xdb.createFolder('/home/DEV/messages/');
--  v_return := dbms_xdb.createFolder('/home/DEV/employees/');
  COMMIT;
END; 
/