condition = function()
{
	return MOD.DeathMode;
}

output = function()
{
	scr_destroy_tiles(32, "Tiles_Foreground1");
}

reverse_output = function()
{
	instance_destroy();
}