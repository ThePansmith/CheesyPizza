if !global.option_hud
	exit;

var xx = x;
var yy = y;
draw_set_color(c_white);
if bo
	draw_sprite(spr_comboendBN, 0, xx, yy);
else if pino
	draw_sprite(spr_comboendPN, 0, xx, yy);
else
	draw_sprite(spr_comboend, 0, xx, yy);

var title = floor(combo / 5);
if title > sprite_get_number(sprite) / 2
{
	title -= sprite_get_number(sprite) / 2;
	very = true;
}
if combo >= 80
	very = true;

if sugary
	draw_sprite(sprite, min(floor(combo / 5), 24), xx, yy + 30);
else
	draw_sprite(sprite, (title * 2) + title_index, xx, yy + 30);

draw_set_font(lang_get_font("smallfont"));
draw_set_halign(1);
draw_set_valign(0);
draw_text(xx, yy + 70, comboscoremax);
if very && !sugary
	draw_sprite(pino ? spr_comboveryPN : spr_combovery, 0, xx - 65, (yy - 6) + 30);
