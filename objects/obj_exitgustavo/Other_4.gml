/// @description switch characters
var stick = false, sugary = check_sugary();
if global.leveltosave == "forest" || global.leveltosave == "street"
	stick = true;
else if irandom(100) <= 15
	stick = true;

var r = string_letters(room_get_name(room));
if sprite_index != spr_gustavo_exitsign || r == "saloon" || room == space_11b || r == "freezer" || r == "chateau"
	stick = false;

if check_char("G") && !sugary
	stick = true;
if stick
{
	if sugary
	{
		// sugary polka
		spr_fall = spr_polka_fall;
		spr_idle = spr_polka_exit;
	}
	else
	{
		// mr stick
		ystart -= 6;
		spr_fall = spr_stick_fall;
		spr_idle = spr_stick_exit;
	}
}
else if sugary
{
	// sugary rosette
	spr_fall = spr_rosette_fall;
	spr_idle = spr_rosette_exit;
}
