/*	
	For DayZ Epoch
	Addons Credits: Jetski Yanahui by Kol9yN, Zakat, Gerasimow9, YuraPetrov, zGuba, A.Karagod, IceBreakr, Sahbazz
*/
startLoadingScreen ["","RscDisplayLoadCustom"];
cutText ["","BLACK OUT"];
enableSaving [false, false];

//REALLY IMPORTANT VALUES
dayZ_instance =	11;					//The instance
dayzHiveRequest = [];
initialized = false;
dayz_previousID = 0;

DZE_ForceNameTagsOff = true;
DZE_APlotforLife = true;
DZE_modularBuild = true;
DZE_ConfigTrader = true;
DrinkWater = true;


//disable greeting menu 
player setVariable ["BIS_noCoreConversations", true];
//disable radio messages to be heard and shown in the left lower corner of the screen
enableRadio false;
// May prevent "how are you civillian?" messages from NPC
enableSentences true;

// DayZ Epoch config
spawnShoremode = 0; // Default = 1 (on shore)
spawnArea= 1500; // Default = 1500

MaxVehicleLimit = 200; // Default = 50
MaxDynamicDebris = 100; // Default = 100
dayz_MapArea = 14000; // Default = 10000
dayz_maxLocalZombies = 60; // Default = 30 
DZE_R3F_WEIGHT = true;
dayz_paraSpawn = true;

ns_blowout = true; // true / false
ns_blowout_dayz = true;// true / false
ns_blow_delaymod = 0.74; //blowout delay
ns_blow_itemapsi = "NVGoggles"; //ItemAPSI replacement
ns_blow_playerdamage = 3000; // damage players without ns_blow_itemapsi can get per blowout
ns_blow_emp = false; //Namalsk Only
ns_blow_prep = false;

dayz_minpos = -1; 
dayz_maxpos = 16000;

dayz_sellDistance_vehicle = 10;
dayz_sellDistance_boat = 30;
dayz_sellDistance_air = 40;

dayz_maxAnimals = 8; // Default: 8
dayz_tameDogs = true;
DynamicVehicleDamageLow = 20; // Default: 0
DynamicVehicleDamageHigh = 80; // Default: 100
DynamicVehicleFuelLow = 20;
DynamicVehicleFuelHigh = 85;
MaxMineVeins = 0;
DZE_vehicleAmmo = 1; //Default = 0, 1 to disable, 0 to enable.
DefaultMagazines = ["ItemBandage","ItemMorphine","17Rnd_9x19_glock17","17Rnd_9x19_glock17"]; 
DefaultWeapons = ["glock17_EP1","ItemFlashlight","ItemHatchet"]; 
DefaultBackpack = ""; 
DefaultBackpackWeapon = "";

DZE_BuildOnRoads = false; // Default: False

EpochEvents = [
["any","any","any","any",0,"crash_spawner"],
["any","any","any","any",20,"crash_spawner"],
["any","any","any","any",40,"crash_spawner"],
["any","any","any","any",50,"supply_drop"]];
dayz_fullMoonNights = true;

//Load in compiled functions
call compile preprocessFileLineNumbers "dayz_code\init\variables.sqf";				//Initilize the Variables (IMPORTANT: Must happen very early)
progressLoadingScreen 0.1;
call compile preprocessFileLineNumbers "dayz_code\init\publicEH.sqf";				//Initilize the publicVariable event handlers
progressLoadingScreen 0.2;
call compile preprocessFileLineNumbers "dayz_code\medical\setup_functions_med.sqf";	//Functions used by CLIENT for medical
progressLoadingScreen 0.4;
call compile preprocessFileLineNumbers "dayz_code\init\compiles.sqf";				//Compile regular functions
/*ZSC*/	
call compile preprocessFileLineNumbers "CfgServerTrader\gold\ZSCinit.sqf";
/*ZSC*/	
progressLoadingScreen 0.5;
call compile preprocessFileLineNumbers "server_traders_cherno_11.sqf";	
//call compile preprocessFileLineNumbers "server_traders.sqf";				//Compile trader configs
progressLoadingScreen 1.0;

"filmic" setToneMappingParams [0.153, 0.357, 0.231, 0.1573, 0.011, 3.750, 6, 4]; setToneMapping "Filmic";

if (isServer) then {
	call compile preprocessFileLineNumbers "\z\addons\dayz_server\missions\DayZ_Epoch_11.Chernarus\dynamic_vehicle.sqf";
	//Compile vehicle configs
	

	// Add trader citys
	_nil = [] execVM "\z\addons\dayz_server\missions\DayZ_Epoch_11.Chernarus\mission.sqf";
	_serverMonitor = 	[] execVM "dayz_code\system\server_monitor.sqf";

};


endLoadingScreen; // Work around for loadscreen freeze

if (!isDedicated) then {
	//Conduct map operations
	0 fadeSound 0;
	waitUntil {!isNil "dayz_loadScreenMsg"};
	dayz_loadScreenMsg = (localize "STR_AUTHENTICATING");
	
	//Run the player monitor
	_id = player addEventHandler ["Respawn", {_id = [] spawn player_death;}];
	_playerMonitor = 	[] execVM "dayz_code\system\player_monitor.sqf";
    execVM "CfgServerTrader\compiles\playerHud.sqf";
	
	
	//anti Hack
	//[] execVM "\z\addons\dayz_code\system\antihack.sqf";

	//Lights
	[false,12] execVM "\z\addons\dayz_code\compile\local_lights_init.sqf";
	execVM "scripts\rules.sqf";
	execVM "scripts\kill_msg.sqf";
	
	
	
};

//#include "\z\addons\dayz_code\system\REsec.sqf"
if(!isserver) then {
execvm "scripts\ServicePoints\service_point.sqf";
execvm "scripts\rules.sqf";
execvm "scripts\rewards.sqf";
};

//Start Dynamic Weather
execVM "dayz_code\external\DynamicWeatherEffects.sqf";

[] execVM "addons\R3F_ARTY_AND_LOG\init.sqf";
[] execVM "scripts\tulga_Terrorist.sqf";

if (isServer) then { _bul = [ns_blow_emp] execVM "scripts\blowout\module\blowout_server.sqf"; };
if (!isDedicated) then { _bul = [] execVM "scripts\blowout\module\blowout_client.sqf"; };

#include "\z\addons\dayz_code\system\BIS_Effects\init.sqf"

/*
TEST RADIO TRIGGER 
_this = createTrigger ["EmptyDetector", [7024.4883, 7660.3794, 0]];
_this setTriggerActivation ["ALPHA", "PRESENT", true];
_this setTriggerStatements ["this", "unit = group player createUnit [""Survivor2_DZ"", Position player, [], 0, ""FORM""];", ""];
*/

