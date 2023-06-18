draw_set_font(global.font_small);
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_set_color(c_white)
draw_set_alpha(alpha)
    
var yy = clamp(sprite_get_bbox_top(player.sprite_index) + player.y - 100, 0, room_height - 16);
draw_text(player.x, yy, msg);