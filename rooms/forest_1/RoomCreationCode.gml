global.roommessage = "PIZZA TOWER ISLAND";
global.gameframe_caption_text = "A forest in the Pizza Tower";
if (!obj_secretmanager.init)
{
	obj_secretmanager.init = true;
	secret_add(noone, function()
	{
		if (secret_check_trigger(0))
			secret_open_portal(0);
	});
	secret_add(noone, function()
	{
		if (secret_check_trigger(1))
			secret_open_portal(1);
	});
	secret_add(noone, function()
	{
		secret_open_portal(2);
	});
}
