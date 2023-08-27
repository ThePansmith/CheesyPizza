if in_baddieroom()
	exit;

repeat 3
{
	create_slapstar(x, y);
	create_baddiegibs(x, y);
}
with obj_camera
{
	shake_mag = 3;
	shake_mag_acc = 3 / room_speed;
}
with instance_create(x, y, obj_sausageman_dead)
{
	sprite_index = other.spr_dead;
	spr_palette = other.spr_palette;
	paletteselect = other.paletteselect;
	usepalette = other.usepalette;
	image_alpha = other.image_alpha;
	if variable_instance_exists(other, "sugary")
		sugary = other.sugary;
	image_blend = other.image_blend;
}

if !important
{
	notification_push(notifs.pizzaboy_dead, [room]);
	sound_play_oneshot_3d("event:/sfx/enemies/kill", x, y);
}
