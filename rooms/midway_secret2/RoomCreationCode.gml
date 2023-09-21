global.roommessage = "PIZZA TOWER IN SPACE"
if (!obj_secretmanager.init)
{
	obj_secretmanager.init = 1
	secret_add(noone, function()
	{
		secret_open_portal(0)
		exit;
	}
)
	secret_add(noone, function()
	{
		if secret_check_trigger(1)
			secret_open_portal(1)
		exit;
	}
)
	secret_add(noone, function()
	{
		if secret_check_trigger(2)
			secret_open_portal(2)
		exit;
	}
)
}
