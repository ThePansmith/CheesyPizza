event_inherited();

enum paleditor_states
{
	color_pick,
	
}
state = paleditor_states.color_pick;
prev_vert = false;

selected_row = 0;


palette_entries = 12;

#region Statecode
function color_pick_func(move_ver, move_hor)
{
	if move_ver != prev_vert && move_ver != 0
		selected_row = (selected_row + move_ver) % palette_entries;

	if selected_row < 0
		selected_row = palette_entries - 1;
}
#endregion

#region Render
function draw_numeric_textbox(_x, _y, _text, _value)
{
	draw_text(_x, _y, _text);
}

draw = function(_curve)
{
	
	var spr_height = sprite_get_height(spr_skinchoicepalette);
	var xx = SCREEN_WIDTH / 2;
	var yy = (SCREEN_HEIGHT / 2) - ((palette_entries / 2) * spr_height);
	
	for (var i = 0; i < palette_entries; i++)
	{
		var xxx = xx;
		var yyy = yy + (i * spr_height);
		draw_sprite(spr_skinchoicepalette, 0, xx, yy + (i * spr_height));
	}
	
	draw_sprite(spr_skinchoicehand, 0, xx, yy + (selected_row * spr_height));
	
	draw_set_font(global.smallfont);
	
	draw_numeric_textbox(xx, yy + 64, "text", "value");
	
}
#endregion