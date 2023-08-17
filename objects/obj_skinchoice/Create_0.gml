event_inherited();
live_auto_call;

// animation
init = false;
charshift = [0, 0, 0];
player_surface = surface_create(256, 256);
pattern_surface = surface_create(32, 32);

// selection
noisetype = 0;
sel = {
	pal: 1,
	char: 0,
	mix: 0,
	side: 0
};
flashpal = [-1, 0];

characters = [
	["P", spr_player_idle, spr_peppalette, [1, 3]], // character, idle, palette sprite, [main color, mixing color]
	["N", spr_playerN_idle, spr_noisepalette, [1, 4]],
	["V", spr_playerV_idle, spr_vigipalette, [1, 6]],
	["G", spr_player_ratmountidle, spr_peppalette, [1, 3]],
	["SP", spr_playerSP_idle, spr_pizzypalette, [1, 3]],
	["BN", spr_playerBN_idle, spr_bopalette, [1, 3]],
	["PN", spr_playerPN_idle, spr_peppalette, [1, 3]]
];

if global.experimental
{
	array_push(characters, ["S", spr_snick_idle, spr_snickpalette, [1, 4]]);
	array_push(characters, ["SN", spr_pizzano_idle, spr_pizzanopalette, [1, 5]]);
}

// set in user event 0
palettes = [];
mixables = [];
unlockables = ["unfunny", "money", "sage", "blood", "tv", "dark", "shitty", "golden", "garish", "mooney", "funny", "itchy", "pizza", "stripes", "goldemanne", "bones", "pp", "war", "john"];

function add_palette(palette, entry, texture = noone, name = "PALETTE", description = "(No Description)", mix_prefix)
{
	// check if the palette was unlocked
	if array_get_index(unlockables, entry) != -1 && !global.sandbox
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
			sprite_index = spr_player_ratmountidle;
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
		handx = lerp(handx, 960 / 2, 0.15);
		handy = lerp(handy, -50, 0.15);
		var curve2 = animcurve_channel_evaluate(jumpcurve, 1 - anim_t);
		
		var pal = palettes[sel.pal];
		var charx = 960 / 5 + charshift[0] * 100, chary = 540 / 2 - 16 + charshift[1] * 100, scale = clamp(lerp(1, 2, curve), 1, 2);
		
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
	vertex_build_quad(vertex_buffer, 
		// RX: Where to draw the sprite on screen
		_x, _y, sprite_get_width(spr_skinchoicepalette), sprite_get_height(spr_skinchoicepalette),
		_color, _alpha,
		//RX: where to get the texture on the sheet
		uv_info.left, uv_info.top, (uv_info.right - uv_info.left), (uv_info.bottom - uv_info.top)
	);
}
draw_skin_pattern = function(_x, _y, _color, _alpha, _sprite, _subimage)
{
	var uvs = sprite_get_uvs(_sprite, _subimage);
	var uv_info = {
		left : uvs[0],
		top : uvs[1],
		right : uvs[2],
		bottom : uvs[3],
		left_trim : uvs[4],
		top_trim : uvs[5]
	}
	vertex_build_quad(vertex_buffer, 
		// RX: Where to draw the sprite on screen
		_x, _y, sprite_get_width(_sprite), sprite_get_height(_sprite),
		_color, _alpha,
		//RX: where to get the texture on the sheet
		uv_info.left, uv_info.top, (uv_info.right - uv_info.left), (uv_info.bottom - uv_info.top)
	);
}

draw = function(curve)
{
	// animation
	var curve2 = anim_t;
	var curv_prev = curve;
	if anim_con != 0
	{
		curve = 1; // actual animated curve
		curve2 = 1; // the timer
	}

	// drawer
	var pal = palettes[sel.pal];
	if anim_con != 2 or obj_player1.visible
	{
		var charx = 960 / 5 + charshift[0] * 75, chary = 540 / 2 - 16 + charshift[1] * 75;
		
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
		
		// character
		if !surface_exists(player_surface)
			player_surface = surface_create(256, 256);
			
		shader_reset();
		
		surface_set_target(player_surface);
		draw_clear_alpha(c_white, 0);
		
		shader_set(shd_pal_swapper);
		if pal.texture != noone
			pattern_set(global.Base_Pattern_Color, characters[sel.char][1], -1, 2, 2, pal.texture);	
		pal_swap_set(characters[sel.char][2], sel.mix > 0 ? mixables[sel.mix].palette : pal.palette, false);
		draw_sprite(characters[sel.char][1], -1, 128, 128);
		gpu_set_blendmode(bm_normal);
		pattern_reset();
		
		
		if (curv_prev < 1)
			shader_set_circleclip(960 / 2, 540 / 2, 560 * curv_prev);

		draw_surface_ext(player_surface, charx - 256, chary - 256, 2, 2, 0, c_white, curve * charshift[2]);
		surface_reset_target();
	}
	shader_reset();
	
	// text
	var name = string_upper(pal.name), desc = pal.description;
	if sel.mix > 0
	{
		name = string_upper(mixables[sel.mix].prefix + pal.name);
		desc = mixables[sel.mix].name + " + " + pal.name;
	}
	
	draw_set_font(lang_get_font("bigfont"));
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	var xx = 960 / 1.5 - string_width(name) / 2;
	for(var i = 1; i <= string_length(name); i++)
	{
		var char = string_char_at(name, i);
		
		var yy = 360;
		if curve2 != 1 // letters jump up
			yy = lerp(540, 360, min(animcurve_channel_evaluate(outback, curve2 + ((i % 3) * 0.075))));
			
		draw_text(xx + random_range(-1, 1), yy + random_range(-1, 1), char);
		xx += string_width(char);
	}
	
	draw_set_halign(fa_center);
	draw_set_alpha(curve);
	draw_set_font(global.font_small);
	draw_text_ext(960 / 1.5, 400, desc, 16, 600);
	draw_set_alpha(1);
	
	// palettes
	var palspr = characters[sel.char][2];
	var xx = 0, yy = 0;
	var array = !mixing ? palettes : mixables;
	vertex_begin(vertex_buffer, vertex_format);
	
	var cache = [];
	var fuckset = false;
	
	for(var i = 0; i < array_length(array); i++)
	{
		var xdraw = xx;
		var ydraw = yy;
		
		// move hand, and shake current selection
		if sel.side == 1 && ((!mixing && sel.pal == i) or (mixing && sel.mix == i)) && anim_con != 2
		{
			handx = lerp(handx, 8 + 408 + xx, 0.25);
			handy = lerp(handy, 70 + yy, 0.25);
			
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
			draw_skin_palette(2 + 408 + xdraw, 2 + 70 + ydraw, c_black, 0.25);
		
		if flashpal[0] == i // flashing palette. it only draws this once at a time do NOT FRET
		{
			draw_set_flash();
			draw_sprite_ext(spr_skinchoicepalette, 0, 408 + xdraw, 70 + ydraw, 1, 1, 0, c_white, 1);
			draw_reset_flash();
		}
		else if fuck >= 0 // special palettes
			array_push(cache, { x: 408 + xdraw, y: 70 + ydraw, pattern: spr_skinchoicecustom, subimage : fuck});
		else if mixing or array[i].texture == noone // palettes
			draw_skin_palette(408 + xdraw, 70 + ydraw, pal_swap_get_pal_color(palspr, array[i].palette, characters[sel.char][3][mixing]), 1);
		else // patterns, cached and drawn later
			array_push(cache, { x: 408 + xdraw, y: 70 + ydraw, pattern: array[i].texture, subimage : noone});
		
		// position next palette
		xx += 36;
		if i % 13 == 12
		{
			yy += 36;
			xx = 0;
		}
	}
	vertex_end(vertex_buffer);
	
	if curv_prev < 1
		shader_set_circleclip(960 / 2, 540 / 2, 560 * curv_prev);
	shader_reset();
	
	vertex_submit(vertex_buffer, pr_trianglelist, tex);
	
	// RX: not really a better way to do this without rewriting the entire thing
	for (var i = 0; i < array_length(cache); i++)
	{
		// RX: I fucking hate pizza tower
		if !surface_exists(pattern_surface)
			pattern_surface = surface_create(32, 32);
		surface_set_target(pattern_surface);
		
		shader_set(shd_pal_swapper);
		if cache[i].pattern != noone
		{
			if cache[i].subimage == noone
				pattern_set_temp(global.Base_Pattern_Color, spr_skinchoicepalette, 0, 1, 1, cache[i].pattern);
			else
				pattern_set_temp(global.Base_Pattern_Color, spr_skinchoicepalette, 0, 1, 1, cache[i].pattern, cache[i].subimage);
		}
		pal_swap_set(spr_skinchoicepal, 1);
		draw_sprite(spr_skinchoicepalette, 0, 0, 0);
		pattern_reset();
		shader_reset();
		surface_reset_target();
		
		// RX: it's super cool because the above uses a shader so we get to set the fucking clip shader AGAIN
		if curv_prev < 1
			shader_set_circleclip(960 / 2, 540 / 2, 560 * curv_prev);
			
		draw_surface(pattern_surface, cache[i].x, cache[i].y);

		draw_sprite_ext(spr_skinchoicepalette, 1, cache[i].x, cache[i].y, 1, 1, 0, c_white, 1);
	}
	shader_reset();
	// hand
	draw_sprite_ext(spr_skinchoicehand, 0, handx, handy + sin(current_time / 1000) * 4, 2, 2, 0, c_white, 1);
	draw_set_align();
	shader_reset();
}
handx = 960 / 2;
handy = -50;
