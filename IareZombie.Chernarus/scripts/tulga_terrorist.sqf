//Tulga Terrorist

private ["_position","_box","_missiontimeout","_cleanmission","_playerPresent","_starttime","_currenttime","_cleanunits","_rndnum"];

_position = [12300 +(random 600),3880+(random 600),0];

 

if (isserver) then {
_box = createVehicle ["LocalBasicAmmunitionBox",[(_position select 0) + 2,(_position select 1) + 2,0], [], 0, "CAN_COLLIDE"];
_box setVariable ["ObjectID","1",true];
_box setVariable ["permaLoot",true];
PVDZE_serverObjectMonitor set [count PVDZE_serverObjectMonitor,_box];

clearWeaponCargoGlobal _box;
clearMagazineCargoGlobal _box;
_pistolselect = [["M9SD","15Rnd_9x19_M9SD"],["RH_Deagleg","RH_7Rnd_50_AE"],["DDOPP_X3_b","DDOPP_3Rnd_X3"],["RH_bull","RH_6Rnd_44_Mag"],["RH_browninghp","RH_13Rnd_9x19_bhp"],["RH_mk22sd","RH_8Rnd_9x19_Mksd"],["RH_muzi","RH_32Rnd_9x19_Muzi"]] call BIS_fnc_selectRandom;
_weaponselect = [["DMR_DZ","20Rnd_762x51_DMR"],["BAF_LRR_scoped","5Rnd_86x70_L115A1"],["M110_NVG_EP1","5Rnd_86x70_L115A1"],["FHQ_RSASS_TAN","FHQ_rem_20Rnd_762x51_PMAG_NT"],["FHQ_RSASS_TWS_SD_TAN","FHQ_rem_20Rnd_762x51_PMAG_NT"],["FHQ_XM2010_SD_DESERT","FHQ_rem_5Rnd_300Win_XM2010_NT_SD"],["vil_SVD_S","10Rnd_762x54_SVD"]] call BIS_fnc_selectRandom;
_magselect = [["20Rnd_762x51_B_SCAR"],["15Rnd_9x19_M9SD"],["5Rnd_86x70_L115A1"],["FHQ_rem_20Rnd_762x51_PMAG_NT"],["FHQ_rem_5Rnd_300Win_XM2010_NT"],["FHQ_rem_5Rnd_300Win_XM2010_NT_SD"],["10Rnd_762x54_SVD"]] call BIS_fnc_selectRandom;

_box addWeaponCargoGlobal [_pistolselect select 0, 1];
_box addWeaponCargoGlobal [_weaponselect select 0, 1];
_box addMagazineCargoGlobal [_magselect select 0, ((random 20)+ 3)];
_box addMagazineCargoGlobal ["Skin_Sniper1_DZ", 1];
_box addBackpackCargoGlobal ["DZ_LargeGunBag_EP1", 1]; 

//----------------------------------------------------------------------------         
 
diag_log format["TULGA TERRORIST created at  %1",_position];

_baserunover = createVehicle ["Land_KBud",[(_position select 0) -2, (_position select 1) -2,0],[], 0, "CAN_COLLIDE"];
_basecampfire = createVehicle ["Land_Campfire_burning",[(_position select 0) +2, (_position select 1) -2,0],[], 0, "CAN_COLLIDE"];

_ttGroup = creategroup EAST;
_terrorist = _ttGroup createUnit ["TK_INS_Soldier_3_EP1", _position, [], 0, "FORM"];
_wp =_ttGroup addWaypoint [[(_position select 0) + random(500), (_position select 1)+ random(500),0],0 ];
[_ttGroup, 0] setWaypointBehaviour "Combat";
[_ttGroup, 0] setWaypointSpeed "Limited";
[_ttGroup, 0] setWaypointType "move";
_wp =_ttGroup addWaypoint [[(_position select 0) + random(500), (_position select 1)+ random(500),0],0 ];
[_ttGroup, 1] setWaypointBehaviour "Combat";
[_ttGroup, 1] setWaypointType "move";
_wp =_ttGroup addWaypoint [[(_position select 0) + random(500), (_position select 1)+ random(500),0],0 ];
[_ttGroup, 2] setWaypointBehaviour "Combat";
[_ttGroup, 2] setWaypointType "move";
//back to camp
_wp =_ttGroup addWaypoint [[(_position select 0), (_position select 1),0],0 ];
[_ttGroup, 3] setWaypointType "cycle";

 
_tulgaterrorist = true;
_terroristAlive = true;
_campHidden = true;
_runonce = true;
while {_tulgaterrorist} do{
sleep 5;
if (_campHidden) then {
		
		{
		if((isPlayer _x) AND (_x distance _position <= 10)) then {
			diag_log format["TULGA TERRORIST: Location discovered %1",_position];
			[nil,nil,rTitleText,"The Tulga Terrorists camp has been located!", "PLAIN",10] call RE;
			//make the terrorist run back to base camp
			if (alive _terrorist) then {
			_wp =_ttGroup addWaypoint [[(_position select 0), (_position select 1),0],0 ];
			[_ttGroup, 4] setWaypointBehaviour "Combat";
			[_ttGroup, 4] setWaypointSpeed "FULL";
			_ttGroup setCurrentWaypoint [_ttGroup, 4];
			};
			_campHidden = false;
			
			};
		
		
		}forEach playableUnits;


	
	};
if (!(alive _terrorist) && _runOnce) then {
	diag_log format["TULGA TERRORIST: KILLED! %1",_position];
	[nil,nil,rTitleText,"The Tulga Terrorist has been KILLED!", "PLAIN",10] call RE;
	_runonce = false;
	};

};
	
};
	
	
	//------------------------------------------------------------------------
	//Launch smoke into air .. triggered security system
	//Set waypoint of TT to player, set speed to full, 
   
};
	
	