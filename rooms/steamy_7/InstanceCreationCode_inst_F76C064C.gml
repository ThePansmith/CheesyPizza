condition = function()
{
    return ds_list_find_index(global.saveroom, inst_89780F4B) != -1;
}

output = function()
{
    var lay_id = layer_get_id("Assets_1")
    var sprite_id = layer_sprite_get_id(lay_id, "graphic_601E5554")
    layer_sprite_destroy(sprite_id)
}
