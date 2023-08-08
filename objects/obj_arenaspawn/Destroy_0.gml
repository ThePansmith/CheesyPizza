ds_list_destroy(baddielist);
if (!in_saveroom())
{
	ds_list_add(global.saveroom, id);
	global.kungfu = false;
}
