private "_name";
	
	_closestTown = nearestLocations [getPos player, ["NameCityCapital","NameCity","NameVillage","NameLocal"],750];
        _town_name = "Wilderness";
        if (count _closestTown > 0) then {
			_town_name = text (_closestTown select 0)
			};
           
	_Survivors = playersNumber west;
	_bloodpct = floor((r_player_blood / 12000) * 100);
	_tL = (((21600 - time) / 60)-2);// 5 hours subtract the 2 minutes it took to restart last time .. 
    _tL = round(_tL);
	if (_tL < 30) then { _tL = "Just a few";};
	_kills = 		player getVariable["zombieKills",0];
	_killsH = 		player getVariable["humanKills",0];
	_killsB = 		player getVariable["banditKills",0];
	_humanity =		player getVariable["humanity",0];

		
hintSilent parseText format ["
	<img size='3' image='dayz_code\gui\debugmonitor.paa' align='center'/><br/>

	<t size='1.00' font='Bitstream'align='center' color='#DAA520'>Survived %2 DayZ</t><br/>
	<t size='0.95'font='Bitstream'align='left'>Nearest City:</t><t size='0.95'font='Bitstream'align='right'>%11</t><br/>
	<t size='0.95' font='Bitstream' align='left' color='#FFFFFF'>Players killed</t><t size='0.95' font='Bitstream' align='right'>%4</t><br/>
		<t size='0.95' font='Bitstream' align='left' color='#FFFFFF'>Bandits killed</t><t size='0.95' font='Bitstream' align='right'>%5</t><br/>

	<t size='0.95' font='Bitstream' align='left' color='#FFFFFF'>Zombies Killed: </t><t size='0.95' font='Bitstream' align='right'>%6</t><br/>
	<t size='0.95' font='Bitstream' align='left' color='#FFFFFF'>Humanity: </t><t size='0.95' font='Bitstream' align='right'>%7</t><br/>
    <t size='0.95' font='Bitstream' align='left' color='#DF0101'>Blood: </t><t size='0.95' font='Bitstream' align='right'>%8 pct</t><br/>
	<t size='0.95' font='Bitstream' align='left' color='#FFFFFF'>Players Online:%3</t><t size='0.95' font='Bitstream' align='right'>FPS:%9</t><br/>
	<t size='0.95' font='Bitstream'align='center' color='#DAA520'>Restart in %10 Minutes</t><br/>
	<t size='0.95' font='Bitstream' align='left' color='#FFFFFF'>HOME Help</t><t size='0.95' font='Bitstream' align='right'>INS Stats</t><br/>",
	
	
	
	dayz_playerName,
	(dayz_Survived),
	_survivors,
	_killsH,
	_killsB,
	_kills,
	round _humanity,
	_bloodpct,
	(round diag_fps),
	_tL,
	_town_name
	];
sleep 5;

/*
player createDiarySubject ["MyDiary","My Diary"];
player createDiaryRecord ["MyDiary",["Stats", "Zombies Killed: <execute expression='player getVariable['zombieKills', 0]'</execute>"]];
player createDiaryRecord ["MyDiary",["Stats", "Headshots: <execute expression='player getVariable['headShots', 0]'</execute>"]];
player createDiaryRecord ["MyDiary",["Stats", "Murders: <execute expression='player getVariable['humanKills', 0]'</execute>"]];
player createDiaryRecord ["MyDiary",["Stats", "Bandits Killed: <execute expression='player getVariable['banditKills', 0]'</execute>"]];
player createDiaryRecord ["MyDiary",["Stats", "Humanity: <execute expression='player getVariable['humanity', 0]'</execute>"]];
*/
