// init
objects = cyop_objectlist();
_room = noone;
room_name = "";
room_ind = -1;

tile_layers = [];
tiles = [];

loaded = false;
event_user(0);
if !loaded
	instance_destroy();
