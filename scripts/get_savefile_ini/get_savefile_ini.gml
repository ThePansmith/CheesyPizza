function get_savefile_ini()
{
	if instance_exists(obj_levelLoader)
		return $"custom{global.currentsavefile}/" + filename_name(global.custom_path) + ".ini";
	return concat("saveData", global.currentsavefile, ".ini");
}
