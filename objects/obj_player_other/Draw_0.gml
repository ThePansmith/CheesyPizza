if !Online exit;
if room == Mainmenu or room == rank_room or room != data.room exit;

// Drawing Name
draw_set_colour(make_colour_hsv(color_get_hue(namecolor), color_get_saturation(namecolor), color_get_value(namecolor) * (color_get_value(image_blend) / 255)));
draw_set_font(global.font_small);
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_set_alpha(image_blend);
    
var yy = clamp(sprite_get_bbox_top(sprite_index) + y - 75, 0, room_height - 16);
draw_text(x, yy, data.name);

draw_set_alpha(1);
draw_set_halign(fa_left);
draw_set_colour(c_white);
