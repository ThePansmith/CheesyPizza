global.roommessage = string_upper(global.roommessage);
if room != rank_room && room != timesuproom && room != Mainmenu && room != Realtitlescreen && room != Longintro && room != Creditsroom && room != Johnresurrectionroom && room != Endingroom && room != Finalintro && room != Scootertransition
{
	showtext = true;
	alarm[0] = 200;
}
level = false;

var r = string_letters(room_get_name(room));
if room != tower_soundtest && room != Mainmenu && r != "towertutorial" && r != "towerup" && (string_copy(r, 1, 5) == "tower" || (string_starts_with(r, "streethouse") && REMIX)) && !global.panic && !is_bossroom()
{
	if string_starts_with(r, "streethouse")
		level = true;
	visible = true;
}
else if global.roomnames && ds_list_find_index(seen_rooms, room) < 0
{
	level = true;
	ds_list_add(seen_rooms, room);
	
	if global.roommessage == msg
		visible = false;
	else
		visible = true;
}
else
{
	visible = false;
	yi = -50;
	showtext = false;
}
msg = global.roommessage;
