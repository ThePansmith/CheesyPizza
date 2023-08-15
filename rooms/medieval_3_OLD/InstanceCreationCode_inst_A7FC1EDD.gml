function anon_gml_RoomCC_medieval_3_5_Create_19_gml_RoomCC_medieval_3_5_Create() //anon_gml_RoomCC_medieval_3_5_Create_19_gml_RoomCC_medieval_3_5_Create
{
    with (obj_player)
    {
        if (state == (33 << 0) || state == (27 << 0) || state == (34 << 0))
            return 1;
    }
    return 0;
}

prompt_array[0] = tv_create_prompt("Wow! It seems that thunder has turned a seemingly-unknown-as-of-now fat man into a valiant and more easily identifiable knight!", (0 << 0), 589, 3)
prompt_array[1] = tv_create_prompt("What mighty stead will he ride? What epic quest will he accomplish?", (1 << 0), 1052, 3)
prompt_array[2] = tv_create_prompt("Maybe he will just slam into a wall and become incredibly boring again?", (1 << 0), 487, 3)
