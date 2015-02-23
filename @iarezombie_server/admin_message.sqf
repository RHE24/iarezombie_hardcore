_admin_messages = [
	["The fasted way to contact an admin is to join our teamspeak and ask for help.],
	["Join up on our website and take part in the discussions],
	["Dont be a victim, Shoot First and SURVIVE!"],
	["The server restarts every 6 hours"]
];


	while {true} do{
		_msg = _admin_messages select (random (count _admin_messages - 1));
		
		publicvariable "admin_message";
		sleep 60;
		};