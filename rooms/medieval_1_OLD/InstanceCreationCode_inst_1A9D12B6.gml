function anon_gml_RoomCC_medieval_1_5_Create_19_gml_RoomCC_medieval_1_5_Create() //anon_gml_RoomCC_medieval_1_5_Create_19_gml_RoomCC_medieval_1_5_Create
{
    with (obj_player)
    {
        if (((sprite_index == spr_Timesup && floor(image_index) == (image_number - 2)) || state == (0 << 0)) && place_meeting(x, y, obj_exitgate))
            return 1;
    }
    return 0;
}

prompt_array[0] = tv_create_prompt("PTV seems to have catched on camera a glimpse of strange magical cult wearing robes or bathrobes, we cannot tell which but it seems frankly irrelevant.", (0 << 0), 1052, 3)
