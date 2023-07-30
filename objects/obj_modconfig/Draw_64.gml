if live_call() return live_result;

// options left side
draw_set_colour(c_white);
draw_set_align();

var yy = 70 - ceil(scroll);
for(var i = 0; i < array_length(options_array); i++)
{
	var opt = options_array[i];
	
	switch opt.type
	{
		default:
			draw_set_font(global.font_small);
			if sel == i
			{
				draw_set_colour(c_white);
				draw_sprite_ext(spr_cursor, -1, 2 + 40 + xo, 2 + yy + 8 + yo, 1, 1, 0, c_black, 0.25);
				draw_sprite(spr_cursor, -1, 40 + xo, yy + 8 + yo);
			}
			else
				draw_set_colour(c_ltgray);
			
			draw_text_color(2 + 80, 2 + yy, opt.name, 0, 0, 0, 0, 0.25);
			draw_text(80, yy, opt.name);
			
			// value
			var str = "";
			if opt.type == modconfig.slider
				str = string(floor(opt.value * 100)) + "%";
			if opt.type == modconfig.option
				str = opt.opts[opt.value][0];
			
			if str != ""
			{
				var scale = min(string_width(str), 100) / string_width(str);
				
				draw_text_transformed_color(2 + 350, 2 + yy, str, scale, 1, 0, 0, 0, 0, 0, 0.25);
				draw_text_transformed(350, yy, str, scale, 1, 0);
			}
			
			yy += 20;
			break;
		
		case modconfig.section: // SECTION
			draw_set_colour(c_white);
			draw_set_font(global.creditsfont);
			
			if i != 0
				yy += 30;
			draw_text_color(2 + 60, 2 + yy, options_array[i].name, 0, 0, 0, 0, 0.25);
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
draw_text_color(2 + 700, 2 + 80, string_upper(opt.name), 0, 0, 0, 0, 0.25);
draw_text(700, 80, string_upper(opt.name));

var drawer = 0;
if is_callable(opt.drawfunc)
	drawer = 1;
else if is_array(opt.drawfunc) or sequence_exists(opt.drawfunc)
	drawer = 2;
	
draw_set_font(global.font_small);
draw_text_ext_color(2 + 700, 2 + 420, opt.desc, 18, 440, 0, 0, 0, 0, 0.25);
draw_text_ext(700, 420, opt.desc, 18, 440);

if opt.type == modconfig.option
{
	draw_set_font(global.smallfont);
	if opt.value < array_length(opt.opts)
	{
		draw_text_color(2 + 700, 2 + 116, opt.opts[opt.value][0], 0, 0, 0, 0, 0.25);
		draw_text(700, 116, opt.opts[opt.value][0]);
	}
}
if opt.type == modconfig.slider
{
	draw_sprite_ext(spr_slider, 0, 600, 116, 1, 1, 0, c_white, 1);
	draw_sprite(spr_slidericon2, 0, 600 + 200 * opt.value, 116);
}

if drawer
{
	// roundrect background
	var xx = 700, wd = 384;
	var yy = 260, ht = 216;
	
	draw_set_alpha(1);
		
	// DRAW IT
	if is_callable(opt.drawfunc)
	{
		if !surface_exists(global.modsurf)
			global.modsurf = surface_create(wd, ht);
		
		surface_set_target(global.modsurf);
		draw_clear_alpha(c_black, 0);
		
		if opt.type == modconfig.option
			opt.drawfunc(opt.opts[opt.value][1]);
		else
			opt.drawfunc();
		
		// white border
		draw_set_colour(c_white);
		draw_roundrect(0, 0, wd - 2, ht - 2, true);
			
		surface_reset_target();
	}
	else
	{
		// innovation
		if !layer_exists(sequence_layer)
		{
			sequence_layer = layer_create(-1, "sequence_layer");
			if is_array(opt.drawfunc)
				sequence = layer_sequence_create(sequence_layer, 0, 0, opt.drawfunc[opt.value]);
			else if sequence_exists(opt.drawfunc)
				sequence = layer_sequence_create(sequence_layer, 0, 0, opt.drawfunc);
			
			layer_script_begin(sequence_layer, function()
			{
				if event_type == ev_draw && event_number == ev_draw_normal
				{
					if !surface_exists(global.modsurf)
						global.modsurf = surface_create(384, 216);
					
					surface_set_target(global.modsurf);
					draw_clear_alpha(c_black, 0);
					
					if layer_sequence_get_sequence(obj_modconfig.sequence).name == "seq_secretwall_on"
						gpu_set_blendmode(bm_normal);
					else
					{
						reset_shader_fix();
						reset_blendmode();
					}
				}
			});
			layer_script_end(sequence_layer, function()
			{
				if event_type == ev_draw && event_number == ev_draw_normal
				{
					// white border
					draw_set_colour(c_white);
					draw_roundrect(0, 0, 384 - 2, 216 - 2, true);
					
					surface_reset_target();
					pal_swap_reset();
				}
			});
		}
	}
	
	reset_blendmode();
	reset_shader_fix();
	
	if surface_exists(global.modsurf)
	{
		/* shadow */ draw_surface_ext(global.modsurf, 3 + xx - wd / 2, 3 + yy - ht / 2, 1, 1, 0, 0, 0.25);
		
		shader_set(global.Pal_Shader);
		pal_swap_set(spr_peppalette, 1, false);
		draw_surface(global.modsurf, xx - wd / 2, yy - ht / 2);
	}
}
draw_set_alpha(1);
