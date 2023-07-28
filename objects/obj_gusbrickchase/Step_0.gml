image_speed = 0.35;
hsp = image_xscale * 10;
if ((x + hsp) > room_width || (x + hsp) < 0 || (check_solid(x + sign(hsp), y) && !check_slope(x + sign(hsp), y)))
	image_xscale *= -1;
mask_index = spr_player_mask;
var _index = floor(image_index) == (image_number - 1);
if (sprite_index == spr_brickchase)
	_index = floor(image_index) == 7;
if (_index && !steppy)
{
	steppy = true;
	create_particle(x, y + 43, particle.cloudeffect);
}
else if (!_index)
	steppy = false;
scr_collide();
if (sprite_index == spr_brickchase)
{
	if (!fmod_event_instance_is_playing(sniffsnd))
		fmod_event_instance_play(sniffsnd);
	sound_instance_move(sniffsnd, x, y);
}
if (sprite_index == spr_gustavochase && !instance_exists(obj_titlecard) && !instance_exists(obj_titlecard_ss) && !instance_exists(obj_fadeout))
{
	if (!fmod_event_instance_is_playing(snd))
		fmod_event_instance_play(snd);
	sound_instance_move(snd, x, y);
}
else
	fmod_event_instance_stop(snd, true);
