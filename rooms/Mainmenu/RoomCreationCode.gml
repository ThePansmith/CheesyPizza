instance_destroy(obj_pigtotal);
global.gameframe_caption_text = "Select your Pizza Tower";
with (instance_create(0, 0, obj_loadingscreen))
{
	group_arr = ["menugroup"];
	offload_arr = ["introgroup"];
}
with (obj_player)
	state = states.titlescreen;
global.leveltorestart = noone;
global.leveltosave = noone;
global.startgate = false;
global.exitrank = false;
