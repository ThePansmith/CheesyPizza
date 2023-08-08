function in_saveroom(_id = id, _map = global.saveroom)
{
	var con = ds_list_find_index(_map, _id) != -1;
	if instance_exists(obj_levelLoader)
		con |= safe_get(_id, "IN_SAVEROOM") == true;
	return con;
}
