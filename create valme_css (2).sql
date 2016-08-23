-- Create resource
DECLARE
  v_xml     VARCHAR2(32000);
  v_result  BOOLEAN;
BEGIN
DBMS_XDB.deleteresource('/css/valme.css');

  v_xml := ('.ColHdrRedAndBlack 
{
    border-width: 1px; 
    background-color: #C6DBC6; 
    border-top-color: #FFFFFF; 
    border-right-color: #8C9294; 
    border-left-color: #FFFFFF; 
    border-top-style: solid; 
    border-right-style: solid; 
    border-left-style: solid;
    font-family: FCZizouSans,Microsoft Sans Serif,Arial,Tahoma,Verdana;
    font-size: 12pt;
}
.LytColRedAndBlack
{
    border-width: 1px;
    background-color: #C6DBC6;
    border-top-color: #FFFFFF;
    border-right-color: #8C9294;
    border-left-color: #FFFFFF;
    border-top-style: solid;
    border-right-style: solid;
    border-left-style: solid;
    font-family: FCZizouSans,Microsoft Sans Serif,Arial,Tahoma,Verdana;    
    font-size: 12pt;
}
.LytRwRedAndBlack
{
    border-width: 1px;
    background-color: #C6DBC6;
    border-top-color: #FFFFFF;
    border-right-color: #8C9294;
    border-left-color: #FFFFFF;
    border-top-style: solid;
    border-right-style: solid;
    border-left-style: solid;
    font-family: FCZizouSans,Microsoft Sans Serif,Arial,Tahoma,Verdana;
    font-size: 12pt;
}
.RwHdrRedAndBlack
{
    border-width: 1px; 
    background-color: #DED79C; 
    border-right-style: solid; 
    border-bottom-style: solid; 
    border-left-style: solid; 
    border-left-color: #FFFFFF; 
    border-bottom-color: #8C9294; 
    border-right-color: #8C9294;
    font-family: NewsGotTRegular,Microsoft Sans Serif,Arial,Tahoma,Verdana;
    font-size: 10pt;
}
.RwHdrTlRedAndBlack
{
    border-width: 1px; 
    background-color: #189659; 
    border-right-style: solid; 
    border-bottom-style: solid; 
    border-left-style: solid; 
    border-left-color: #FFFFFF; 
    border-bottom-color: #8C9294; 
    border-right-color: #8C9294;
    color: White;
    font-family: NewsGotTRegular,Microsoft Sans Serif,Arial,Tahoma,Verdana;
    font-size: 11pt;
    font-weight: bold;
}   
.RwValTlRedAndBlack
{
    border-width: 1px;
    background-color: #189659;
    border-right-style: solid;
    border-bottom-style: solid;
    border-left-style: solid;
    border-left-color: #FFFFFF;
    border-bottom-color: #8C9294;
    border-right-color: #8C9294;
    color: White;
    font-family: NewsGotTRegular,Microsoft Sans Serif,Arial,Tahoma,Verdana;
    font-size: 10pt;
    font-weight: bold;
    text-align:right;
}
.MVRedAndBlack
{
    border-width: 1px; 
    background-color: #efebce; 
    border-right-style: solid; 
    border-bottom-style: solid; 
    border-left-style: solid; 
    border-left-color: #FFFFFF; 
    border-bottom-color: #8C9294; 
    border-right-color: #8C9294;
    font-family: NewsGotTRegular,Microsoft Sans Serif,Arial,Tahoma,Verdana;
    font-size: 10pt;
    text-align:right;
}
.reportHTML
{
   
}
');

  -- Using DBMS_XDB
  v_result := DBMS_XDB.createResource(
                '/css/valme.css',
                v_xml);
  
  COMMIT;
END;
/