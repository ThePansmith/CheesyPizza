if global.leveltosave == "snickchallenge"
	activate_snickchallenge();

loading = true;
with (instance_create(x, y, obj_fadeout))
{
	restarttimer = true;
	if (room == tower_finalhallwaytitlecard)
		finalhallway = true;
}

with obj_cyop_assetloader
	wait();
if (group_arr != noone or instance_exists(obj_cyop_assetloader))
{
	with (instance_create(x, y, obj_loadingscreen))
	{
		offload_arr = other.offload_arr;
		group_arr = other.group_arr;
	}
}
