//Created by [CPC] ToejaM - www.CPC-Gaming.eu
Waituntil{!isNull player};

while{true} do {
sleep 1;
if((isPlayer cursorTarget) && (alive cursorTarget) && (side cursorTarget == side player) && (player distance cursorTarget < 15)) then {
_tag = name cursorTarget;
cutText [_tag,"PLAIN",0.1];

} else {
};
};