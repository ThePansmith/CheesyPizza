function open_menu()
{
	global.in_menu = true;
	with obj_persistent
		alarm[3] = -1;
}
function close_menu()
{
	with obj_persistent
		alarm[3] = 1;
}
