/*

	
	By: j0k3r5 / www.j0k3r5.com
	If modified and released give credits where due, thank you.
	
*/

if (isserver) then {

_vehicle_2389 = objNull;
if (true) then
{
  _this = createVehicle ["Land_Ind_Oil_Tower_EP1", [12159.475, 3160.2092], [], 0, "CAN_COLLIDE"];
  _vehicle_2389 = _this;
  _this setDir -0.11203112;
  _this setPos [12159.475, 3160.2092];
};

_vehicle_2391 = objNull;
if (true) then
{
  _this = createVehicle ["Land_Ind_Oil_Pump_EP1", [12139.4, 3130.4663, -1.6331673e-005], [], 0, "CAN_COLLIDE"];
  _vehicle_2391 = _this;
  _this setPos [12139.4, 3130.4663, -1.6331673e-005];
    _this setVehicleInit "BIS_Effects_Burn = compile preprocessFile '\ca\Data\ParticleEffects\SCRIPTS\destruction\burn.sqf'; nul = [this, 6, time, false, false] spawn BIS_Effects_Burn";
		processInitCommands;
};

_vehicle_2394 = objNull;
if (true) then
{
  _this = createVehicle ["Land_Ind_Oil_Pump_EP1", [12146.923, 3131.0254, -0.011014932], [], 0, "CAN_COLLIDE"];
  _vehicle_2394 = _this;
  _this setDir -1.1248608;
  _this setPos [12146.923, 3131.0254, -0.011014932];
};

_vehicle_2398 = objNull;
if (true) then
{
  _this = createVehicle ["Land_Ind_Oil_Pump_EP1", [12130.675, 3128.6006, -2.8610229e-005], [], 0, "CAN_COLLIDE"];
  _vehicle_2398 = _this;
  _this setPos [12130.675, 3128.6006, -2.8610229e-005];
};

_vehicle_2408 = objNull;
if (true) then
{
  _this = createVehicle ["Land_Ind_Garage01_EP1", [12160.866, 3133.5479, 0.00013518333], [], 0, "CAN_COLLIDE"];
  _vehicle_2408 = _this;
  _this setDir 90.947105;
  _this setPos [12160.866, 3133.5479, 0.00013518333];
};

_vehicle_2411 = objNull;
if (true) then
{
  _this = createVehicle ["Land_Ind_Coltan_Main_EP1", [12194.993, 3154.3379, 5.710125e-005], [], 0, "CAN_COLLIDE"];
  _vehicle_2411 = _this;
  _this setDir 2.7350998;
  _this setPos [12194.993, 3154.3379, 5.710125e-005];
};

_vehicle_2412 = objNull;
if (true) then
{
  _this = createVehicle ["Land_Misc_Cargo1Ao_EP1", [12125.284, 3180.1023, 5.7220459e-006], [], 0, "CAN_COLLIDE"];
  _vehicle_2412 = _this;
  _this setDir 48.244728;
  _this setPos [12125.284, 3180.1023, 5.7220459e-006];
};

_vehicle_2413 = objNull;
if (true) then
{
  _this = createVehicle ["Land_Misc_Cargo1Bo_EP1", [12117.319, 3174.2178, 1.3709068e-005], [], 0, "CAN_COLLIDE"];
  _vehicle_2413 = _this;
  _this setDir -11.064547;
  _this setPos [12117.319, 3174.2178, 1.3709068e-005];
};

_vehicle_2414 = objNull;
if (true) then
{
  _this = createVehicle ["Land_Misc_CargoMarket1a_EP1", [12127.131, 3171.4226, 3.8504601e-005], [], 0, "CAN_COLLIDE"];
  _vehicle_2414 = _this;
  _this setDir -88.434021;
  _this setPos [12127.131, 3171.4226, 3.8504601e-005];
};

_vehicle_2417 = objNull;
if (true) then
{
  _this = createVehicle ["Land_Ind_Coltan_Hopper_EP1", [12216.442, 3164.5024, 0.0001565218], [], 0, "CAN_COLLIDE"];
  _vehicle_2417 = _this;
  _this setDir 179.52209;
  _this setPos [12216.442, 3164.5024, 0.0001565218];
};

_vehicle_2419 = objNull;
if (true) then
{
  _this = createVehicle ["Land_Ind_Coltan_Conv1_end_EP1", [12208.322, 3153.8938, -1.5735626e-005], [], 0, "CAN_COLLIDE"];
  _vehicle_2419 = _this;
  _this setDir 91.145279;
  _this setPos [12208.322, 3153.8938, -1.5735626e-005];
};

};
