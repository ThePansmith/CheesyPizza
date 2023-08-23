//live_auto_call;

// prep
depth = -600;
image_speed = 0.35;
scr_init_input();
stickpressed = false;
con = 0;
t = 0;
buffer = 0;
sequence_layer = -1;

enum modconfig
{
	option,
	section,
	button,
	modifier,
	slider
}

options_array = [];
function add_option(name, variable, desc = "", drawfunc = noone)
{
	var struct = {
		type: modconfig.option,
		value: 0,
		vari: variable,
		name: name,
		desc: desc,
		opts: [["OFF", false], ["ON", true]],
		drawfunc: drawfunc
	}
	array_push(options_array, struct);
	return struct;
}
function add_button(name, desc = "", func = noone, drawfunc = noone)
{
	var struct = {
		type: modconfig.button,
		name: name,
		desc: desc,
		func: func,
		drawfunc: drawfunc
	}
	array_push(options_array, struct);
	return struct;
}
function add_slider(name, variable, range = [0, 1], desc = "", drawfunc = noone)
{
	var struct = {
		type: modconfig.slider,
		value: 0,
		vari: variable,
		name: name,
		desc: desc,
		range: range,
		drawfunc: drawfunc
	}
	array_push(options_array, struct);
	return struct;
}
function add_section(name)
{
	var struct = {
		type: modconfig.section,
		name: name
	};
	array_push(options_array, struct);
	return struct;
}
sel = 1;
global.modsurf = noone;

// simuplayer
reset_simuplayer = function()
{
	simuplayer = {
		x: 960 / 2.5 / 2, y: 540 / 2.5 / 1.5, state: states.normal, hsp: 0, vsp: 0, sprite: spr_player_idle, image: 0, xscale: 1, timer: 0, move: 0, changed: false, angle: 0
	}
}
function draw_simuplayer()
{
	var p = simuplayer;
	
	shader_set(shd_pal_swapper);
	pal_swap_set(spr_peppalette, 1, 0);
	
	var width = 960 / 2.5;
	
	var xo = p.x - lengthdir_x(28, p.angle - 90);
	var yo = p.y;
	
	if xo < 50
		draw_sprite_ext(p.sprite, p.image, xo + width, yo, p.xscale, 1, p.angle, c_white, 1);
	if xo > width - 50
		draw_sprite_ext(p.sprite, p.image, xo - width, yo, p.xscale, 1, p.angle, c_white, 1);
	
	draw_sprite_ext(p.sprite, p.image, xo, yo, p.xscale, 1, p.angle, c_white, 1);
	shader_reset();
}
reset_simuplayer();

// options
add_section("Gameplay");

#region REMIX

color1 = shader_get_uniform(shd_mach3effect, "color1");
color2 = shader_get_uniform(shd_mach3effect, "color2");
var opt = add_option("Remix", "gameplay", "Adds extra quality of life improvements to a bunch of stuff.", function(val)
{
	draw_sprite_ext(val == 1 ? spr_tv_bgfinal_NEW : spr_tv_bgfinal, 1, 110, 70, 1, 1, 0, c_white, 1);
	
	shader_set(shd_pal_swapper);
	pal_swap_set(spr_peppalette, 1, 0);
	draw_sprite_ext(spr_tv_idle, 0, 110, 70, 1, 1, 0, c_white, 1);
	shader_reset();
	
	if val == 1
	{
		shader_set(shd_mach3effect);
		gpu_set_blendmode(bm_normal);
		
		var b = global.mach_color1;
		shader_set_uniform_f(color1, color_get_red(b) / 255, color_get_green(b) / 255, color_get_blue(b) / 255);
		b = merge_colour(b, c_black, 0.9);
		shader_set_uniform_f(color2, color_get_red(b) / 255, color_get_green(b) / 255, color_get_blue(b) / 255);
		
		draw_sprite(spr_player_mach, 0, 240, 150);
		draw_sprite(spr_player_mach, 2, 340, 150);
		
		b = global.mach_color2;
		shader_set_uniform_f(color1, color_get_red(b) / 255, color_get_green(b) / 255, color_get_blue(b) / 255);
		b = merge_colour(b, c_black, 0.9);
		shader_set_uniform_f(color2, color_get_red(b) / 255, color_get_green(b) / 255, color_get_blue(b) / 255);
		
		draw_sprite(spr_player_mach, 1, 290, 150);
		shader_reset();
	}
	else
	{
		var mach_color1 = make_colour_rgb(96, 208, 72);
		var mach_color2 = make_colour_rgb(248, 0, 0);
		
		draw_sprite_ext(spr_player_mach, 0, 240, 150, 1, 1, 0, mach_color1, 1);
		draw_sprite_ext(spr_player_mach, 2, 340, 150, 1, 1, 0, mach_color1, 1);
		draw_sprite_ext(spr_player_mach, 1, 290, 150, 1, 1, 0, mach_color2, 1);
	}
});

#endregion

add_option("Experimental", "experimental", "Allows access to fun console commands and other WIP stuff. Please do not report bugs from these!");

#region ATTACK STYLE

var opt = add_option("Attack Style", "attackstyle", "Alternatives to the basic grab move. The original grab is moved to the CHAINSAW button.", [seq_attackstyle_grab, seq_attackstyle_kungfu, seq_attackstyle_shoulderbash, seq_template]);
opt.opts = [
	["GRAB", 0],
	["KUNG FU", 1],
	["SHOULDER BASH", 2]
];

#endregion
#region SHOOT STYLE

var opt = add_option("Shoot Style", "shootstyle", "Extra attacks bound to the SHOOT button. Change it in the key config.", function(val)
{
	var p = simuplayer;
	
	if p.state == states.titlescreen
	{
		p.xscale = 1;
		p.state = states.normal;
		p.sprite = spr_player_idle;
		p.move = 0;
		p.hsp = 0;
		bullets = 3;
		p.timer = 0;
	}
	else if p.x != 100 && p.state != states.punch
		p.x = Approach(p.x, 100, 10);
	else
	{
		if p.changed
		{
			p.changed = false;
			p.state = states.titlescreen;
		}
		
		p.timer++;
		if p.timer > 20
		{
			p.timer = 0;
			if val == 1 && floor(bullets) > 0 && frac(bullets) == 0
			{
				sound_play_centered_oneshot(sfx_pistolshot);
				p.state = states.pistol;
				p.sprite = spr_player_pistolshot;
				p.image = 0;
				bullets--;
			}
			if val == 2
			{
				p.hsp = p.xscale * 6;
				p.timer = -50;
				sound_play_centered_oneshot(sfx_breakdance);
				p.state = states.punch;
				p.sprite = spr_player_breakdancestart;
				p.image = 0;
			}
		}
		
		if val == 1 && p.state != states.pistol
		{
			if bullets == 0
				p.timer = -80;
			bullets = Approach(bullets, 3, 0.05);
		}
	}
	
	draw_simuplayer();
	
	if val == 1
	{
		for(var i = 0; i < floor(bullets); i++)
			draw_sprite(spr_peppinobullet_collectible, -1, 136 - 46 * i, -32);
	}
});
opt.opts = [
	["NONE", 0],
	["PISTOL", 1],
	["BREAKDANCE", 2]
];

#endregion
#region DOUBLE GRAB

var opt = add_option("Grab Special", "doublegrab", "Press the GRAB button twice to attack with the chosen move.", function(val)
{
	var p = simuplayer;
	
	if p.sprite == spr_player_breakdanceuppercut && p.state == states.titlescreen
	{
		p.state = states.panicjump;
		p.move = 0;
		p.timer = -100;
	}
	else if p.changed
	{
		bullets = 3;
		if p.state == states.titlescreen
			p.state = states.normal;
		if p.state == states.normal
		{
			if p.x > 75 && p.x + p.hsp > 75
				p.move = -1;
			else if p.x <= 75 && p.x + p.hsp <= 75
				p.move = 1;
			else
			{
				p.x = 75;
				p.hsp = 0;
				p.move = 0;
				p.xscale = 1;
				p.timer = 10;
				p.changed = false;
			}
		}
	}
	else
	{
		if p.state == states.titlescreen
		{
			p.state = states.normal;
			p.sprite = spr_player_idle;
			p.x = 75;
			p.xscale = 1;
		}
		
		p.timer++;
		if p.timer >= 30 && val != 0 && (val != 3 or floor(bullets) > 0)
		{
			if p.state == states.handstandjump
			{
				p.timer = -30;
				if val == 1
				{
					sound_play_centered_oneshot(sfx_dive);
					p.sprite = spr_player_attackdash;
					p.image = 0;
				}
				if val == 2
				{
					p.sprite = spr_player_faceplant;
					p.state = states.faceplant;
					p.hsp = 8;
					p.image = 0;
				}
				if val == 3
				{
					p.sprite = spr_player_chainsawdash;
					p.state = states.chainsawbump;
					p.hsp = 11;
					p.image = 0;
					bullets--;
				}
			}
			else
			{
				p.timer = 10;
				//sound_play_centered_oneshot(sfx_suplexdash);
				
				p.state = states.handstandjump;
				p.sprite = spr_player_suplexdash;
				p.image = 0;
				p.move = p.xscale;
				p.hsp = 4 * p.move;
			}
		}
	}
	
	if val == 3
	{
		for(var i = 0; i < floor(bullets); i++)
			draw_sprite(spr_fuelHUD, -1, 136 - 46 * i, 46);
	}
	
	draw_simuplayer();
});
opt.opts = [
	["NONE", 0],
	["CHAINSAW", 3],
	["SHOULDER BASH", 1],
	["FACEPLANT", 2]
];

#endregion
#region HEAT METER

var opt = add_option("Heat Meter", "heatmeter", "Rewards good gameplay with more points, but harder enemies!", function(val)
{
	var xx = 960 / 2.5 / 2, yy = 540 / 2.5 / 2;
	
	if val
	{
		draw_sprite(spr_heatmeter, 0, xx, yy);
		draw_sprite(spr_pizzascore, 0, xx, yy);
	}
	else
		draw_sprite(spr_pizzascore, 0, xx, yy);
});

#endregion

add_section("Input");
#region SWAP GRAB

add_option("Swap Grab", "swapgrab", "Binds the grab back to the normal bind, and moves whatever attack style you have to the CHAINSAW button.\n\nChange it in the key config.");

#endregion
#region SHOOT BUTTON

var opt = add_option("Separate Shoot", "shootbutton", "Move the shoot button for both the pistol and the shotgun to a standalone SHOOT button, A by default.", function(val)
{
	shader_set(shd_pal_swapper);
	pal_swap_set(spr_peppalette, 1, false);
	
	if val == 0
	{
		var cx = 180, cy = 50;
		draw_sprite(spr_tutorialkey, 0, cx, cy);
		draw_set_align(1, 1);
		draw_set_font(global.tutorialfont);
		draw_text_color(cx + 16, cy + 14, chr(global.key_slap), c_black, c_black, c_black, c_black, 1);
		draw_set_align();
	
		draw_sprite(spr_player_shotgun, 0, 200, 130);
	}
	else if val == 1
	{
		var cx = 80, cy = 50;
		draw_sprite(spr_tutorialkey, 0, cx, cy);
		draw_set_align(1, 1);
		draw_set_font(global.tutorialfont);
		draw_text_color(cx + 16, cy + 14, chr(global.key_slap), c_black, c_black, c_black, c_black, 1);
		draw_set_align();
	
		draw_sprite(spr_player_suplexdash, 5, 100, 130);
		
		var cx = 260, cy = 50;
		draw_sprite(spr_tutorialkey, 0, cx, cy);
		draw_set_align(1, 1);
		draw_set_font(global.tutorialfont);
		draw_text_color(cx + 16, cy + 14, chr(global.key_shoot), c_black, c_black, c_black, c_black, 1);
		draw_set_align();
		
		draw_sprite(spr_player_shotgun, 0, 260, 130);
	}
	else if val == 2
	{
		var cx = 80, cy = 50;
		draw_sprite(spr_tutorialkey, 0, cx, cy);
		draw_set_align(1, 1);
		draw_set_font(global.tutorialfont);
		draw_text_color(cx + 16, cy + 14, chr(global.key_shoot), c_black, c_black, c_black, c_black, 1);
		draw_set_align();
		
		draw_sprite(spr_player_shotgun, 0, 100, 130);
		
		var cx = 260, cy = 50;
		draw_sprite(spr_tutorialkey, 0, cx, cy);
		draw_set_align(1, 1);
		draw_set_font(global.tutorialfont);
		draw_text_color(cx + 16, cy + 14, chr(global.key_slap), c_black, c_black, c_black, c_black, 1);
		draw_set_align();
		
		draw_sprite(spr_player_pistolshot, 1, 280, 130);
	}
	
	shader_reset();
});
opt.opts = [
	["OFF", false],
	["ON", true],
	["SHOTGUN ONLY", 2]
]

#endregion
#region INPUT DISPLAY

add_button("Input Display", "An in-game input display. You can drag it around with your mouse.", function()
{
	visible = false;
	with obj_option
		menu_goto(menus.inputdisplay);
});

#endregion

add_section("Visual");
#region AFTERIMAGES

var opt = add_option("Afterimages", "afterimage", "Choose between normal afterimages and blue afterimages for certain moves.", [seq_afterimages_final, seq_afterimages_eggplant]);
opt.opts = [
	["FINAL", 0],
	["EGGPLANT", 1]
]

#endregion
#region PANIC BG

var opt = add_option("Panic Background", "panicbg", "Brings back the wavy background effect from old builds when escaping.", function(val)
{
	if val
	{
		shader_set(shd_panicbg);
		
		shader_set_uniform_f(shader_get_uniform(shd_panicbg, "panic"), 1);
		shader_set_uniform_f(shader_get_uniform(shd_panicbg, "time"), current_time / 1000);
		
		draw_sprite_tiled_ext(bg_desertescape, -1, 0, 0, 0.4, 0.4, c_white, 1);
		
		shader_reset();
	}
	else
		draw_sprite_ext(bg_desertescape, -1, 0, 0, 0.4, 0.4, 0, c_white, 1);
});
opt.opts = [
	["OFF", false],
	["ON", true],
	["ON + BLUR", 2]
]

#endregion
#region SLOPE ROTATION

var opt = add_option("Slope Rotation", "sloperot", "Rotates the player when standing on a slope.", function(val)
{
	var slopex = 132;
	draw_sprite_ext(spr_slope, 0, slopex, 94 + 32, 2, 2, 0, c_white, 1);
	draw_sprite_ext(spr_slope, 0, slopex + 32 * 4, 94 + 32, -2, 2, 0, c_white, 1);
	
	var p = simuplayer;
	if p.state == states.titlescreen
	{
		p.x = 50;
		p.state = states.actor;
		p.vsp = 0;
		p.sprite = spr_player_move;
		p.xscale = 1;
	}
	
	p.image += p.hsp / 10;
	if p.x > slopex + 32 * 4
	{
		p.angle = lerp(p.angle, 0, 0.5);
		p.y = 144;
		p.hsp = Approach(p.hsp, 5, 0.2);
	}
	else if p.x > slopex + 32 * 2
	{
		var slop = slopex + 32 * 2;
		
		p.angle = lerp(p.angle, -35, 0.3);
		p.y = lerp(144, 144 - 64, 1 - clamp((p.x - slop) / (32 * 2), 0, 1));
		p.hsp = 3;
	}
	else if p.x > slopex
	{
		p.angle = lerp(p.angle, 35, 0.5);
		p.y = lerp(144, 144 - 64, clamp((p.x - slopex) / (32 * 2), 0, 1));
		p.hsp = 3;
	}
	else
	{
		p.angle = lerp(p.angle, 0, 0.5);
		p.y = 144;
		p.hsp = 5;
	}
	if val == 0
		p.angle = 0;
	
	draw_simuplayer();
});

#endregion
#region SHOW FPS

showfps = 60;
showfps_t = 60;

var opt = add_option("FPS Counter", "showfps", "Shows an FPS counter at the bottom right of the screen.", function(val)
{
	if showfps_t > 0
		showfps_t--;
	else
	{
		showfps = irandom_range(10, 60);
		showfps_t = 60;
	}
	
	simuplayer.image += 0.35 * (showfps / 60);
	simuplayer.state = states.actor;
	
	if val
	{
		draw_set_font(global.font_small);
		draw_set_colour(showfps < 30 ? (showfps < 15 ? c_red : c_yellow) : c_white);
		draw_set_align(fa_right);
		draw_text_transformed(960 / 2.5 - 20, 540 / 2.5 - 50, string(showfps), 2, 2, 0);
		draw_set_align();
	}
	
	shader_set(shd_pal_swapper);
	pal_swap_set(spr_peppalette, 1, false);
	draw_sprite_ext(spr_player_move, simuplayer.image, 960 / 2.5 / 4, 100, 2, 2, 0, c_white, 1);
	pal_swap_reset();
});

#endregion
#region COLORBLIND

var opt = add_option("Colorblind Mode", "colorblind_type", "Applies a fullscreen shader that hopefully helps colorblindness.", function(val)
{
	global.colorblind_type = val;
	draw_sprite_ext(spr_mirrored_level, 0, -258, -292, 0.9, 0.9, 0, c_white, 1);
});
opt.opts = [
	["NONE", -1],
	["PROTANOPIA", 0],
	["DEUTERANOPIA", 1],
	["TRITANOPIA", 2]
]

#endregion
#region SECRET STYLE

var opt = add_option("Secret Style", "secrettiles", "Choose how you want secrets to be shown.", [seq_secretwall_off, seq_secretwall_on]);
opt.opts = [
	["NORMAL", 0],
	["SPOTLIGHT", 1]
]

#endregion
#region SMOOTH CAM

smoothcamx = 960 / 5;
add_slider("Smooth Camera", "smoothcam", [0, 0.75], "Smooths out the camera.", function(val)
{
	var p = simuplayer;
	if p.state == states.titlescreen
	{
		p.state = states.normal;
		p.sprite = spr_player_idle;
		p.x = 960 / 5;
		p.xscale = 1;
	}
	
	if ((p.xscale == 1 && p.x < 960 / 5 + 120)
	or (p.xscale == -1 && p.x > 960 / 5 - 120))
	&& p.timer == 0
	{
		p.move = p.xscale;
		p.timer = 0;
	}
	else
	{
		if p.timer == 0
		{
			p.move = 0;
			p.xscale *= -1;
		}
		p.timer++;
		
		if p.timer >= 50
			p.timer = 0;
	}
	
	smoothcamx = lerp(p.x, smoothcamx, val * 1.2);
	draw_set_colour(c_white);
	draw_set_alpha(1);
	//draw_rectangle(smoothcamx - 960 / 10, p.y - 540 / 10, smoothcamx + 960 / 10, p.y + 540 / 10, true);
	
	draw_sprite_ext(spr_micnoise2, -1, smoothcamx, p.y + Wave(-90, -80, 1, 0), p.xscale, 1, 0, c_white, 1);
	
	draw_simuplayer();
});

#endregion
#region HUD

var opt = add_option("Hud Style", "hud", "Choose between the pre-April 2021 HUD and the final game one.", function(val)
{
	if val == 0
	{
		draw_sprite_ext(REMIX ? spr_tv_bgfinal_NEW : spr_tv_bgfinal, 1, 960 / 5, 540 / 5, 1, 1, 0, c_white, 1);
		draw_sprite(spr_tv_idle, -1, 960 / 5, 540 / 5);
	}
	if val == 1
	{
		draw_sprite(spr_pepinoHUD, -1, 960 / 5, 540 / 5 - 8);
		draw_sprite(spr_speedbar, 0, 960 / 5, 540 / 5 + 32);
	}
});
opt.opts = [
	["OLD", 1],
	["FINAL", 0],
]

#endregion
#region BLOCKS

var opt = add_option("Block Style", "blockstyle", "Just for you, face block fans.", function(val)
{
	if val == 0
	{
		draw_sprite(spr_towerblock, 0, 960 / 5 - 32 - 80, 540 / 5 - 32);
		draw_sprite(spr_towerblocksmall, 0, 960 / 5 - 16, 540 / 5 - 16);
		draw_sprite(spr_metaltowerblock, 0, 960 / 5 - 32 + 80, 540 / 5 - 32);
	}
	if val == 1
	{
		draw_sprite(spr_bigdestroy, -1, 960 / 5 - 32 - 80, 540 / 5 - 32);
		draw_sprite(spr_destroyable, -1, 960 / 5 - 16, 540 / 5 - 16);
		draw_sprite(spr_metalb, -1, 960 / 5 - 32 + 80, 540 / 5 - 32);
	}
	if val == 2
	{
		draw_sprite(spr_bigdestroy_old, 0, 960 / 5 - 32 - 80, 540 / 5 - 32);
		draw_sprite(spr_destroyable_old, 0, 960 / 5 - 16, 540 / 5 - 16);
		draw_sprite(spr_metaltowerblock, 0, 960 / 5 - 32 + 80, 540 / 5 - 32);
	}
});
opt.opts = [
	["OLD", 2],
	["FINAL", 0],
	["SEPTEMBER", 1]
]

#endregion
#region ROOM NAMES

var opt = add_option("Room Names", "roomnames", "Each room in a level will show a unique name, like in the hub.", function(val)
{
	
});

#endregion
#region MACH SOUND

var opt = add_option("Mach Sound", "machsnd", "Choose between the normal version of the mach sound or an older one.", function(val)
{
	
});
opt.opts = [
	["FINAL", 0],
	["OLD", 1],
]

#endregion

xo = 0;
yo = 0;
alpha = 1;
scroll = 0;

for(var i = 0; i < array_length(options_array); i++)
{
	var opt = options_array[i];
	if opt.type == modconfig.option
	{
		var value = variable_global_get(opt.vari);
		for(var j = 0; j < array_length(opt.opts); j++)
		{
			if opt.opts[j][1] == value
				opt.value = j;
		}
	}
	if opt.type == modconfig.slider
	{
		var value = variable_global_get(opt.vari);
		opt.value = (value - opt.range[0]) / (opt.range[1] - opt.range[0]);
	}
}
