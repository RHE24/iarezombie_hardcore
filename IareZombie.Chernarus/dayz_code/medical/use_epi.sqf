private ["_timer","_r_player_blood","_increment"];
disableserialization;
_r_player_blood = r_player_blood;
_timer = 1200; //20 minutes
_num_removed = ([player,"ItemMorphine"] call BIS_fnc_invRemove);
	if(_num_removed == 1) then {
	player playActionNow "Medic";

	r_player_blood = (r_player_blood * 2) + 2000 ;
	if (r_player_blood > 12000) then {r_player_blood = 12000;};
	if (r_player_blood < 6000) then {r_player_blood = 6000;};
	r_player_lowblood = false;
	player setVariable["USEC_BloodQty",r_player_blood,true];
	10 fadeSound 1;
	"dynamicBlur" ppEffectAdjust [0]; "dynamicBlur" ppEffectCommit 5;
	"colorCorrections" ppEffectAdjust [1, 1, 0, [1, 1, 1, 0.0], [1, 1, 1, 1],  [1, 1, 1, 1]];"colorCorrections" ppEffectCommit 5;
_increment = (r_player_blood - _r_player_blood) / 1200;
while {_timer > 0} do {
	player setVariable["USEC_BloodQty",r_player_blood,true];
	r_player_blood = r_player_blood - _increment;
	sleep 1;
	
};
};
	
	
