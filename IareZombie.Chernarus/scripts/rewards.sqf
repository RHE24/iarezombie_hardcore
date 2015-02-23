//just connected, find the next goal above current kills
diag_log "REWARD: starting";
waitUntil { !isNil(player getVariable["zombieKills",0])};
diag_log "REWARD: !ISNIL";

sleep 60;
_goalIDX = 0;
_droprange = 250;
_zkills = 	player getVariable["zombieKills",0];
_goals = [5,10,15,25,50,75,100,150,200,250,300,400,500,600,700,800,900,1000,1100,1200,1300,1400,1500];

//set our initial goal at joining
{ 
if (_zkills >= _x) then {
	_goalIDX = _forEachIndex;
	_goalIDX = _goalIDX + 1;
	};
	diag_log format["REWARD_LOG Loop _x - %3, zkills = %1, _goalidx = %2",_zkills,_goalIDX, _x];

} forEach _goals;

//loop continuously checking if we have reached our goal
while {alive player} do {
_zkills = 		player getVariable["zombieKills",0];
if (_zkills >= (_goals select _goalIDX)) then {
	_goalIDX = _goalIDX + 1;
	hint format ["Congratulations! You have killed %1 zombies and reached a reward goal. Next goal is %2",_zkills,_goals select _goalIDX ];
	diag_log(format["REWARD DELIVERY: sending reward to %1, kills %2, Next Goal %3",name player, _zkills, _goalIDX ]);
	//increase our goal
	


	 //get some rewards and then deliver it
	
    //------------------------------STATIC LOOT TABLES---------------------------------------------
    //Edit the items array they are selected randomly
    _rewardLoot = [["ItemSodaMdew",2],
    ["ItemSodaOrangeSherbet",3],
    ["PartVRotor",1],
    ["PartGlass", 4], 
    ["ItemTankTrap",3],
    ["PartFueltank",1],
    ["NVGoggles",1],
    ["SVD_CAMO", 1],
    ["M24", 1],
    ["M240_DZ", 1],
    ["AmmoBoxSmall_762",1],
    ["AmmoBoxSmall_556", 1],
    ["DZ_LargeGunBag_EP1", 1],
    ["PipeBomb", 1],
    ["100Rnd_762x54_PK", 1]] call bis_fnc_selectrandom;
    //-------------------------------END STATIC LOOT--------------------------------------
	
_deliveryModel = ["an2_dz","CSJ_GyroC","pook_H13_civ_yellow","CSJ_GyroP","CYBP_Camel_civ","GNT_C185","MH6J_DZ","CH_47F_BAF" ] call BIS_fnc_selectRandom;
_boxtype = ["UNBasicAmmunitionBox_EP1","GuerillaCacheBox_EP1","USBasicAmmunitionBox_EP1","TKBasicAmmunitionBox_EP1"] call BIS_fnc_selectRandom;//type of box
_heliStart = [7500,7500,0];
_startpoint = [4000,10000,0];
_rewardname= getText (configFile >> "CfgVehicles" >> _deliverymodel >> "displayName");

    _position = (getPos player);
    diag_log(format["REWARDSPAWNER: %1 started flying from %2 to %3 NOW!(TIME:%4)", _rewardName,  str(_heliStart), str(_position), round(time)]);
    _startTime = time;
    _rewardPlane = createVehicle [_deliverymodel,_heliStart, [], 0, "FLY"];
    _rewardPlane setCombatMode "BLUE";
    _rewardPlane engineOn true;
    _rewardPlane flyInHeight 250;
    _rewardPlane forceSpeed 100;
    _rewardPlane setspeedmode "LIMITED";
    _landingzone = createVehicle ["HeliHEmpty", [_position select 0, _position select 1,0], [], 0, "CAN_COLLIDE"];
    _aigroup = creategroup civilian;
    _pilot = _aigroup createUnit ["SurvivorW2_DZ",getPos _rewardPlane,[],0,"FORM"];
    _pilot setCombatMode "BLUE";
    _pilot moveindriver _rewardPlane;
    _pilot assignAsDriver _rewardPlane;
    sleep 0.5;
   
    //Drop Point
	_waypoint = _aigroup addWaypoint [position _landingzone, 0];
    _waypoint setWaypointType "MOVE";
    _waypoint setWaypointBehaviour "CARELESS";
	
	//second waypoint 1000m away and go back to drop zone
	_waypoint2 = _aigroup addWaypoint [[4000,10000,0]]; 
    _waypoint2 setWaypointType "CYCLE";
    _waypoint2 setWaypointBehaviour "CARELESS";
	
	
    waituntil {(_rewardPlane distance _position) <= 1000 };
    _rewardPlane flyInHeight 150;
    _rewardPlane forceSpeed 100;
    _rewardPlane setspeedmode "Limited";
    		
	   
	waituntil {(_rewardPlane distance _position) <= _droprange};
	_rewardPlane flyInHeight 100;
    _chute = createVehicle ["ParachuteMediumEast", _position, [], 0, "FLY"];
	_chutePos = getPos _chute;
	_box = createVehicle [_boxtype, _chutePos, [], 0, "FLY"];
	clearMagazineCargoGlobal _box;
	_box addMagazineCargoGlobal [_rewardloot select 0,_rewardloot select 1];

	_box attachTo [_chute, [0,0,3]];
	_box setVariable ["Mission",1,true];
	_chute setVariable ["Mission",1,true];
	_box setVariable ["ObjectID", ""];
	_chute setVariable ["ObjectID", ""];
	_smoke = "SmokeShellYellow" createVehicle (getPos _box);
	_smoke attachTo [_box, [0,0,0]];
	//display text to alert user
	_textt = format ["\nPackage has been dropped!",10];
	titleText [_textt,"PLAIN DOWN"];
	while {getPos _box select 2 > 4} do
	{
	 _chute SetVelocity [0,0,-6];
	 uiSleep 0.1;
	};
	detach _box;
	deleteVehicle _chute;
	while {getPos _box select 2 > 0} do {
	_box setPos [getPos _box select 0, getPos _box select 1, (getPos _box select 2) - .25]
	};
	//another smoke for on the ground
	_smoke = "SmokeShellYellow" createVehicle (getPos _box);
	_smoke attachTo [_box, [0,0,-1]];

	deleteVehicle _pilot;
	deleteVehicle _rewardplane;
    diag_log(format["REWARD SPAWNER: %1 just delivered a  %2 at %3!, ", _rewardName,_rewardLoot, str(getPosATL _rewardPlane)]);
	
	};
sleep 3
};



