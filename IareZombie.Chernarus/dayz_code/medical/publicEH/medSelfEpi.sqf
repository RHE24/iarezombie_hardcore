// animHealed.sqf

private ["_array","_unit","_medic","_isDead"];
_array = _this; //_this select 0;
_unit = _array select 0;
_medic = _array select 1;
_timer = 900; //15 minutes

[player,"ItemEpinephrine"] call BIS_fnc_invRemove;

	_unit switchMove "AmovPpneMstpSnonWnonDnon_healed";
        
		//save original values
		_r_player_cardiac = r_player_cardiac;
		_r_player_handler1 = r_player_handler1;
		_r_player_inpain = r_player_inpain;
		_r_player_lowblood = r_player_lowblood;
	    _R3F_TIRED_Accumulator = R3F_TIRED_Accumulator;

	while {_timer > 0} do {
	    //update so they dont get changes
	`	r_player_cardiac = false;
		r_player_handler1 = false;
		r_player_lowblood = false;
    	r_player_inpain = false;
	    R3F_TIRED_Accumulator = 0;
		"dynamicBlur" ppEffectAdjust [0]; "dynamicBlur" ppEffectCommit 5;
		"colorCorrections" ppEffectAdjust [1, 1, 0, [1, 1, 1, 0.0], [1, 1, 1, 1],  [1, 1, 1, 1]];"colorCorrections" ppEffectCommit 5;
		sleep 3;
		_timer = _timer - 3;
	};
    //restore original values
	r_player_cardiac = _r_player_cardiac;
	r_player_handler1 = _r_player_handler1;
	r_player_inpain = _r_player_inpain;
	r_player_lowblood = _r_player_lowblood;
	R3F_TIRED_Accumulator = _R3F_TIRED_Accumulator;