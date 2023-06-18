ds_map_destroy(player_hurtstates);
ds_map_destroy(boss_hurtstates);
ds_map_destroy(boss_unparryablestates);
create_slapstar(x, y);
create_slapstar(x, y);
create_slapstar(x, y);
create_baddiegibs(x, y);
create_baddiegibs(x, y);
create_baddiegibs(x, y);
instance_create(x, y, obj_bangeffect);
with (obj_camera)
{
	shake_mag = 3;
	shake_mag_acc = 3 / room_speed;
}
with (instance_create(x, y, obj_sausageman_dead))
	sprite_index = other.spr_dead;
