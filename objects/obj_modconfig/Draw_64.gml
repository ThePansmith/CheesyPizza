if live_call() return live_result;

// temp bg
/*
draw_set_colour(merge_colour(c_aqua, c_black, 0.9));
draw_set_alpha(0.75);
draw_rectangle(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT, false);
draw_set_alpha(1);
*/

// options left side
draw_set_colour(c_white);
draw_set_align();

var yy = 40 - ceil(scroll);
for(var i = 0; i < array_length(options_array); i++)
{
	var opt = options_array[i];
	
	switch opt.type
	{
		case 0: // normal
			draw_set_font(global.font_small);
			if sel == i
			{
				draw_set_colour(c_white);
				draw_sprite_ext(spr_cursor, -1, 2 + 40 + xo, 2 + yy + 8 + yo, 1, 1, 0, c_black, 0.25);
				draw_sprite(spr_cursor, -1, 40 + xo, yy + 8 + yo);
			}
			else
				draw_set_colour(c_ltgray);
			
			var drop = sel == i ? 3 : 2;
			
			draw_text_color(drop + 80, drop + yy, opt.name, 0, 0, 0, 0, 0.25);
			draw_text(80, yy, opt.name);
			
			// value
			var valuewd = string_width(opt.opts[opt.value][0]);
			var newwd = min(valuewd, 100);
			
			draw_text_transformed_color(drop + 350, drop + yy, opt.opts[opt.value][0], newwd / valuewd, 1, 0, 0, 0, 0, 0, 0.25);
			draw_text_transformed(350, yy, opt.opts[opt.value][0], newwd / valuewd, 1, 0);
			
			yy += 20;
			break;
		
		case 1: // SECTION
			draw_set_colour(c_white);
			draw_set_font(global.creditsfont);
			
			yy += 30;
			draw_text_color(2 + 60, 2 + yy, options_array[i].name, 0, 0, 0, 0, 0.35);
			draw_text(60, yy, options_array[i].name);
			yy += 40;
			break;
	}
}

// current option
draw_set_colour(c_white);
var opt = options_array[sel];

draw_set_font(global.bigfont);
draw_set_align(fa_center);
draw_set_alpha(alpha);
draw_text_color(3 + 700, 3 + 80, string_upper(opt.name), 0, 0, 0, 0, 0.25);
draw_text(700, 80, string_upper(opt.name));

draw_set_font(global.font_small);
draw_text_ext_color(3 + 700, 3 + (is_callable(opt.drawfunc) ? 420 : 260), opt.desc, 18, 440, 0, 0, 0, 0, 0.25);
draw_text_ext(700, (is_callable(opt.drawfunc) ? 420 : 260), opt.desc, 18, 440);

draw_set_font(global.smallfont);
if opt.value < array_length(opt.opts)
{
	draw_text_color(2 + 700, 2 + 116, opt.opts[opt.value][0], 0, 0, 0, 0, 0.25);
	draw_text(700, 116, opt.opts[opt.value][0]);
}

if is_callable(opt.drawfunc)
{
	// roundrect background
	var xx = 700, wd = 960 / 2.5;
	var yy = 260, ht = 540 / 2.5;
	
	draw_set_alpha(1);
	if !surface_exists(surf)
		surf = surface_create(wd, ht);
	
	surface_set_target(surf);
	draw_clear_alpha(c_black, 0);
	
	opt.drawfunc(opt.value);
	
	draw_set_colour(c_white);
	draw_roundrect(0, 0, wd - 2, ht - 2, true);
	
	surface_reset_target();
	draw_surface_ext(surf, 3 + xx - wd / 2, 3 + yy - ht / 2, 1, 1, 0, 0, 0.25);
	draw_surface(surf, xx - wd / 2, yy - ht / 2);
}
draw_set_alpha(1);
