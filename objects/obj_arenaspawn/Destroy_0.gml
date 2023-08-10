ds_list_destroy(baddielist);
if !in_saveroom()
{
	add_saveroom();
	global.kungfu = false;
}
