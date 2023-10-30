live_auto_call;
event_inherited();

// animation
init = false;
charshift = [0, 0, 0];
player_surface = surface_create(256, 256);
shown_tip = false;

// selection
noisetype = 0;
sel = {
	pal: 1,
	char: 0,
	mix: 0,
	side: 0
};
flashpal = [-1, 0];

// make sure to add the palettes to scr_indexpalettes() in scr_startup!
characters = [
	["P", spr_player_idle, spr_peppalette, [1, 3]], // character, idle, palette sprite, [main color, mixing color]
	["N", spr_playerN_idle, spr_noisepalette, [1, 4]],
	["V", spr_playerV_idle, spr_vigipalette, [1, 5]],
	["G", spr_player_ratmountidle, spr_peppalette, [1, 3]],
	["S", spr_snick_idle, spr_snickpalette, [1, 4]],
	["SP", spr_playerSP_idle, spr_pizzypalette, [1, 3]],
	["SN", spr_pizzano_idle, spr_pizzanopalette, [1, 5]],
	["BN", spr_playerBN_idle, spr_bopalette, [1, 5]]
	
	//["PN", spr_playerPN_idle, spr_peppalette, [1, 3]],
];

// set in user event 0
palettes = [];
mixables = [];
unlockables = [];

if !global.sandbox
	array_push(unlockables, "unfunny", "money", "sage", "blood", "tv", "dark", "shitty", "golden", "garish", "mooney", "funny", "itchy", "pizza", "stripes", "goldemanne", "bones", "pp", "war", "john", "candy", "bloodstained", "bat", "pumpkin", "fur", "flesh");
array_push(unlockables, "mario", "grinch");

function add_palette(palette, entry, texture = noone, name = "PALETTE", description = "(No Description)", mix_prefix)
{
	// check if the palette was unlocked
	if array_get_index(unlockables, entry) != -1
	{
		ini_open_from_string(obj_savesystem.ini_str_options);
		if !ini_read_real("Palettes", entry, false)
		{
			ini_close();
			exit;
		}
		ini_close();
	}
	
	array_push(palettes, {
		palette: palette,
		entry: entry,
		texture: texture,
		name: name,
		description: description
	});
	
	if !is_undefined(mix_prefix)
	{
		if mix_prefix != ""
			mix_prefix = mix_prefix + " ";
		
		array_push(mixables, {
			palette: palette,
			prefix: mix_prefix,
			name: name
		});
	}
}
self.add_palette = add_palette;

// automatically select character
if instance_exists(obj_player1)
{
	var pchar = obj_player1.character;
	if pchar == "P"
	{
		if obj_player1.isgustavo
			pchar = "G";
	}
	
	for(var i = 0; i < array_length(characters); i++)
	{
		if pchar == characters[i][0]
			sel.char = i;
	}
	noisetype = obj_player1.noisetype;
}

// DO THE FUNNY
event_user(0);

// functions
select = function()
{
	var same = false;
	with obj_player1
	{
		var prevchar = character, prevpal = paletteselect, prevtex = global.palettetexture, prevnoise = noisetype;
		
		// apply it
		character = other.characters[other.sel.char][0];
		if state == states.ratmount
			state = states.normal;
		
		isgustavo = false;
		if check_char("G")
		{
			ratmount_movespeed = 8;
			gustavodash = 0;
			isgustavo = true;
			state = states.ratmount;
			sprite_index = spr_ratmount_idle;
			brick = true;
		}
		
		scr_characterspr();
		if other.sel.mix > 0
			paletteselect = other.mixables[other.sel.mix].palette;
		else
			paletteselect = other.palettes[other.sel.pal].palette;
		global.palettetexture = other.palettes[other.sel.pal].texture;
		noisetype = other.noisetype;
		
		// if nothing changed, don't save
		if character == prevchar && paletteselect == prevpal && global.palettetexture == prevtex && noisetype == prevnoise
			same = true;
		
		if !same
		{
			// setup animation
			xscale = 1;
			create_particle(x, y, part.genericpoofeffect);
			visible = false;
			
			// save
			ini_open_from_string(obj_savesystem.ini_str);
			ini_write_string("Game", "character", character);
			ini_write_real("Game", "palette", paletteselect);
			ini_write_string("Game", "palettetexture", sprite_get_name(global.palettetexture));
			obj_savesystem.ini_str = ini_close();
			gamesave_async_save();
		}
		sound_play_3d(sfx_collecttoppin, x, y);
	}
	anim_con = 2;
}
postdraw = function(curve)
{
	if anim_con == 2 && !obj_player1.visible
	{
		handx = lerp(handx, SCREEN_WIDTH / 2, 0.15);
		handy = lerp(handy, -50, 0.15);
		var curve2 = animcurve_channel_evaluate(jumpcurve, 1 - anim_t);
		
		var pal = palettes[sel.pal];
		var charx = SCREEN_WIDTH / 2 + sideoffset + charshift[0] * 75, chary = SCREEN_HEIGHT / 2 - 32 + charshift[1] * 75, scale = clamp(lerp(1, 2, curve), 1, 2);
		
		charx = lerp(charx, obj_player1.x - camera_get_view_x(view_camera[0]), 1 - anim_t);
		chary = lerp(chary, obj_player1.y - camera_get_view_y(view_camera[0]), curve2);
		
		shader_set(shd_pal_swapper);
		if pal.texture != noone
			pattern_set(global.Base_Pattern_Color, characters[sel.char][1], -1, scale, scale, pal.texture);
		
		pal_swap_set(characters[sel.char][2], sel.mix > 0 ? mixables[sel.mix].palette : pal.palette, false);
		draw_sprite_ext(characters[sel.char][1], -1, charx, chary, scale, scale, 0, c_white, 1);
		pattern_reset();
		pal_swap_reset();
	}
}

draw_skin_palette = function(_x, _y, _color, _alpha)
{
	if _color == undefined
		_color = c_white;
	
	vertex_build_quad(vertex_buffer, 
		// RX: Where to draw the sprite on screen
		_x, _y, sprite_get_width(spr_skinchoicepalette), sprite_get_height(spr_skinchoicepalette),
		_color, _alpha,
		//RX: where to get the texture on the sheet
		uv_info.left, uv_info.top, (uv_info.right - uv_info.left), (uv_info.bottom - uv_info.top)
	);
}

draw = function(curve)
{
	#region Animation
	
	var curve2 = anim_t;
	var curv_prev = curve;
	if anim_con != 0
	{
		curve = 1; // actual animated curve
		curve2 = 1; // the timer
	}
	
	switch sel.side
	{
		case 0:
			sideoffset = lerp(sideoffset, 0, 0.25);
			break;
		case 1:
			sideoffset = lerp(sideoffset, -280, 0.25);
			break;
		case 2:
			sideoffset = lerp(sideoffset, 280, 0.25);
			break;
	}
	
	#endregion
	#region Character
	
	if !surface_exists(player_surface)
		player_surface = surface_create(256, 256);
	
	surface_set_target(player_surface);
	draw_clear_alpha(c_white, 0);
	
	var pal = palettes[sel.pal];
	if anim_con != 2 or obj_player1.visible
	{
		var charx = SCREEN_WIDTH / 2 + sideoffset + charshift[0] * 75, chary = SCREEN_HEIGHT / 2 - 32 + charshift[1] * 75;
		
		// special skins
		if characters[sel.char][0] == "N"
		{
			characters[sel.char][1] = noisetype ? spr_playerN_pogofall : spr_playerN_idle;
			if check_skin(SKIN.n_chungus, "N", pal.palette)
			{
				characters[sel.char][1] = spr_playerN_chungus;
				if noisetype == 1
				{
					draw_set_font(global.font_small);
					draw_set_align(fa_center);
					draw_set_colour(c_white);
						
					draw_text(charx, chary - 68, "Pogo");
				}
			}
		}
		if characters[sel.char][0] == "P"
		{
			characters[sel.char][1] = spr_player_idle;
			if check_skin(SKIN.p_peter, "P", pal.palette)
				characters[sel.char][1] = spr_player_petah;
		}
		if characters[sel.char][0] == "PN"
		{
			characters[sel.char][1] = spr_playerPN_idle;
			if check_skin(SKIN.pn_homer, "PN", pal.palette)
				characters[sel.char][1] = spr_playerPN_homer;
		}
		
		shader_set(shd_pal_swapper);
		if pal.texture != noone
			pattern_set(global.Base_Pattern_Color, characters[sel.char][1], -1, 2, 2, pal.texture);	
		pal_swap_set(characters[sel.char][2], sel.mix > 0 ? mixables[sel.mix].palette : pal.palette, false);
		draw_sprite(characters[sel.char][1], -1, 128, 128);
		pal_swap_reset();
		pattern_reset();
	}
	surface_reset_target();
	
	if curv_prev < 1
		draw_set_spotlight(SCREEN_WIDTH / 2, SCREEN_HEIGHT / 2, (SCREEN_WIDTH / (960 / 560)) * curv_prev);
	draw_surface_ext(player_surface, charx - 256, chary - 256, 2, 2, 0, c_white, curve * charshift[2]);
	
	#endregion
	#region Text
	
	var name = string_upper(pal.name), desc = pal.description;
	if sel.mix > 0
	{
		name = string_upper(mixables[sel.mix].prefix + pal.name);
		desc = mixables[sel.mix].name + " + " + pal.name;
		
		if name == "BURNT TRANS FLAG"
		{
			name = "DUE TO";
			desc = "Legal reasons we cannot show this combo name";
		}
	}
	
	draw_set_font(lang_get_font("bigfont"));
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	
	var xx = (SCREEN_WIDTH / 2) - string_width(name) / 2;
	for(var i = 1; i <= string_length(name); i++)
	{
		var char = string_char_at(name, i);
		
		var yy = 400;
		if curve2 != 1 // letters jump up
			yy = lerp(SCREEN_HEIGHT, yy, min(animcurve_channel_evaluate(outback, curve2 + ((i % 3) * 0.075))));
		
		var d = (i % 2 == 0) ? -1 : 1;
		var _dir = floor(Wave(-1, 1, 0.1, 0));
		yy += _dir * d;
		
		draw_text(floor(xx), floor(yy), char);
		xx += string_width(char);
	}
	
	draw_set_halign(fa_center);
	draw_set_alpha(curve);
	draw_set_font(global.font_small);
	draw_text_ext(SCREEN_WIDTH / 2, 440, desc, 16, 600);
	draw_set_alpha(1);
	
	#endregion
	#region Palettes
	
	var palettecurve = sideoffset / -280;
	switch sel.side
	{
		case 0:
			if skin_tip > 0
			{
				skin_tip -= 0.025;
				draw_sprite_ext(spr_palettearrow, 0, SCREEN_WIDTH / 2 + Wave(180, 190, 1, 0), SCREEN_HEIGHT / 2, 1, 1, -90, c_white, skin_tip);
				//draw_sprite_ext(spr_palettearrow, 0, SCREEN_WIDTH / 2 - Wave(180, 190, 1, 0), SCREEN_HEIGHT / 2, 1, 1, 90, c_white, skin_tip);
				
				draw_set_font(global.smallfont);
				draw_set_align(fa_center);
				draw_set_alpha(skin_tip);
				draw_text(SCREEN_WIDTH / 2 + Wave(180, 190, 1, 0), SCREEN_HEIGHT / 2 + 20, "PALETTES");
				//draw_text(SCREEN_WIDTH / 2 - Wave(180, 190, 1, 0), SCREEN_HEIGHT / 2 + 20, "CUSTOMIZE");
				draw_set_align();
			}
			break;
		
		case 1:
			skin_tip = 0;
			var palspr = characters[sel.char][2];
			var xx = lerp(280 / 3, 0, palettecurve), yy = 0;
			var array = !mixing ? palettes : mixables;
		
			vertex_begin(vertex_buffer, vertex_format);
			draw_set_alpha(palettecurve);
		
			for(var i = 0; i < array_length(array); i++)
			{
				var xdraw = xx + (i % 13) * 36, ydraw = yy + floor(i / 13) * 36;
				
				// move hand, and shake current selection
				if ((!mixing && sel.pal == i) or (mixing && sel.mix == i)) && anim_con != 2
				{
					handx = lerp(handx, 8 + 408 + xdraw, 0.35);
					handy = lerp(handy, 70 + ydraw, 0.35);
				
					xdraw += random_range(-0.7, 0.7);
					ydraw += random_range(-0.7, 0.7);
				}
				
				// special skins
				var fuck = -1;
				for(var j = 0; j < SKIN.enum_size; j++)
				{
					if check_skin(j, characters[sel.char][0], array[i].palette)
					{
						fuck = j;
						break;
					}
				}
				
				// draw it
				if flashpal[0] != i
					draw_sprite_ext(spr_skinchoicepalette, 0, 2 + 408 + xdraw, 2 + 70 + ydraw, 1, 1, 0, c_black, 0.25);
				
				if flashpal[0] == i // flashing palette. it only draws this once at a time do NOT FRET
				{
					draw_set_flash();
					draw_sprite_ext(spr_skinchoicepalette, 0, 408 + xdraw, 70 + ydraw, 1, 1, 0, c_white, 1);
					draw_reset_flash();
				}
				else if fuck >= 0 // special palettes
				{
					//array_push(cache, { x: 408 + xdraw, y: 70 + ydraw, pattern: spr_skinchoicecustom, subimage: fuck});
					draw_sprite_ext(spr_skinchoicecustom, fuck, 408 + xdraw, 70 + ydraw, 1, 1, 0, c_white, 1);
				}
				else if mixing or array[i].texture == noone // palettes
					draw_skin_palette(408 + xdraw, 70 + ydraw, pal_swap_get_pal_color(palspr, array[i].palette, characters[sel.char][3][mixing]), draw_get_alpha());
				else // patterns, cached and drawn later
				{
					draw_set_mask(408 + xdraw, 70 + ydraw, spr_skinchoicepalette, 0);
					draw_sprite_stretched(array[i].texture, current_time / 120, 408 + xdraw, 70 + ydraw, 32, 32);
					draw_reset_clip();
					draw_sprite(spr_skinchoicepalette, 1, 408 + xdraw, 70 + ydraw);
				}
			}
			vertex_end(vertex_buffer);
			vertex_submit(vertex_buffer, pr_trianglelist, tex);
			break;
		
		case 2:
			skin_tip = 0;
			break;
	}
	
	#endregion
	#region Hand
	
	if handy > 0
		draw_sprite_ext(spr_skinchoicehand, 0, handx, handy + sin(current_time / 1000) * 4, 2, 2, 0, c_white, 1);
	draw_set_align();
	shader_reset();
	
	#endregion
}
handx = SCREEN_WIDTH / 2;
handy = -50;
sideoffset = 0;
skin_tip = 5;
