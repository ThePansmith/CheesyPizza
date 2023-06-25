if instance_exists(obj_parallax)
{
	if global.panic && room != custom_lvl_room
	{
	    // panic backgrounds
	    var l = layer_get_all();
	    for (var i = 0; i < array_length(l); i++;)
	    {
	        var layers_e = layer_get_all_elements(l[i]);
	        for (var j = 0; j < array_length(layers_e); j++)
	        {
	            // backgrounds
	            if layer_get_element_type(layers_e[j]) == layerelementtype_background
	            {
	                var bgspr = asset_get_index(sprite_get_name(layer_background_get_sprite(layers_e[j])) + "escape");
	                if sprite_exists(bgspr)
	                {            sprite_set_speed(bgspr, 1, spritespeed_framespergameframe);
	                    layer_background_change(layers_e[j], bgspr);
	                    layer_background_speed(layers_e[j], 0.25);
	                }
	            }
	            break;
	        }
	    }
	}
}