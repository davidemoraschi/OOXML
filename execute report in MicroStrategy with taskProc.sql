/* Formatted on 9/10/2012 12:03:31 PM (QP5 v5.163.1008.3004) */
SET DEFINE OFF;

CREATE OR REPLACE PROCEDURE getimage (p_varchar_1 IN VARCHAR2 DEFAULT '9C5AE6B84A50C46DC5E94FA18D95D925')
AS
   const_host_port   CONSTANT VARCHAR2 (1024) := 'http://10.232.32.179:8080';
   v_sessionState             VARCHAR2 (4000);
   v_msg_id                   VARCHAR2 (1000);
   v_image_clob               CLOB;
   v_image_blob               BLOB;
BEGIN
   SELECT xmltype (
             UTL_HTTP.REQUEST (
                const_host_port
                || '/MicroStrategy/servlet/taskProc?taskId=login&taskEnv=xml&taskContentType=xml&server=ORA11XELINUX64&project=VALME+DIRECTO&userid=perjce&password=workforthedebt')).EXTRACT (
             'taskResponse/root/sessionState/text()').getstringval ()
     INTO v_sessionState
     FROM DUAL;

   DBMS_OUTPUT.put_line (v_sessionState);

   SELECT xmltype (
             UTL_HTTP.REQUEST (
                   const_host_port
                || '/MicroStrategy/servlet/taskProc?taskId=reportExecute&taskEnv=xml&taskContentType=xml&sessionState='
                || UTL_URL.escape (v_sessionState)
                || '&reportViewMode=2&reportID='
                || p_varchar_1)).EXTRACT ('taskResponse/msg/id/text()').getstringval ()
     INTO v_msg_id
     FROM DUAL;

   DBMS_OUTPUT.put_line (v_msg_id);

   SELECT xmltype (
             HTTPURITYPE.createuri (
                   const_host_port
                || '/MicroStrategy/servlet/taskProc?taskId=getReportGraphImage&taskEnv=xml&taskContentType=xml&sessionState='
                || UTL_URL.escape (v_sessionState)
                || '&messageID='
                || v_msg_id
                /*imgType=2 (transparent png)*/
                /*imgType=3 (jpg)*/
                || '&width=600&height=400&imgType=2&availWidth=600&availHeight=400').getclob ()).EXTRACT (
             'taskResponse/root/ib/eb/text()').getclobval ()
     INTO v_image_clob
     FROM DUAL;

   v_image_blob := FLEX_WS_API.CLOBBASE642BLOB (v_image_clob);
   OWA_UTIL.mime_header ('image/png', FALSE, NULL);
   HTP.p ('Content-length: ' || DBMS_LOB.GETLENGTH (v_image_blob));
   --HTP.p ('Content-Disposition: attachment; filename="test.png"');
   OWA_UTIL.http_header_close;
   WPG_DOCLOAD.download_file (v_image_blob);
EXCEPTION
   WHEN OTHERS
   THEN
      senderroroutput (SQLERRM, DBMS_UTILITY.format_error_backtrace);
END;