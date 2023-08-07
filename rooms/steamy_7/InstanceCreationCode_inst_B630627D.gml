condition = function() {
	return global.panic;
}

output = function()
{
	var lay_id = layer_get_id("Assets_1");
	var sprite_id = layer_sprite_get_id(lay_id, "graphic_2805ACFF");
	layer_sprite_change(sprite_id, spr_clocktower_broken);	
}
