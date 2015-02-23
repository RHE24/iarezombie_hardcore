// animHealed.sqf

private ["_array","_unit","_medic","_isDead"];
_array = _this; //_this select 0;
_unit = _array select 0;
_medic = _array select 1;

_isDead = _unit getVariable["USEC_isDead",false];

if (local _unit) then {_unit setCaptive false};

if (!_isDead) then {
	_unit switchMove "AmovPpneMstpSnonWnonDnon_healed";
	//no need to public broadcast the variables since this runs on every peer
	_unit setVariable ["NORRN_unconscious", false, false];
	_unit setVariable ["USEC_isCardiac",false, false];
	if (_unit == player) then {
		r_player_unconscious = false;
		disableUserInput false;
		r_player_cardiac = false;
		r_player_handler1 = false;
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
};