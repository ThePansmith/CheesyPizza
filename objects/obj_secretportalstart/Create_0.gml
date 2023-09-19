active = true;

override_state = noone;
override_sprite = obj_player1.spr_hurt;
override_vars = {};

spr_open = spr_secretportal_spawnopen;
spr_idle = spr_secretportal_spawnidle;
spr_close = spr_secretportal_spawnclose;

death = object_index == obj_deathportalexit;
if death
{
	if !MOD.DeathMode
		instance_destroy();
	image_blend = #D8B8F8;
}

sugary = !global.sugaryoverride or death ? SUGARY : check_sugarychar();
if sugary
{
	spr_open = spr_secretportal_spawnopen_ss;
	spr_idle = spr_secretportal_spawnidle_ss;
	spr_close = spr_secretportal_spawnclose_ss;
	sprite_index = spr_open;
}

if MIDWAY
{
	spr_open = spr_secretportal_spawnopen_bo;
	spr_idle = spr_secretportal_spawnidle_bo;
	spr_close = spr_secretportal_spawnclose_bo;
	sprite_index = spr_open;
}

// If we aren't coming or going from a secret, we don't need to exist.
if death or (!room_is_secret(obj_player1.lastroom) && !room_is_secret(room) && !instance_exists(obj_ghostcollectibles) && !instance_exists(obj_levelLoader))
{
	active = false;
	visible = false;
}

// sugary blending
if sugary
{
	with obj_player1
	{
		image_blend_func = noone;
	}
}

if room != tower_soundtest
	texturegroup_free("soundtestgroup");