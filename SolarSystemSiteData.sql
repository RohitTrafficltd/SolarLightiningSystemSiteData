select * from salisburyvehiclecount
where datetime > '2022-3-25'




select * from devices





CREATE TABLE webSpeed_State(
id int,
state text
);




CREATE TABLE webSpeed_SpeedSign(
	region_id int NULL,
	site_id int NULL,
	sign_identity text NULL,
	sign_name text NULL,
	sim_card_code text NULL,
	ip_address text NULL,
	port int NULL,
	school_id int NULL,
	use_site_address boolean NULL,
	address1 text NULL,
	address2 text NULL,
	town text NULL,
	postcode text NULL,
	state text NULL,
	country text NULL,
	latitude real NULL,
	longitude real NULL,
	sign_type text NULL,
	speed text NULL,
	static_times text NULL,
	display_mode text NULL,
	continuous_operation boolean NULL,
	wig_wag_flash_mode text NULL,
	wig_wag_flash_frequency real NULL,
	wig_wag_flash_rate int NULL,
	annulus_flash_mode text NULL,
	annulus_flash_frequency real NULL,
	annulus_flash_rate int NULL,
	serial_number text NULL,
	order_number text NULL,
	install_date text NULL,
	am_hour_on int NULL,
	am_min_on int NULL,
	am_hour_off int NULL,
	am_min_off int NULL,
	pm_hour_on int NULL,
	pm_min_on int NULL,
	pm_hour_off int NULL,
	pm_min_off int NULL,
	sign_in_operation boolean NULL,
	current_alert_level int NULL,
	maintenance_status text NULL,
	last_service_date text NULL,
	last_time_active text NULL,
	last_time_communicated text NULL,
	last_time_door_opened text NULL,
	last_time_door_closed text NULL,
	last_end_of_day_voltage real NULL,
	id SERIAL NOT NULL PRIMARY KEY,
	brightness_mode int NULL,
	brightness_value int NULL,
	sign_clock text NULL,
	comms boolean NULL,
	data_service_centre text NULL,
	sip_address text NULL,
	server_no int NULL,
	firmware_version text NULL,
	brightness_template int NULL,
	schedule_mode boolean NULL,
	cyberlock_id text NULL,
	sim_id text NULL,
	phone bigint NULL,
	modem_firmware_version text NULL
);



Drop table webSpeed_SpeedSign

INSERT INTO webSpeed_SpeedSign (region_id, site_id,sign_identity,sign_name,sim_card_code,ip_address,port,school_id,use_site_address,address1,address2,town,postcode,state,country,latitude,longitude,sign_type,speed,static_times,display_mode,continuous_operation,wig_wag_flash_mode,wig_wag_flash_frequency,wig_wag_flash_rate,annulus_flash_mode,annulus_flash_frequency,annulus_flash_rate,serial_number,order_number,install_date,am_hour_on,am_min_on,am_hour_off,am_min_off,pm_hour_on,pm_min_on,pm_hour_off,pm_min_off,sign_in_operation,current_alert_level,maintenance_status,last_service_date,last_time_active,last_time_communicated,last_time_door_opened,last_time_door_closed,last_end_of_day_voltage,id,brightness_mode,brightness_value,sign_clock,comms,data_service_centre,sip_address,server_no,firmware_version,brightness_template,schedule_mode,cyberlock_id,sim_id,phone,modem_firmware_version) VALUES(0,0,'4818_03','Bohlevale School Road','10447819425','eszs.artcraft.com.au',5005,945,False,'1 Bohlevale School Road ','','','','','',-19.24787,146.6838,'B','40','','',True,'',0,0,'',0,0,'','',7/26/2013,0,0,0,0,0,0,0,0,False,0,'','','',12/22/2021,'','',0,14311,0,12,12/21/2021,True,'','',2,2.07,1,False,'','',0,'')


CREATE TABLE webSpeed_speedSign(
region_id int,
site_id   int,
sign_identity text,
sign_name text,
sim_card_code text,
ip_address    text,
port int,
school_id int,
use_site_address bit,
address1 text,
address2 text,
town text,
postcode text,
state   text,
country text,
latitude real,
longitude real,
sign_type text,
speed     text,
static_times text,
display_mode text,
continuous_operation 
);





CREATE TABLE webSpeed_SignEventLog(
sign_id int,
log_date_time timestamp,
event_type int,
event_value int,
id SERIAL NOT NULL PRIMARY KEY
);


select * from webSpeed_SignEventLog

CREATE TABLE webSpeed_faultStatus(
id int,
status text
);

INSERT INTO webSpeed_SignEventType (event_type, event_value,value_description,alert_level,id,value_catagory,event_group) VALUES(1,0,'System Reset',0,1,'',)

CREATE TABLE webSpeed_SignEventType (
event_type int,
event_value int,
value_description text,
alert_level int,
id SERIAL NOT NULL PRIMARY KEY,
value_catagory text,
event_group int
);



CREATE TABLE webSpeed_Sign$ (
School_Name  text,
sign_name    text,
Address_1    text,
Sign_ID      text,
sim_card_code text,
Sign_Types    text,
Sign_Times    text,
Speed         text,
Current_Control_Board_Serial_Number text,
Term_Dates    text,
Public_Holiday_Dates text,
Show_Day_2016  text,
Show_Day_2017  text,
Firmware_Updated_To float,
Server_No float,
Flash_Mode     text,
school_id     int
);

select count(*) from webSpeed_Sign$


Drop table webSpeed_Sign$




CREATE TABLE webSpeedSignsStateLog (
 sign_id int,
 log_date_time TimeStamp,
 main_battery_voltage float,
 backup_battery_voltage float,
 temperature float,
 log_capacity int,
 local_comms_state boolean,
 active_state boolean,
 display_state boolean,
 local_test_state boolean,
 sign_tilt_state boolean,
 solar_panel_state boolean,
 door_state boolean,
 vibration_state boolean,
 photo_sensor_state boolean,
 wig_wag_1_display boolean,
 wig_wag_2_display boolean,
 annulus_display boolean,
 annulus_total_failure_state boolean,
 wig_wag_1_over_20pct_state boolean,
 wig_wag_2_over_20pct_state boolean,
 annulus_over_20pct_state boolean,
 wig_wag_1_faulty_leds int,
 wig_wag_2_faulty_leds int,
 annulus_faulty_leds int,
 sign_type int,
 id SERIAL NOT NULL PRIMARY KEY,
 brightness_lv int
 );


CREATE TABLE verMacSigns (
  id SERIAL NOT NULL PRIMARY KEY,
  organizationId int,
  organizationName text,
  signId int,
  signName text,
  signDescription text,
  signDirection text,
  signStatus text,
  singVoltage float,
  signPositionIsEmpty boolean,
  signLatitude float,
  signLongitude float,
  signLastGetStatus TimeStamp,
  messageActivationDate TimeStamp,
  messageIsOverrided boolean,
  messageScript text,
  messageGif text
  );

drop table verMacSigns


CREATE TABLE salisburyVehicleCount (
  id SERIAL NOT NULL PRIMARY KEY,
  dateTime TimeStamp,
  vehicleCount int,
  entrySpeed Float,
  exitSpeed Float,
  averageSpeeed Float,
  peakSpeed Float
  );



Drop table webSpeedLogFiles


CREATE TABLE salisburyKestalBattery (
  id SERIAL NOT NULL PRIMARY KEY,
  dateTime timestamp,
  voltage float
 );
 
pg_dump VASLogDb -t 'salisburyvehiclecount'

SELECT table_name, column_name, data_type 
FROM information_schema.columns 
WHERE table_name = 'salisburyvehiclecount'; 


select * from salisburyvehiclecount
where datetime >= '2021-10-18 00:00:00'::date 
 AND datetime <= '2021-10-20 00:00:00'::date;
 
 drop table salisburykestalbattery
 
 
 select * from salisburyvehiclecountwhere datetime >= '10/6/2021 4:52:12 PM'::dateAND datetime <= '10/6/2021 4:46:49 PM'::date;
 
 CREATE TABLE IF NOT EXISTS SolarSystemSiteData (
    siteId INT,
    data_circuit INT,
    data_circuit_name TEXT,
    data_data_apparentPower NUMERIC(7, 2),
    data_data_current NUMERIC(4, 2),
    data_data_energy NUMERIC(6, 2),
    data_data_energyNeg NUMERIC(3, 2),
    data_data_energyPos NUMERIC(6, 2),
    data_data_power NUMERIC(7, 2),
    data_data_powerFactor NUMERIC(3, 2),
    data_data_reactiveEnergy NUMERIC(5, 2),
    data_data_reactivePower NUMERIC(6, 2),
    data_data_time INT,
    data_data_voltage NUMERIC(5, 2),
    data_monitors TEXT,
    data_pk INT,
    data_polarity INT,
    data_watt_device_id TEXT
);

drop table SolarSystemSiteData