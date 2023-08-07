flags.do_once_per_save = 1
condition = function()
{
    var _check = 0
    with (obj_player)
    {
        if place_meeting(roomstartx, roomstarty, other)
            _check = 1
    }
    return _check;
}

output = function()
{
    for (var i = 0; i < (sprite_get_number(spr_clocktowerexteriorDebris) - 1); i++)
    {
        with (instance_create(((x + irandom_range(-3, 3)) + (sprite_width / 2)), ((y + irandom_range(-3, 3)) + (sprite_height / 2)), obj_debris))
        {
            hsp += irandom_range(-5, -9)
            sprite_index = spr_clocktowerexteriorDebris
            image_index = i
        }
    }
    repeat (3)
    {
        with (instance_create(((x + irandom_range(-3, 3)) + (sprite_width / 2)), ((y + irandom_range(-3, 3)) + (sprite_height / 2)), obj_debris))
        {
            hsp += irandom_range(-5, -9)
            sprite_index = spr_clocktowerexteriorDebris
            image_index = irandom_range(0, (sprite_get_number(spr_clocktowerexteriorDebris) - 1))
        }
    }
    with obj_camera
	{
		shake_mag = 20;
		shake_mag_acc = 40 / room_speed;
	}
    sound_play_centered(sfx_breakmetal);
}

