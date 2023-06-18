depth = 100;
palettes = [["classic", 1, 1], ["unfunny", 1, 3], ["money", 1, 4], ["sage", 1, 5], ["blood", 1, 6], ["tv", 1, 7], ["dark", 1, 8], ["shitty", 1, 9], ["golden", 1, 10], ["garish", 1, 11], ["mooney", 1, 15], ["funny", 1, 12, spr_peppattern1], ["itchy", 1, 12, spr_peppattern2], ["pizza", 1, 12, spr_peppattern3], ["stripes", 1, 12, spr_peppattern4], ["goldemanne", 1, 12, spr_peppattern5], ["bones", 1, 12, spr_peppattern6], ["pp", 1, 12, spr_peppattern7], ["war", 1, 12, spr_peppattern8], ["john", 1, 12, spr_peppattern9]]
palettes_noise = [["nclassic", 1, 0], ["nred", 1, 1], ["nunfunny", 1, 3], ["nmoney", 1, 4], ["nsage", 1, 5], ["nblood", 1, 6]]
instance_change(obj_dresser, true);
exit;

ini_open_from_string(obj_savesystem.ini_str_options);
for (var i = 1; i < array_length(palettes); i++)
{
	if (ini_read_real("Palettes", palettes[i][0], false))
		palettes[i][1] = true;
}
ini_close();
scr_create_uparrowhitbox();
paletteselect = 0;
with (obj_player1)
{
	if (paletteselect > 2)
	{
		for (i = 0; i < array_length(other.palettes); i++)
		{
			var pal = other.palettes[i][2];
			if (pal == paletteselect && (pal != 12 || other.palettes[i][3] == global.palettetexture))
			{
				other.paletteselect = i;
				break;
			}
		}
	}
}
showtext = false;
alpha = 0;
palettetitle = lang_get_value(concat("dresser_", palettes[paletteselect][0], "title"));
palettedesc = lang_get_value_newline(concat("dresser_", palettes[paletteselect][0]));
