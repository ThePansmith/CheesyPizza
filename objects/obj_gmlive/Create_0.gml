// only include the extension if we're running from the IDE
#macro live_enabled false//(GM_build_type == "run" && !YYC)
if !live_enabled
{
	instance_destroy();
	exit;
}

// safeguard against making multiple obj_gmlive instances
if (instance_number(obj_gmlive) > 1) {
	var first = instance_find(obj_gmlive, 0);
	if (id != first) { instance_destroy(); exit; }
}
if asset_get_index("live_init") == -1
	show_error("live_init is missing!\nEither GMLive is not imported in the project, or the 'GMLive' script got corrupted (try re-importing)\nIf you don't have GMLive, you can safely remove obj_gmlive and any remaining live_* function calls.\n\n", 1);

// change the IP/port here if gmlive-server isn't running on the same device as the game
// (e.g. when running on mobile platforms):
live_init(1, "http://localhost:5100", "");

live_blank_object = obj_blank;
live_blank_room = rm_blank;
live_room_updated = scr_room_updated;
live_rooms = false;

#region CONSTANTS (BECAUSE GMLIVE SUCKS)

// File Attribute Constant
live_constant_add("fa_none", fa_none);
live_constant_add("fa_readonly", fa_readonly);
live_constant_add("fa_hidden", fa_hidden);
live_constant_add("fa_sysfile", fa_sysfile);
live_constant_add("fa_volumeid", fa_volumeid);
live_constant_add("fa_directory", fa_directory);
live_constant_add("fa_archive", fa_archive);

#endregion
