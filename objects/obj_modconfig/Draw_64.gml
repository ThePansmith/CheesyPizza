if live_call() return live_result;

// temp bg
draw_set_colour(merge_colour(c_aqua, c_black, 0.9));
draw_set_alpha(0.75);
draw_rectangle(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT, false);
draw_set_alpha(1);

// options left side
draw_set_colour(c_white);
draw_set_align();

var yy = 60;
for(var i = 0; i < array_length(options_array); i++)
{
	var opt = options_array[i];
	
	switch opt.type
	{
		case 0: // normal
			draw_set_font(global.font_small);
			if sel == i
			{
				draw_set_alpha(1);
				draw_sprite(spr_cursor, 4, 40 + xo, yy + 8 + yo);
			}
			else
				draw_set_alpha(0.5);
			draw_text(80, yy, string_upper(opt.name));
			
			// value
			var valuewd = string_width(opt.opts[opt.value][0]);
			var newwd = min(valuewd, 100);
			
			draw_text_transformed(350, yy, opt.opts[opt.value][0], newwd / valuewd, 1, 0);
			
			yy += 20;
			break;
		
		case 1: // SECTION
			draw_set_alpha(1);
			draw_set_font(global.creditsfont);
			
			yy += 30;
			draw_text(60, yy, options_array[i].name);
			yy += 40;
			break;
	}
}

// current option
var opt = options_array[sel];

draw_set_font(global.bigfont);
draw_set_align(fa_center);
draw_set_alpha(alpha);
draw_text(690, 80, string_upper(opt.name));

draw_set_font(global.font_small);
draw_text_ext(690, (is_callable(opt.drawfunc) ? 420 : 260), opt.desc, 16, 440);

draw_set_font(global.smallfont);
if opt.value < array_length(opt.opts)
	draw_text(690, 116, opt.opts[opt.value][0]);

if is_callable(opt.drawfunc)
{
	// roundrect background
	var xx = 690, wd = 960 / 2.5;
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
	draw_surface(surf, xx - wd / 2, yy - ht / 2);
}
draw_set_alpha(1);
