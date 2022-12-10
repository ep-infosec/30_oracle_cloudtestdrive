drop user osm3 cascade
/


create user osm3 identified by "Welcome12----"
/

grant create session to "OSM3"
/

ALTER USER "OSM3" ACCOUNT UNLOCK;

GRANT CONNECT, RESOURCE, DWROLE TO  "OSM3";

GRANT UNLIMITED TABLESPACE TO "OSM3";

BEGIN
    ORDS.ENABLE_SCHEMA(p_enabled => TRUE,
                       p_schema => 'OSM3',
                       p_url_mapping_type => 'BASE_PATH',
                       p_url_mapping_pattern => 'OSM3',
                       p_auto_rest_auth => FALSE);
    commit;
END;
/

CREATE TABLE "OSM3"."CUSTOMERS" 
(	"CUST_NO" NUMBER NOT NULL ENABLE, 
	"CUST_NAME" VARCHAR2(128 BYTE) NOT NULL ENABLE, 
	"CUST_EMAIL" VARCHAR2(128 BYTE) NOT NULL ENABLE, 
	"CUST_MOBILE" VARCHAR2(16 BYTE) NOT NULL ENABLE, 
	"CUST_ADDRESS" VARCHAR2(128 BYTE), 
	"CUST_TS" TIMESTAMP (6), 
	"CUST_AGE" NUMBER, 
	"REG_ID" VARCHAR2(8 BYTE), 
	"EDUL_ID" VARCHAR2(8 BYTE), 
	"PROF_ID" VARCHAR2(8 BYTE), 
	 PRIMARY KEY ("CUST_NO")
)
/
CREATE TABLE "OSM3"."POLICIES" 
   (	"POL_NO" NUMBER NOT NULL ENABLE, 
	"POL_FROM" DATE NOT NULL ENABLE, 
	"POL_TO" DATE NOT NULL ENABLE, 
	"POL_VALUE" NUMBER(8,2) NOT NULL ENABLE, 
	"POL_SUB_TOTAL" NUMBER(8,2) NOT NULL ENABLE, 
	"PT_CODE" VARCHAR2(8 BYTE) NOT NULL ENABLE, 
	"DT_CODE" VARCHAR2(8 BYTE), 
	"POL_TOTAL" NUMBER(8,2) NOT NULL ENABLE, 
	"CUST_NO" NUMBER NOT NULL ENABLE, 
	 PRIMARY KEY ("POL_NO")
)
/
CREATE TABLE "OSM3"."CLAIMS" 
   (	"CUST_NO" NUMBER NOT NULL ENABLE, 
	"POL_NO" NUMBER NOT NULL ENABLE, 
	"CLM_DATE" DATE, 
	"CLM_AMT" NUMBER(8,2), 
	"CLM_STATUS" VARCHAR2(8 BYTE), 
	 PRIMARY KEY ("CUST_NO", "POL_NO")
)
/
CREATE TABLE "OSM3"."CLAIM_STATUS" 
   (	"CLM_STATUS" VARCHAR2(8 BYTE), 
	"CLM_STATUS_DESC" VARCHAR2(128 BYTE), 
	 PRIMARY KEY ("CLM_STATUS")
)
/
CREATE TABLE "OSM3"."DISCOUNT_TYPES" 
   (	"DT_CODE" VARCHAR2(8 BYTE) NOT NULL ENABLE, 
	"DT_DESC" VARCHAR2(128 BYTE) NOT NULL ENABLE, 
	"DT_PERC" NUMBER, 
	 PRIMARY KEY ("DT_CODE")
)
/
CREATE TABLE "OSM3"."EDU_LEVELS" 
   (	"EDUL_ID" VARCHAR2(8 BYTE), 
	"EDUL_NAME" VARCHAR2(128 BYTE) NOT NULL ENABLE, 
	 PRIMARY KEY ("EDUL_ID")
)
/
CREATE TABLE "OSM3"."POLICY_TYPES" 
   (	"PT_CODE" VARCHAR2(8 BYTE) NOT NULL ENABLE, 
	"PT_DESC" VARCHAR2(128 BYTE) NOT NULL ENABLE, 
	 PRIMARY KEY ("PT_CODE")
)
/
CREATE TABLE "OSM3"."PROFESSIONS" 
   (	"PROF_ID" VARCHAR2(8 BYTE), 
	"PROF_NAME" VARCHAR2(128 BYTE) NOT NULL ENABLE, 
	 PRIMARY KEY ("PROF_ID")
)
/
CREATE TABLE "OSM3"."REGIONS" 
   (	"REG_ID" VARCHAR2(8 BYTE), 
	"REG_NAME" VARCHAR2(128 BYTE) NOT NULL ENABLE, 
	 PRIMARY KEY ("REG_ID")
)
/


