function anon_gml_RoomCC_medieval_9_4_Create_19_gml_RoomCC_medieval_9_4_Create() //anon_gml_RoomCC_medieval_9_4_Create_19_gml_RoomCC_medieval_9_4_Create
{
    if place_meeting(x, y, obj_player)
    {
        tv_reset()
        return 1;
    }
    return 0;
}

prompt_array[0] = tv_create_prompt("Wait a minute, is that gold!? Is everything golden!?  Were rich! I'll never have to work another day at this crummy TV station!", (0 << 0), 1052, 3)
prompt_array[1] = tv_create_prompt("Screw you Janice I lied when I said I liked my job, I just didnt want to commit to resigning!! But now it doesnt matter!!", (1 << 0), 487, 3)
