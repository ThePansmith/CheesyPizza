collectiblelist = ds_list_create();
depth = 20;

if instance_exists(obj_levelLoader)
	exit;
if !instance_exists(obj_secretportal)
	exit;
with (instance_nearest(obj_secretportal.x, obj_secretportal.y, obj_bigcollect))
{
	visible = false;
	value = 150;
	with (instance_create(x, y - 42, obj_pizzasonacollect))
		collectID = other.id;
}
