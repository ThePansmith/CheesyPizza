if (phase == 0)
{
    with (instance_create(x, y, obj_babybounce))
        phase = 1
	sound_play_3d("event:/modded/sfx/babywarning1", x, y);
}
if (phase == 1)
{
    with (instance_create(x, y, obj_babybounce))
        phase = 2
    sound_play_3d("event:/modded/sfx/babywarning2", x, y);
}
if (phase == 2)
{
    event_inherited()
    sound_play("event:/modded/sfx/babyface");
    with (instance_create(x, y, obj_pizzaface))
	{
        spr_idle = spr_babyface;
		sprite_index = spr_idle;
	}
}
