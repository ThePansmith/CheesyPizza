function anon_gml_RoomCC_molasses_6_13_Create_12_gml_RoomCC_molasses_6_13_Create() //anon_gml_RoomCC_molasses_6_13_Create_12_gml_RoomCC_molasses_6_13_Create
{
    return (!instance_exists(104162));
}

function anon_gml_RoomCC_molasses_6_13_Create_80_gml_RoomCC_molasses_6_13_Create() //anon_gml_RoomCC_molasses_6_13_Create_80_gml_RoomCC_molasses_6_13_Create
{
    with (104138)
    {
        if (!(ds_list_find_index(global.saveroom, id) != -1))
        {
            instance_create(x, y, obj_cloudeffect)
            repeat (3)
                instance_create((x + random_range(-5, 5)), (y + random_range(-5, 5)), obj_cloudeffect)
            instance_destroy()
        }
    }
    with (104139)
    {
        if (!(ds_list_find_index(global.saveroom, id) != -1))
        {
            instance_create(x, y, obj_cloudeffect)
            repeat (3)
                instance_create((x + random_range(-5, 5)), (y + random_range(-5, 5)), obj_cloudeffect)
            instance_destroy()
        }
    }
    with (104208)
    {
        if (!(ds_list_find_index(global.saveroom, id) != -1))
        {
            instance_create(x, y, obj_cloudeffect)
            repeat (3)
                instance_create((x + random_range(-5, 5)), (y + random_range(-5, 5)), obj_cloudeffect)
            instance_destroy()
        }
    }
}

