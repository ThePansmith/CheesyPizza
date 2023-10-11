global.roommessage = "PIZZA TOWER AT THE FARM!";
global.gameframe_caption_text = "Why did the chicken cross the Pizza Tower?";

if (!obj_secretmanager.init)
{
	obj_secretmanager.init = true;
	secret_add(noone, function()
	{
		secret_open_portal(0);
	});
	secret_add(noone, function()
	{
		if (secret_check_trigger(1))
			secret_open_portal(1);
	});
}
