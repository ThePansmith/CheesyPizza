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
    with (obj_geyserCutscene)
    {
        sprite_index = spr_geysercutscene_active
        image_index = 0
    }
}

