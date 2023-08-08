if (!in_saveroom())
{
	with (instance_create(x, y - 50, obj_parryeffect))
		sprite_index = spr_peppinoteleporteffect;
	sound_play_oneshot_3d("event:/sfx/misc/teleporterstart", x, y);
	ds_list_add(global.saveroom, id);
}
