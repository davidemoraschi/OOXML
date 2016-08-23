/* Formatted on 7/23/2012 12:01:26 PM (QP5 v5.163.1008.3004) */
-- create Powerpoint 2007 (pptx) file

DECLARE
   l_template   BLOB;
   l_new_file   BLOB;
BEGIN
   debug_pkg.debug_on;
   l_template := file_util_pkg.get_blob_from_file ('OOXML_EXCEL_DIR', 'Negative Information.pptx');
   l_new_file := OOXML_UTIL_PKG.GET_FILE_FROM_TEMPLATE (l_template, t_str_array ('#COMPANY_NAME#'), t_str_array ('Foobar Inc.'));
   FILE_UTIL_PKG.SAVE_BLOB_TO_FILE ('OOXML_EXCEL_DIR', 'sample_presetation_final.pptx', l_new_file);
   debug_pkg.printf ('Output file saved.');
END;