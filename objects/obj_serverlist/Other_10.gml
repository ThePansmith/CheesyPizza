/// @description after connecting
with instance_create(0, 0, obj_genericfade)
{
	persistent = true;
	fade = 2;
	deccel = 0.1;
}
room_goto(Mainmenu);
