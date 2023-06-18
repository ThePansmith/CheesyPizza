if !global.option_hud or (instance_exists(obj_chat) && !obj_chat.showhud)
	exit;
if fadeout
{
	image_alpha -= 0.1;
	if image_alpha <= 0
		instance_destroy();
}

draw_set_font(global.smallnumber_fnt);
draw_set_halign(1);
var c = negative ? global.smallnumber_color2 : global.smallnumber_color1;
draw_set_color(c);
draw_set_alpha(image_alpha);
if !flash
	draw_text(x, y, number);
draw_set_alpha(1);
