function create_baddiegibs(_x, _y)
{
	var q = 
	{
		x: _x,
		y: _y,
		sprite_index: spr_baddiegibs,
		image_number: sprite_get_number(spr_baddiegibs),
		image_index: irandom(image_number),
		image_angle: random_range(1, 270),
		image_speed: 0,
		sprw: sprite_get_width(spr_baddiegibs),
		sprh: sprite_get_height(spr_baddiegibs),
		hsp: random_range(-10, 10),
		vsp: random_range(-10, 10),
		alpha: 1,
		grav: 0.4,
		type: part_type.normal,
		animated: false,
		destroyonanimation: false
	};
	ds_list_add(global.debris_list, q);
	return q;
}
function create_slapstar(_x, _y)
{
	var q = 
	{
		x: _x,
		y: _y,
		sprite_index: spr_slapstar,
		image_number: sprite_get_number(spr_slapstar),
		image_index: irandom(image_number),
		image_angle: random_range(0, 360),
		image_speed: 0,
		sprw: sprite_get_width(spr_slapstar),
		sprh: sprite_get_height(spr_slapstar),
		hsp: random_range(-5, 5),
		vsp: random_range(-2, -10),
		alpha: 1,
		grav: 0.5,
		type: part_type.normal,
		animated: false,
		destroyonanimation: false
	};
	ds_list_add(global.debris_list, q);
	return q;
}
