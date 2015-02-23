//	@file Version: 1.0
//	@file Name: vehicleTestSpawn.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy
//	@file Created: 20/11/2012 05:19
//	@file Args:

//EDIT THIS FILE TO CREATE UNITS INSIDE ACTUAL VEHICLES THEN SETDAMAGE 1 SO THE VEHICLE IS DESTROYED AND THE CREW IS KILLED

// THIS SETS A VEHICLE ON ITS SIDE.
//car1 setvectorup [0,0.1,0.01] 


private ["_counter","_pos","_markerName","_marker","_amountOfVehicles","_hint"];

//Object List - Random Spawns.
_objectList = ["UAZWreck",
				"SKODAWreck",
				"LADAWreck",
                "datsun02Wreck",
                "datsun01Wreck",
				"hiluxWreck",
				"Misc_TyreHeap"];
//Object List - Random Spawns.
_militaryList = ["UAZWreck",
				"SKODAWreck",
				"LADAWreck",
                "datsun02Wreck",
                "datsun01Wreck",
				"hiluxWreck",
				"Misc_TyreHeap",
				"UH1Wreck",
				"BMP2Wreck",
				"BRDMWreck",
                "MH60Wreck",
                "HMMWVWreck",
				"Mi8Wreck",
				"T72Wreck",
                "T72WreckTurret",
				"UralWreck",
				"Ka52Wreck",
				"A10Wreck",
				"GRAD_INS"];
_civbodyList = ["damsel2",
				"hooker2",
				"rocker2",
				"worker2",
				"farmwife2",
				"ibr_lingorman1",
				"ibr_lingorman2",
				"ibr_lingorman3",
				"ibr_lingorman4",
				"ibr_lingorman5",
				"ibr_lingorman6",
				"ibr_lingorman7",
				"ibr_lingorman1s",
				"ibr_lingorman2s",
				"ibr_lingorman3s",
				"ibr_lingorman4s",
				"ibr_lingorman5s",
				"ibr_lingorman6s",
				"RU_Policeman",
				"Priest",
				"Pilot",
				"Doctor",
				"Citizen2",
				"Woodlander2",
				"Villager2"];
				
				
				

			
BIS_Effects_Burn = compile preprocessFile "\ca\Data\ParticleEffects\SCRIPTS\destruction\burn.sqf";

_counter = 0;

for "_i" from 1 to 350 do
{
    _pos = getMarkerPos format ["debris_%1", _i];
    
    _newpos = [_pos, 41, 150, 1, 0, 40 * (pi / 180), 0] call BIS_fnc_findSafePos;

	//-----------------------------------------------------------

		_Objtype = _objectList select (random (count _objectList - 1));
		_obj = createVehicle [_Objtype,_newpos,[], 50,"None"]; 
		
		_obj setpos [getpos _obj select 0,getpos _obj select 1,0];
		_obj setdir (random 360);		
		if ((random 10) < 2) then {
			_obj setVehicleInit "nul = [this, 6, time, false, false] spawn BIS_Effects_Burn";
			};
		processInitCommands;
	
	//-----------------------------------------------------------

    _newpos = [_pos, 41, 150, 1, 0, 40 * (pi / 180), 0] call BIS_fnc_findSafePos;
	//-----------------------------------------------------------

		_Objtype = _objectList select (random (count _objectList - 1));
		_obj = createVehicle [_Objtype,_newpos,[], 50,"None"]; 
		_obj setpos [getpos _obj select 0,getpos _obj select 1,0];
		_obj setdir (random 360);
	
	//-----------------------------------------------------------
	    _newpos = [_pos, 41, 150, 1, 0, 40 * (pi / 180), 0] call BIS_fnc_findSafePos;
	//-----------------------------------------------------------

		_Objtype = _civbodyList select (random (count _civbodyList - 1));
		_obj = createVehicle [_Objtype,_newpos,[], 50,"None"]; 
		_obj setpos [getpos _obj select 0,getpos _obj select 1,0];
		_obj setdir (random 360);
		clearMagazineCargoGlobal _obj;
		clearWeaponCargoGlobal _obj;
		_obj setdamage 1;
		_obj enableSimulation false;
		
	
	//-----------------------------------------------------------
    
    _counter = _counter + 3;
};

diag_log format["SERVER - %1 Objects Spawned",_counter];


_counter = 0;

for "_i" from 1 to 95 do
{
    _pos = getMarkerPos format ["debris_military_%1", _i];
    
    _newpos = [_pos, 41, 150, 1, 0, 40 * (pi / 180), 0] call BIS_fnc_findSafePos;

	//-----------------------------------------------------------

		_Objtype = _militaryList select (random (count _militarylist - 1));
		_obj = createVehicle [_Objtype,_newpos,[], 50,"None"]; 
		IF (_objtype in ["GRAD_INS"]) THEN {_obj setdamage 1;};
		_obj setpos [getpos _obj select 0,getpos _obj select 1,0];
		_obj setdir (random 360);
		if ((random 10) < 3) then {
			_obj setVehicleInit "nul = [this, 6, time, false, false] spawn BIS_Effects_Burn";
			};
		processInitCommands;
	
	//-----------------------------------------------------------

    _newpos = [_pos, 41, 150, 1, 0, 40 * (pi / 180), 0] call BIS_fnc_findSafePos;
	//-----------------------------------------------------------

		_Objtype = _militaryList select (random (count _militarylist - 1));
		_obj = createVehicle [_Objtype,_newpos,[], 50,"None"];
        IF (_objtype in ["GRAD_INS"]) THEN {_obj setdamage 1;};		
		_obj setpos [getpos _obj select 0,getpos _obj select 1,0];
		_obj setdir (random 360);
		if ((random 10) < 3) then {
			_obj setVehicleInit "nul = [this, 6, time, false, false] spawn BIS_Effects_Burn";
			};
		processInitCommands;
	
	//-----------------------------------------------------------
    
    _counter = _counter + 2;
};

diag_log format["SERVER - %1 Objects Spawned",_counter];