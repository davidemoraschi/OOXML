-- Create resource
DECLARE
  v_xml     VARCHAR2(32000);
  v_result  BOOLEAN;
BEGIN
  v_xml := ('
@charset "utf-8";

@font-face {
  font-family: "FCZizouSans";
  src: url("../fonts/fc_zizou/fc_zizou_sans-medium-webfont.eot?") format("embedded-opentype"),
       url("../fonts/fc_zizou/fc_zizou_sans-medium-webfont.woff") format("woff"),
       url("../fonts/fc_zizou/fc_zizou_sans-medium-webfont.svg") format("svg"),
       url("../fonts/fc_zizou/fc_zizou_sans-medium-webfont.ttf") format("opentype");
  font-style: normal;
  font-weight: 500;
  font-stretch: normal;
}

@font-face {
  font-family: "FCZizouSans";
  src: url("../fonts/fc_zizou/fc_zizou_sans-regular-webfont.eot?") format("embedded-opentype"),
       url("../fonts/fc_zizou/fc_zizou_sans-regular-webfont.woff") format("woff"),
       url("../fonts/fc_zizou/fc_zizou_sans-regular-webfont.svg") format("svg"),
       url("../fonts/fc_zizou/fc_zizou_sans-regular-webfont.ttf") format("opentype");
  font-style: normal;
  font-weight: 400;
  font-stretch: normal;
}

@font-face {
    font-family: "FCZizouSlab";
    src: url("../fonts/fc_zizou/fc_zizou_slab-light-webfont.eot?") format("embedded-opentype"),
         url("../fonts/fc_zizou/fc_zizou_slab-light-webfont.woff") format("woff"),
         url("../fonts/fc_zizou/fc_zizou_slab-light-webfont.svg") format("svg"),
         url("../fonts/fc_zizou/fc_zizou_slab-light-webfont.ttf") format("opentype");
    font-style: normal;
    font-weight: 200;
    font-stretch: normal;
}

@font-face {
  font-family: "FCZizouSlab";
  src: url("../fonts/fc_zizou/fc_zizou_slab-regular-webfont.eot?") format("embedded-opentype"),
       url("../fonts/fc_zizou/fc_zizou_slab-regular-webfont.woff") format("woff"),
       url("../fonts/fc_zizou/fc_zizou_slab-regular-webfont.svg") format("svg"),
       url("../fonts/fc_zizou/fc_zizou_slab-regular-webfont.ttf") format("opentype");
  font-style: normal;
  font-weight: 400;
  font-stretch: normal;
}

@font-face {
  font-family: "FCZizouSlab";
  src: url("../fonts/fc_zizou/fc_zizou_slab-medium-webfont.eot?") format("embedded-opentype"),
       url("../fonts/fc_zizou/fc_zizou_slab-medium-webfont.woff") format("woff"),
       url("../fonts/fc_zizou/fc_zizou_slab-medium-webfont.svg") format("svg"),
       url("../fonts/fc_zizou/fc_zizou_slab-medium-webfont.ttf") format("opentype");
  font-style: normal;
  font-weight: 500;
  font-stretch: normal;
}

@font-face {
    font-family: "FCZizouSlab";
    src: url("../fonts/fc_zizou/fc_zizou_slab-bold-webfont.eot");
    src: url("../fonts/fc_zizou/fc_zizou_slab-bold-webfont.eot?#iefix") format("embedded-opentype"),
         url("../fonts/fc_zizou/fc_zizou_slab-bold-webfont.woff") format("woff"),
         url("../fonts/fc_zizou/fc_zizou_slab-bold-webfont.ttf") format("truetype"),
         url("../fonts/fc_zizou/fc_zizou_slab-bold-webfont.svg#FCZizouSlabBold") format("svg");
    font-weight: 700;
    font-style: normal;

}

@font-face {
  font-family: "FCKaiser";
  src: url("../fonts/fc_kaiser/fc_kaiser-medium-webfont.eot?") format("embedded-opentype"),
       url("../fonts/fc_kaiser/fc_kaiser-medium-webfont.woff") format("woff"),
       url("../fonts/fc_kaiser/fc_kaiser-medium-webfont.svg") format("svg"),
       url("../fonts/fc_kaiser/fc_kaiser-medium-webfont.ttf") format("opentype");
  font-style: normal;
  font-weight: 500;
  font-stretch: normal;
}

@font-face {
  font-family: "FCKaiser";
  src: url("../fonts/fc_kaiser/fc_kaiser-regular-webfont.eot?") format("embedded-opentype"),
       url("../fonts/fc_kaiser/fc_kaiser-regular-webfont.woff") format("woff"),
       url("../fonts/fc_kaiser/fc_kaiser-regular-webfont.svg") format("svg"),
       url("../fonts/fc_kaiser/fc_kaiser-regular-webfont.ttf") format("opentype");
  font-style: normal;
  font-weight: 400;
  font-stretch: normal;
}

@font-face {
  font-family: "FCKaiserCond";
  src: url("../fonts/fc_kaiser/fc_kaiser-cond-extralight-webfont.eot?") format("embedded-opentype"),
       url("../fonts/fc_kaiser/fc_kaiser-cond-extralight-webfont.woff") format("woff"),
       url("../fonts/fc_kaiser/fc_kaiser-cond-extralight-webfont.svg") format("svg"),
       url("../fonts/fc_kaiser/fc_kaiser-cond-extralight-webfont.ttf") format("opentype");
  font-style: normal;
  font-weight: 200;
  font-stretch: normal;
}

@font-face {
    font-family: "FCKaiserCond";
    src: url("../fonts/fc_kaiser/fc_kaiser-cond-regular-webfont.eot");
    src: url("../fonts/fc_kaiser/fc_kaiser-cond-regular-webfont.eot?#iefix") format("embedded-opentype"),
         url("../fonts/fc_kaiser/fc_kaiser-cond-regular-webfont.woff") format("woff"),
         url("../fonts/fc_kaiser/fc_kaiser-cond-regular-webfont.ttf") format("truetype"),
         url("../fonts/fc_kaiser/fc_kaiser-cond-regular-webfont.svg#FCKaiserCondWebRegular") format("svg");
    font-weight: 400;
    font-style: normal;
}

@font-face {
    font-family: "MuseoSans";
    src: url("../fonts/museo_sans/museo_sans-100-webfont.eot");
    src: url("../fonts/museo_sans/museo_sans-100-webfont.eot?#iefix") format("embedded-opentype"),
         url("../fonts/museo_sans/museo_sans-100-webfont.woff") format("woff"),
         url("../fonts/museo_sans/museo_sans-100-webfont.ttf") format("truetype"),
         url("../fonts/museo_sans/museo_sans-100-webfont.svg#MuseoSans100") format("svg");
    font-weight: 100;
    font-style: normal;
}

@font-face {
    font-family: "MuseoSans";
    src: url("../fonts/museo_sans/museo_sans-300-webfont.eot");
    src: url("../fonts/museo_sans/museo_sans-300-webfont.eot?#iefix") format("embedded-opentype"),
         url("../fonts/museo_sans/museo_sans-300-webfont.woff") format("woff"),
         url("../fonts/museo_sans/museo_sans-300-webfont.ttf") format("truetype"),
         url("../fonts/museo_sans/museo_sans-300-webfont.svg#MuseoSans300") format("svg");
    font-weight: 300;
    font-style: normal;
}

@font-face {
    font-family: "MuseoSans";
    src: url("../fonts/museo_sans/museo_sans-300-italic-webfont.eot");
    src: url("../fonts/museo_sans/museo_sans-300-italic-webfont.eot?#iefix") format("embedded-opentype"),
         url("../fonts/museo_sans/museo_sans-300-italic-webfont.woff") format("woff"),
         url("../fonts/museo_sans/museo_sans-300-italic-webfont.ttf") format("truetype"),
         url("../fonts/museo_sans/museo_sans-300-italic-webfont.svg#MuseoSans300Italic") format("svg");
    font-weight: 300;
    font-style: italic;
}

@font-face {
    font-family: "MuseoSans";
    src: url("../fonts/museo_sans/museo_sans-700-webfont.eot");
    src: url("../fonts/museo_sans/museo_sans-700-webfont.eot?#iefix") format("embedded-opentype"),
         url("../fonts/museo_sans/museo_sans-700-webfont.woff") format("woff"),
         url("../fonts/museo_sans/museo_sans-700-webfont.ttf") format("truetype"),
         url("../fonts/museo_sans/museo_sans-700-webfont.svg#MuseoSans700") format("svg");
    font-weight: 700;
    font-style: normal;
}

@font-face {
    font-family: "NewsGotTRegular";
    src: url("../fonts/newsgott-webfont.eot");
    src: url("../fonts/newsgott-webfont.eot?#iefix") format("embedded-opentype"),
         url("../fonts/newsgott-webfont.woff") format("woff"),
         url("../fonts/newsgott-webfont.ttf") format("truetype"),
         url("../fonts/newsgott-webfont.svg#") format("svg");
    font-weight: normal;
    font-style: normal;
}');

  -- Using DBMS_XDB
  v_result := DBMS_XDB.createResource(
                '/css/fonts.css',
                v_xml);
  
  COMMIT;
END;
/