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

switch (random 4) do {
case 0: {
_box addWeaponCargoGlobal ["DMR_DZ", 2];
_box addWeaponCargoGlobal ["M9SD", 1];
_box addMagazineCargoGlobal ["15Rnd_9x19_M9SD", 20];
_box addMagazineCargoGlobal ["20Rnd_762x51_DMR", 20];
};

case 1: {
_box addWeaponCargoGlobal ["BAF_LRR_scoped", 1];
_box addWeaponCargoGlobal ["M9SD", 2];
_box addMagazineCargoGlobal ["15Rnd_9x19_M9SD", 10];
_box addMagazineCargoGlobal ["5Rnd_86x70_L115A1", 5];
_box addMagazineCargoGlobal ["20Rnd_762x51_B_SCAR", 5];
// BACKPACKS
_box addBackpackCargoGlobal ["DZ_LargeGunBag_EP1", 2]; 
};
	case 2: {
_box addWeaponCargoGlobal ["M110_NVG_EP1", 1];
_box addWeaponCargoGlobal ["M9SD", 2];
_box addMagazineCargoGlobal ["15Rnd_9x19_M9SD", 5];
_box addMagazineCargoGlobal ["5Rnd_86x70_L115A1", 5];
_box addMagazineCargoGlobal ["20Rnd_762x51_B_SCAR", 5];
// CLOTHING
_box addMagazineCargoGlobal ["Skin_Sniper1_DZ", 2];
};

case 3: {
_box addWeaponCargoGlobal ["BAF_LRR_scoped", 1];
_box addWeaponCargoGlobal ["M110_NVG_EP1", 1];
_box addWeaponCargoGlobal ["M9SD", 2];
_box addMagazineCargoGlobal ["15Rnd_9x19_M9SD", 20];
_box addMagazineCargoGlobal ["5Rnd_86x70_L115A1", 5];
_box addMagazineCargoGlobal ["20Rnd_762x51_B_SCAR", 5];
// CLOTHING
_box addMagazineCargoGlobal ["Skin_Sniper1_DZ", 1];
// BACKPACKS
_box addBackpackCargoGlobal ["DZ_LargeGunBag_EP1", 2]; 
};
};

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
	
	