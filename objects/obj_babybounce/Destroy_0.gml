if (phase == 0)
{
    with (instance_create(x, y, obj_babybounce))
        phase = 1
	fmod_event_one_shot_3d("event:/modded/sfx/babywarning1", x, y);
}
if (phase == 1)
{
    with (instance_create(x, y, obj_babybounce))
        phase = 2
    fmod_event_one_shot_3d("event:/modded/sfx/babywarning2", x, y);
}
if (phase == 2)
{
    event_inherited()
    fmod_event_one_shot("event:/modded/sfx/babyface");
    with (instance_create(x, y, obj_pizzaface))
        sprite_index = spr_babyface
}
