global.roommessage = "WELCOME TO PIZZA TOWER";
global.gameframe_caption_text = "Mass-produced Pizza Tower";
if (!obj_secretmanager.init)
{
	obj_secretmanager.init = true;
	secret_add(noone, function()
	{
		secret_open_portal(0);
	});
	secret_add(noone, function()
	{
		secret_open_portal(1);
	});
}
