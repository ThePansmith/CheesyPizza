idlespr = spr_pizzasona1;
throwspr = spr_pizzasona1throw;
transitionspr = spr_pizzasona1trans;
paletteselect = 0;
spr_palette = noone;
collectID = -4;
onebyoneID = -4;
index = 0;
showtext = false;
state = states.normal;
image_speed = 0.35;
depth = 0;
sparkleindex = 0;
sparkleactive = false;

var r = -1;
while (r == -1 || r == 8) // pizzasona8 seems to be removed, what happened to it?
	r = irandom_range(1, 57);

if ((r == 56 || r == 57) && (irandom_range(1, 1024) == r))
{
	spr_palette = asset_get_index($"spr_pizzasona_{r}palette");
	paletteselect = 1;
}

idlespr = asset_get_index(concat("spr_pizzasona", r));
throwspr = asset_get_index(concat("spr_pizzasona", r, "throw"));
transitionspr = asset_get_index(concat("spr_pizzasona", r, "trans"));
