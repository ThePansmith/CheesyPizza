live_auto_call;

// prep
depth = -600;
image_speed = 0.35;
scr_init_input();
stickpressed = false;
con = 0;
t = 0;
buffer = 0;
sequence_layer = -1;
move_buffer = -1;
control_mouse = false;
scrolltarget = 0;

select = function(sel)
{
	self.sel = sel;
	
	if sel != -1
		sound_play(sfx_step);
	sound_stop(machsnd, true);
	
	simuplayer.state = states.titlescreen;
	simuplayer.changed = true;
	simuplayer.angle = 0;
		
	if layer_exists(sequence_layer)
		layer_destroy(sequence_layer);
}

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
		drawfunc: drawfunc,
		condition: noone
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
		drawfunc: drawfunc,
		condition: noone
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
		drawfunc: drawfunc,
		condition: noone
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
	particles = [
	
	];
	simuplayer = {
		x: 960 / 2.5 / 2, y: 540 / 2.5 / 1.5, state: states.normal, hsp: 0, vsp: 0, sprite: spr_player_idle, image: 0, xscale: 1, timer: 0, move: 0, changed: false, angle: 0
	}
}
function draw_simuplayer()
{
	var p = simuplayer;
	if p.y < -50
	{
		draw_sprite(spr_peppinoicon, 0, p.x, 25);
		exit;
	}
	
	shader_reset();
	var width = 960 / 2.5;
	
	var xo = p.x - lengthdir_x(28, p.angle - 90);
	var yo = p.y;
	
	if xo < 50
		draw_sprite_ext(p.sprite, p.image, xo + width, yo, p.xscale, 1, p.angle, c_white, 1);
	if xo > width - 50
		draw_sprite_ext(p.sprite, p.image, xo - width, yo, p.xscale, 1, p.angle, c_white, 1);
	
	draw_sprite_ext(p.sprite, p.image, xo, yo, p.xscale, 1, p.angle, c_white, 1);
}
function draw_particles()
{
	for(var i = 0; i < array_length(particles); i++)
	{
		var p = particles[i];
		if p.img >= sprite_get_number(p.sprite) - 1
		{
			array_delete(particles, i, 1);
			i--;
			continue;
		}
		p.img += p.imgspeed;
		draw_sprite(p.sprite, p.img, p.x, p.y);
	}
}
function add_particle(sprite, imgspeed, x, y)
{
	array_push(particles, {sprite: sprite, imgspeed: imgspeed, img: 0, x: x, y: y});
}
reset_simuplayer();

// options
add_section("Gameplay");

#region REMIX

tv_bg = {surf: noone, sprite: spr_gate_entranceBG, parallax: [0.65, 0.75, 0.85], x: 0, y: 68};

color1 = shader_get_uniform(shd_mach3effect, "color1");
color2 = shader_get_uniform(shd_mach3effect, "color2");
var opt = add_option("REMIX", "gameplay", "Adds extra quality of life improvements to a bunch of stuff.", function(val)
{
	if val == 1
	{
		// move it
		var movespeed = -0.25;
		
		tv_bg.x += movespeed;
		if !surface_exists(tv_bg.surf)
			tv_bg.surf = surface_create(278, 268);
			
		// draw it
		surface_set_target(tv_bg.surf);
			
		for(var i = 0; i < sprite_get_number(tv_bg.sprite); i++)
			draw_sprite_tiled(tv_bg.sprite, i, 278 / 2 + tv_bg.x * max(lerp(-1, 1, tv_bg.parallax[i]), 0), 268);
		
		gpu_set_blendmode(bm_subtract);
		draw_sprite(spr_tv_clip, 1, 278 / 2, 268 - tv_bg.y);
		gpu_set_blendmode(bm_normal);
			
		surface_reset_target();
		
		draw_surface_ext(tv_bg.surf, 110 - 278 / 2, 70 - 268 + tv_bg.y, 1, 1, 0, c_white, 1);
		shader_reset();
	}
	else
		draw_sprite_ext(spr_tv_bgfinal, 1, 110, 70, 1, 1, 0, c_white, 1);
	
	shader_set(shd_pal_swapper);
	pal_swap_set(spr_peppalette, 1, 0);
	draw_sprite_ext(val == 1 ? spr_tv_idle_NEW : spr_tv_idle, -1, 110, 70, 1, 1, 0, c_white, 1);
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

add_option("Experimental", "experimental", "Allows access to fun console commands and other WIP stuff. Please do not report bugs from these!", function(val)
{
	draw_set_colour(0);
	draw_rectangle(0, 0, 384, 216, false);
	draw_sprite_ext(spr_experimental, 0, 0, 0, 1, 1, 0, c_white, val ? 1 : 0.35);
	
	draw_set_colour(c_white);
	if !val
	{
		draw_set_font(global.font_small);
		draw_set_align(fa_center, fa_middle);
		draw_text(384 / 2, 216 / 1.2, "Experimental's off!");
		draw_set_align();
	}
});

#region ATTACK STYLE

var opt = add_option("Attack Style", "attackstyle", "Alternatives to the basic grab move. The original grab is moved to the CHAINSAW button.", [seq_attackstyle_grab, seq_attackstyle_kungfu, seq_attackstyle_shoulderbash, seq_attackstyle_lunge]);
opt.opts = [
	["GRAB", 0],
	["KUNG FU", 1],
	["SHOULDER BASH", 2],
	["LUNGE", 3],
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
				sound_play_centered(sfx_pistolshot);
				p.state = states.pistol;
				p.sprite = spr_player_pistolshot;
				p.image = 0;
				bullets--;
			}
			if val == 2
			{
				p.hsp = p.xscale * 6;
				p.timer = -50;
				sound_play_centered(sfx_breakdance);
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
					sound_play_centered(sfx_dive);
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
				//sound_play_centered(sfx_suplexdash);
				
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
#region BUFFED UPPERCUT

var opt = add_option("Buffed Uppercut", "uppercut", "Keeps your momentum when uppercutting, and you can press down to fall down faster.", function(val)
{
	var p = simuplayer;
	if p.state == states.titlescreen
	{
		p.timer = 0;
		p.state = states.normal;
	}
	p.move = 1;
	
	p.timer++;
	if p.timer >= 20
	{
		p.timer = -50;
		seq_afterimages_uppersnd();
		
		p.state = states.panicjump;
		p.sprite = spr_player_breakdanceuppercut;
		if val != 1
			p.hsp = 2;
		p.vsp = -12;
		p.image = 0;
	}
	
	draw_simuplayer();
});

#endregion
#region POUND JUMP

var opt = add_option("Groundpound Jump", "poundjump", "Hold or press jump when landing from a ground pound to jump higher.");

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
#region LAPPING

lap = 2;
lapshake = 0;

var opt = add_button("Lapping", "Modify lapping to your heart's content.", function()
{
	visible = false;
	with obj_option
		menu_goto(MENUS.lapping);
},
function()
{
	lapshake = Approach(lapshake, 0, 0.35);
	if lap < 999
	{
		if ++simuplayer.timer >= 30
		{
			simuplayer.timer = 0;
			lap++;
			lapshake = 3;
		}
	}
	
	var xx = 960 / 2.5 / 2, yy = 540 / 2.5 / 2;
	yy -= 152 / 2;
	
	draw_sprite(spr_lap2, 1, xx, yy);
	
	var lap_text = string(lap);
	var wd = sprite_get_width(spr_lapfontbig) * string_length(lap_text);
	
	shader_reset();
	
	// numbers!
	gpu_set_zwriteenable(true);
	gpu_set_ztestenable(true);
	gpu_set_alphatestenable(true);
	
	for(var i = 1; i <= string_length(lap_text); i++)
	{
		var lx = xx - 8 + 39 * i - ((wd - 64) / 3) + random_range(-lapshake, lapshake);
		var ly = yy + 8 + random_range(-lapshake, lapshake);
		var letter = ord(string_char_at(lap_text, i)) - ord("0");
		
		gpu_set_depth(-1);
		gpu_set_blendmode(bm_normal);
		draw_sprite(spr_lapfontbig, letter, lx, ly);
		
		gpu_set_depth(0);
		gpu_set_blendmode_ext(bm_dest_color, bm_zero);
		draw_sprite(spr_lapfontbig, letter + 10, lx, ly);
	}
	gpu_set_zwriteenable(false);
	gpu_set_ztestenable(false);
	
	// the thingy
	gpu_set_blendmode(bm_normal);
	draw_sprite(spr_lap2, 2, xx - ((wd - 64) / 3), yy);
	gpu_set_blendmode_ext(bm_dest_color, bm_zero);
	draw_sprite(spr_lap2, 3, xx - ((wd - 64) / 3), yy);
	gpu_set_blendmode(bm_normal);
	
	gpu_set_alphatestenable(false);
});
opt.condition = function()
{
	return [!global.lap, "Can't change this while lapping."];
}

#endregion
#region HOLIDAY OVERRIDE

var opt = add_option("Holiday Override", "holidayoverride", "Overrides the current in-game holiday.", function(val)
{
	var xx = 960 / 2.5 / 2, yy = 540 / 2.5 / 2;
	if val == -1
		val = global.holiday;
	
	switch val
	{
		case holiday.none:
			draw_sprite(spr_PTG, -1, xx + Wave(-3, 3, 2, 0), yy + 50);
			break;
		case holiday.halloween:
			draw_sprite(spr_PTGhalloween, -1, xx + random_range(-2, 2), yy + 75 + random_range(-1, 1) - abs(sin(current_time / 1) * 50));
			break;
	}
});
opt.opts = [
	["OFF", -1],
	["NONE", holiday.none],
	["HALLOWEEN", holiday.halloween]
]
opt.condition = function()
{
	return [room == Mainmenu, "Go back to the main menu\nto change this!"];
}

#endregion

add_section("Input");
#region SWAP GRAB

add_option("Swap Grab", "swapgrab", "Binds the grab back to the normal bind, and moves whatever attack style you have to the CHAINSAW button.", function(val)
{
	var cx = 80, cy = 50;
	draw_sprite(spr_tutorialkey, 0, cx, cy);
	draw_set_align(1, 1);
	draw_set_font(global.tutorialfont);
	draw_text_color(cx + 16, cy + 14, chr(global.key_slap), c_black, c_black, c_black, c_black, 1);
	draw_set_align();
	
	var cx = 260, cy = 50;
	draw_sprite(spr_tutorialkey, 0, cx, cy);
	draw_set_align(1, 1);
	draw_set_font(global.tutorialfont);
	draw_text_color(cx + 16, cy + 14, chr(global.key_chainsaw), c_black, c_black, c_black, c_black, 1);
	draw_set_align();
	
	shader_set(shd_pal_swapper);
	pal_swap_set(spr_peppalette, 1, false);
	draw_sprite(val ? spr_player_suplexdash : spr_player_kungfu1, 6, 100, 130);
	draw_sprite(val ? spr_player_kungfu1 : spr_player_suplexdash, 6, 280, 130);
	pal_swap_reset();
});

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
		menu_goto(MENUS.inputdisplay);
},
function()
{
	var xx = 960 / 2.5 / 2, yy = 540 / 2.5 / 2;
	with obj_inputdisplay
	{
		scr_init_input();
		draw_inputdisplay(xx - maxx / 2, yy - maxy / 2);
	}
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

if !global.performance
{
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
}

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
#region ENEMY SPIN

var opt = add_option("Enemy Spin", "enemyrot", "Makes dead enemies spin in the air.", function(val)
{
	var xx = 960 / 2.5 / 2, yy = 540 / 2.5 / 2;
	
	if ++simuplayer.timer >= 10
	{
		simuplayer.timer = 0;
		add_particle(spr_cloudeffect, 0.5, xx + random_range(-50, 50), yy + random_range(-50, 50));
	}
	
	draw_sprite_ext(spr_slimedead, 0, xx, yy, 1, 1, -current_time / 2 * val, c_white, 1);
	draw_particles();
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

/*
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
*/

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
		draw_sprite_ext(spr_tv_bgfinal, 1, 960 / 5, 540 / 5, 1, 1, 0, c_white, 1);
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

var opt = add_option("Asset Style", "blockstyle", "Just for you, face block fans.", function(val)
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

rname_y = -50;
var opt = add_option("Room Names", "roomnames", "Each room in a level will show a unique name, like in the hub.", function(val)
{
	if val
		rname_y = Approach(rname_y, 32, 5);
	else
		rname_y = Approach(rname_y, -50, 1);
	
	var xi = 384 / 2, yy = rname_y;
	draw_sprite_tiled(bg_secret, -1, current_time / 100, current_time / 100);
	draw_sprite(spr_roomnamebg, 0, xi, yy);
	
	draw_set_font(lang_get_font("smallfont"));
	draw_set_align(fa_center, fa_middle);
	draw_set_color(c_white);
	draw_text_ext(xi, yy + 8, "BALLSACK CITY", 12, 280);
	draw_set_align();
});

#endregion
#region MACH SOUND

machsnd = sound_create_instance(sfx_mach);
var opt = add_option("Mach Sound", "machsnd", "Choose between the normal version of the mach sound or an older one.", function(val)
{
	var p = simuplayer;
	if p.state == states.titlescreen
	{
		p.state = states.actor;
		p.timer = 0;
		p.sprite = spr_player_idle;
		p.x = 384 / 2;
		p.hsp = 0;
	}
	
	++p.timer;
	p.image += 0.35;
	
	if !sound_is_playing(machsnd)
		sound_play(machsnd);
	
	sound_instance_move(machsnd, camera_get_view_x(view_camera[0]) + 960 / 2, camera_get_view_y(view_camera[0]) + 540 / 2);
	switch p.sprite
	{
		case spr_player_idle:
			fmod_event_instance_set_parameter(machsnd, "state", 0, true);
			if p.timer >= 30
			{
				p.sprite = spr_player_mach1;
				p.image = 0;
			}
			break;
		
		case spr_player_mach1:
			fmod_event_instance_set_parameter(machsnd, "state", val ? 5 : 1, true);
			
			p.timer = 0;
			if p.image >= sprite_get_number(p.sprite) - 1
				p.sprite = spr_player_mach;
			break;
		
		case spr_player_mach:
			fmod_event_instance_set_parameter(machsnd, "state", val ? 6 : 2, true);
			
			p.image += 0.2;
			if p.timer >= 40
			{
				p.sprite = spr_player_mach4;
				p.timer = 0;
			}
			break;
		
		case spr_player_mach4:
			fmod_event_instance_set_parameter(machsnd, "state", val ? 7 : 3, true);
			
			if p.timer >= 80
			{
				p.sprite = spr_player_machslidestart;
				p.timer = 0;
				p.image = 0;
				
				sound_play_centered(sfx_break);
			}
			break;
		
		case spr_player_machslidestart:
			fmod_event_instance_set_parameter(machsnd, "state", 0, true);
			
			if p.image >= sprite_get_number(p.sprite) - 1
			{
				p.sprite = spr_player_machslide;
				p.timer = 0;
			}
			break;
		case spr_player_machslide:
			if p.timer > 10
			{
				p.sprite = spr_player_machslideend;
				p.image = 0;
			}
			break;
		case spr_player_machslideend:
			if p.image >= sprite_get_number(p.sprite) - 1
			{
				p.sprite = spr_player_idle;
				p.timer = 0;
			}
			break;
	}
	/*
	if p.image >= sprite_get_number(p.sprite) - 1
	{
		
	}
	*/
	draw_simuplayer();
});
opt.opts = [
	["FINAL", 0],
	["OLD", 1],
]

#endregion
#region SUGARY OVERRIDES

var opt = add_option("Sugary Overrides", "sugaryoverride", "Makes normal levels Sugary Spire themed when playing as Pizzelle or Pizzano.");

#endregion
#region PERFORMANCE

/*
var opt = add_option("Performance Mode", "performance", "Disables a bunch of stuff that would slow down the game.", function(val)
{
	
});
*/

#endregion

xo = 0;
yo = 0;
alpha = 1;
scroll = 0;

refresh_options = function()
{
	var yy = 0;
	
	options_pos = [];
	for(var i = 0; i < array_length(options_array); i++)
	{
		var opt = options_array[i];
		switch opt.type
		{
			case modconfig.option:
				yy += 20;
				
				var value = variable_global_get(opt.vari);
				for(var j = 0; j < array_length(opt.opts); j++)
				{
					if opt.opts[j][1] == value
						opt.value = j;
				}
				break;
			
			case modconfig.slider:
				yy += 20;
				
				var value = variable_global_get(opt.vari);
				opt.value = (value - opt.range[0]) / (opt.range[1] - opt.range[0]);
				break;
			
			default:
				yy += 20;
				break;
		
			case modconfig.section:
				yy += 30;
				yy += 40;
				break;
		}
		options_pos[i] = yy;
	}
}
refresh_options();
