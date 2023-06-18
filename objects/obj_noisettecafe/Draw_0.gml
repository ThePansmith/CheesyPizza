var _x = x - 23;
var _y = y + 66;

var barOffset = 
{
	X : x - 23,
	Y : y
};

var radieOffset =
{
	X : x + 66,
	Y : y + 25
};

var sunOffset = 
{
	X : x - 60,
	Y : y - 10
};

if (!vengeful)
{
	draw_sprite_ext(spr_pizzasona56, radieFrame, radieOffset.X, radieOffset.Y, -1, 1, 0, c_white, 1);
	draw_sprite(spr_radiebar, 0, barOffset.X, barOffset.Y);
	//draw_sprite(spr_suncoffee, sunFrame, sunOffset.X, sunOffset.Y);
}
else
{
	draw_sprite_ext(spr_pizzasona56throw, radieFrame, radieOffset.X, radieOffset.Y, -1, 1, 0, c_white, 1);
	draw_sprite(spr_radiebar, 0, barOffset.X, barOffset.Y);
	//draw_sprite(spr_sungulp, sunFrame, sunOffset.X, sunOffset.Y);
}
