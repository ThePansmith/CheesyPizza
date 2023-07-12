flags.do_save = 0
function anon_gml_RoomCC_steamy_7_8_Create_36_gml_RoomCC_steamy_7_8_Create() //anon_gml_RoomCC_steamy_7_8_Create_36_gml_RoomCC_steamy_7_8_Create
{
    var _check = 0
    with (obj_player)
    {
        if place_meeting(roomstartx, roomstarty, other)
            _check = 1
    }
    return _check;
}

function anon_gml_RoomCC_steamy_7_8_Create_206_gml_RoomCC_steamy_7_8_Create() //anon_gml_RoomCC_steamy_7_8_Create_206_gml_RoomCC_steamy_7_8_Create
{
    obj_camera.chargecamera = 0
    obj_player.movespeed = 5
    event_perform_object(obj_puddle, ev_other, ev_user0)
}

