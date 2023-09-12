condition = function()
{
	return MOD.DeathMode;
}

output = function()
{
	scr_destroy_tiles(32, "Tiles_Foreground1");
	instance_destroy(inst_27B2BC8, false);
}

reverse_output = function()
{
	instance_destroy();
}