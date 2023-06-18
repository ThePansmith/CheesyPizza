state = states.titlescreen;
vsp = 0;
depth = 0;

spr_fall = spr_lonegustavo_groundpound;
spr_idle = spr_gustavo_exitsign;

if string_letters(room_get_name(room)) == "freezer"
{
	spr_idle = spr_gustavo_exitsignfreezer;
	spr_fall = spr_gustavo_exitsignfreezer;
}
else if room == saloon_5 || room == saloon_4 || room == saloon_3 || room == saloon_2 || room == saloon_1
	spr_idle = spr_gustavo_exitsigndrunk;
else if string_letters(room_get_name(room)) == "chateau"
{
	spr_idle = spr_gustavorat_exitsign;
	spr_fall = spr_gustavorat_fall;
}
else
	spr_idle = spr_gustavo_exitsign;
if room == space_11b
	spr_fall = spr_gustavo_exitshuttle;
