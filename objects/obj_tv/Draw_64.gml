if (room == editor_room)
	exit;

var chara = obj_player1.character;
var sugary = chara == "SP";
var piss = chara == "PP";
var bo = chara == "BN";

draw_set_font(lang_get_font("bigfont"));
draw_set_halign(1);
draw_set_color(c_white);
draw_set_alpha(1);

if is_bossroom() or instance_exists(obj_tutorialbook)
	exit;

var collect_x = irandom_range(-collect_shake, collect_shake);
var collect_y = irandom_range(-collect_shake, collect_shake);

// sugary bobbing
if sugary
	collect_y += Wave(2, -2, 3, 0); // collect_y serves as an offset

// combo
if !sugary
{
	var _cx = tv_x + combo_posX;
	var _cy = tv_y + 117 + hud_posY + combo_posY;
	var _perc = global.combotime / 60;
	var _minX = _cx - 56;
	var _maxX = _cx + 59;
	if bo
	{
		combofill_x = lerp(combofill_x, _maxX + ((_minX - _maxX) * _perc), 0.5);
		combofill_y = _cy;
	}
	else
	{	
		combofill_x = lerp(combofill_x, _minX + ((_maxX - _minX) * _perc), 0.5);
		combofill_y = _cy;
	}
	
	var combobubblefill, combobubble, combofont;
	if piss
	{
		combobubblefill = spr_tv_combobubblefillPP;
		combobubble = spr_tv_combobubblePP;
		combofont = global.combofont2PP;
	}
	else if bo
	{
		combobubblefill = spr_tv_combobubblefillBN;
		combobubble = spr_tv_combobubbleBN;
		combofont = global.combofont2BN;
	}
	else
	{
		combobubblefill = spr_tv_combobubblefill;
		combobubble = spr_tv_combobubble;
		combofont = global.combofont2;
	}
	
	draw_sprite(combobubblefill, combofill_index, combofill_x, combofill_y);
	draw_sprite(combobubble, -1, _cx, _cy);
	draw_set_font(combofont);
	draw_set_align(0);
	
	var _tx = _cx - 64;
	var _ty = _cy - 12;
	if chara != "PP"
		_ty = _cy - 12;
	else // pissino
		_ty = _cy - 1;
	
	var _str = string(visualcombo);
	var num = string_length(_str);
	for (var i = num; i > 0; i--)
	{
		var char = string_char_at(_str, i);
		draw_text(_tx, _ty, char);
		_tx -= 22;
		_ty -= 8;
	}
}
else
{
	// sugary combo
	/*
	draw_set_font(global.combofontSP);
	draw_set_halign(1);
	draw_set_color(c_white);
	var _cx = 652;
	var _hy = 88 + combo_y + hand_y;
	var _gy = _hy + 6;
	_hy = clamp(_hy, 88, 142);
	
	if (!surface_exists(goo_surface))
	{
		goo_surface = surface_create(100, 180);
		surface_set_target(goo_surface);
		draw_clear_alpha(0, 0);
		surface_reset_target();
	}
	else
	{
		surface_set_target(goo_surface);
		draw_clear_alpha(0, 0);
		draw_sprite(spr_tv_combometergooSP, goo_index, -3, _hy + 6);
		gpu_set_blendmode(3);
		draw_sprite(spr_tv_combometercutSP, 0, 0, 0);
		gpu_set_blendmode(0);
		surface_reset_target();
		draw_surface(goo_surface, (_cx + combo_x) - 50, (88 + combo_y) - 91);
	}
	draw_sprite_ext(spr_tv_combobubbleSP, -1, _cx + combo_x, 88 + combo_y, 1, 1, 0, c_white, alpha);
	draw_sprite_ext(spr_tv_combometerhandSP, -1, _cx + hand_x, _hy, 1, 1, 0, c_white, alpha);
	var _ct = string(global.combo) + "x";
	draw_text(_cx + combo_x, combo_y, _ct);
	*/
	
	var _cx = tv_x + combo_posX - 170;
	var _cy = tv_y + 16 + hud_posY + combo_posY;
	var _hy = hand_y;
	
	var _perc = global.combotime / 60;
	if global.combo <= 0
	{
		hand_x = Approach(hand_x, 80, 8);
		hand_y = Approach(hand_y, -32, 8);
		_hy = 50;
	}
	else if _cy > -150
	{
		hand_x = lerp(hand_x, 0, 0.15);
		hand_y = lerp(hand_y, lerp(35, -30, _perc), 0.25);
	}
	
	if (!surface_exists(goo_surface))
	{
		goo_surface = surface_create(100, 180);
		surface_set_target(goo_surface);
		draw_clear_alpha(0, 0);
		surface_reset_target();
	}
	else
	{
		surface_set_target(goo_surface);
		draw_clear_alpha(0, 0);
		draw_sprite(spr_tv_combometergooSP, propeller_index, -3 + 50, _hy + 100);
		gpu_set_blendmode(3);
		draw_sprite(spr_tv_combometercutSP, 0, 50, 91);
		gpu_set_blendmode(0);
		surface_reset_target();
		draw_surface(goo_surface, _cx - 50, _cy - 91);
	}
	
	draw_sprite(spr_tv_combobubbleSP, -1, _cx, _cy);
	draw_sprite(spr_tv_combometerhandSP, -1, _cx + hand_x + 80, max(_cy, 60 + hud_posY) + min(hand_y, 20) + 24);
	
	draw_set_font(global.combofontSP);
	draw_set_align(fa_center);
	draw_set_color(c_white);
	draw_text(_cx, _cy - 90, string(visualcombo) + "x");
}

if (room != strongcold_endscreen)
{
	// background
	if REMIX or sugary
	{
		var bgindex = tv_bg_index, bgcol = c_white;
		if instance_exists(obj_ghostcollectibles)
			bgindex = 20;
		if obj_player1.state == states.secretenter && instance_exists(obj_fadeout)
			bgcol = merge_color(c_white, c_black, clamp(obj_fadeout.fadealpha, 0, 1));
	
		draw_sprite_ext(!sugary ? spr_tv_bgfinal_NEW : spr_tv_bgfinalSP, bgindex, tv_x + collect_x, tv_y + collect_y + hud_posY, 1, 1, 0, bgcol, alpha);
	}
	else
		draw_sprite_ext(spr_tv_bgfinal, tv_bg_index, tv_x + collect_x, tv_y + collect_y + hud_posY, 1, 1, 0, c_white, alpha);
	
	// player
	shader_set(global.Pal_Shader);
	pattern_set(global.Base_Pattern_Color, sprite_index, image_index, image_xscale, image_yscale, global.palettetexture);
	if (obj_player1.isgustavo)
		pal_swap_set(spr_ratmountpalette, gustavo_palette(obj_player1.paletteselect), false);
	else
		pal_swap_set(obj_player1.spr_palette, obj_player1.paletteselect, false);
	draw_sprite_ext(sprite_index, image_index, tv_x + collect_x, tv_y + collect_y + hud_posY, 1, 1, 0, c_white, alpha);
	
	// noise jetpack
	if (global.noisejetpack)
	{
		pal_swap_set(obj_player1.spr_palette, 2, false);
		draw_sprite_ext(sprite_index, image_index, tv_x + collect_x, tv_y + collect_y + hud_posY, 1, 1, 0, c_white, alpha);
	}
	pattern_reset();
	reset_shader_fix();
	
	// static
	if (state == states.tv_whitenoise)
	{
		var charspr = asset_get_index("spr_tv_whitenoise" + chara);
		trace(chara);
		draw_sprite(charspr > -1 ? charspr : spr_tv_whitenoise, tv_trans, tv_x + collect_x, tv_y + collect_y + hud_posY);
	}
	
	// propeller
	if sugary && targetspr != spr_tv_off && targetspr != spr_tv_open
	{
		propeller_index += 0.35;
		draw_sprite_ext(spr_pizzytvpropeller, propeller_index, tv_x + collect_x, tv_y + collect_y + hud_posY, 1, 1, 0, c_white, alpha);
	}
}

/*
if (bubblespr != -4)
	draw_sprite_ext(bubblespr, bubbleindex, SCREEN_WIDTH - 448, 53, 1, 1, 1, c_white, alpha);
if (!surface_exists(promptsurface))
	promptsurface = surface_create(290, 102);
surface_set_target(promptsurface);
draw_clear_alpha(0, 0);
draw_set_font(font1);
draw_set_halign(0);
draw_set_valign(1);
if (bubblespr == spr_tv_bubble)
{
	promptx -= promptspd;
	if (bubblespr != spr_tv_bubbleclose && promptx < (350 - string_width(prompt)))
	{
		bubblespr = spr_tv_bubbleclose;
		bubbleindex = 0;
	}
	draw_text_color(promptx - 350, 50, prompt, c_black, c_black, c_black, c_black, 1);
}
draw_set_halign(0);
surface_reset_target();
draw_surface(promptsurface, SCREEN_WIDTH - 610, 0);
draw_set_font(global.smallnumber_fnt);
draw_set_halign(1);
*/

if (global.panic)
{
	// smooth timer
	if global.fill < fill_lerp
		fill_lerp = global.fill;
	else
		fill_lerp = lerp(fill_lerp, global.fill, 0.25);
	
	// chunk timer
	var _fill = fill_lerp;
	var _currentbarpos = chunkmax - _fill;
	_perc = _currentbarpos / chunkmax;
	var _max_x = 299;
	var _barpos = _max_x * _perc;
	if (!surface_exists(bar_surface))
		bar_surface = surface_create(298, 30);
	var _barfillpos = floor(_barpos) + 13;
	if (_barfillpos > 0)
	{
		surface_resize(bar_surface, _barfillpos, 30);
		surface_set_target(bar_surface);
		draw_clear_alpha(0, 0);
		var clip_x = timer_x + 3;
		var clip_y = timer_y + 5;
		for (i = 0; i < 3; i++)
			draw_sprite(spr_timer_barfill, 0, barfill_x + (i * 173), 0);
		surface_reset_target();
		draw_surface(bar_surface, clip_x, clip_y);
	}
	draw_sprite(spr_timer_bar, -1, timer_x, timer_y);
	
	// john
	/*
	if (timer_x + 13 + _barpos < timer_x + 13)
		draw_sprite(spr_timer_johnface_sleep, sleepingjohnface_index, timer_x + 13, timer_y + 20);
	else*/
		draw_sprite(johnface_sprite, johnface_index, clamp(timer_x + 13 + _barpos, timer_x + 13, 9999999), timer_y + 20);
	
	// pizzaface
	var timerspr = pizzaface_sprite;
	if (timer_tower)
		timerspr = spr_timer_tower;
	draw_sprite(timerspr, pizzaface_index, timer_x + 320, timer_y + 10);
	
	// M:SS timer
	var minutes = 0;
	for (var seconds = ceil(_fill / 12); seconds > 59; seconds -= 60)
		minutes++;
	if (seconds < 10)
		seconds = concat("0", seconds);
	else
		seconds = string(seconds);
	draw_set_halign(1);
	draw_set_valign(1);
	draw_set_font(global.bigfont);
	draw_text(timer_x + 153, timer_y + 18, concat(minutes, ":", seconds));
	
	// lap display
	if global.lap > 0
	{
		if !instance_exists(obj_ghostcollectibles)
			lap_y = Approach(lap_y, timer_ystart, 1);
		else
			lap_y = Approach(lap_y, timer_ystart + 212, 4);
		
		if !instance_exists(obj_pizzaface) or showtime_buffer > 0
			lap_x = timer_x;
		else
			lap_x = Approach(lap_x, (SCREEN_WIDTH / 2) + 32, 1);
		
		scr_draw_lap_display(lap_x, lap_y, lapflag_index);
	}
}
else if (surface_exists(bar_surface))
	surface_free(bar_surface);

draw_set_align();
