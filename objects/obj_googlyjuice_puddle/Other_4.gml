if collision_line(x, y, x, y + 32, obj_solid, false, false)
{
	while !check_solid(x, y + 1)
		y++;
	
	sprite_index = spr_juicepuddledone;
	grounded = true;
}
if ds_list_find_index(global.saveroom, id) != -1
	instance_destroy(id, false);
