draw_set_alpha(1);
if (is_bossroom() || room == editor_room || instance_exists(obj_tutorialbook))
	exit;

var sugary = (obj_player1.character == "SP");
var piss = (obj_player1.character == "PP");
if (global.kungfu)
{
	if (global.hp == 8)
		draw_sprite(spr_pizzahealthbar, 0, 190, 70);
	else if (global.hp == 7)
		draw_sprite(spr_pizzahealthbar, 1, 190, 70);
	else if (global.hp == 6)
		draw_sprite(spr_pizzahealthbar, 2, 190, 70);
	else if (global.hp == 5)
		draw_sprite(spr_pizzahealthbar, 3, 190, 70);
	else if (global.hp == 4)
		draw_sprite(spr_pizzahealthbar, 4, 190, 70);
	else if (global.hp == 3)
		draw_sprite(spr_pizzahealthbar, 5, 190, 70);
	else if (global.hp == 2)
		draw_sprite(spr_pizzahealthbar, 6, 190, 70);
	else if (global.hp == 1)
		draw_sprite(spr_pizzahealthbar, 7, 190, 70);
	else if (global.hp == 0)
		draw_sprite(spr_pizzahealthbar, 8, 190, 70);
}
if (obj_player.state != states.dead)
{
	if (obj_player.x < 250 && obj_player.y < 169)
		hud_posY = Approach(hud_posY, -300, 15);
	else
		hud_posY = Approach(hud_posY, 0, 15);
	
	var cmb = 0;
	if (global.combo >= 50)
		cmb = 2;
	else if (global.combo >= 25)
		cmb = 1;
	
	if global.heatmeter && cmb < global.stylethreshold
		cmb = global.stylethreshold;
	
	pizzascore_index = (pizzascore_index + (0.25 * cmb)) % pizzascore_number;
	if (global.stylethreshold <= 0)
	{
		if (floor(pizzascore_index) != 0)
			pizzascore_index += 0.35;
		else
			pizzascore_index = 0;
	}
	
	var sw = sprite_get_width(spr_heatmeter_fill);
	var sh = sprite_get_height(spr_heatmeter_fill);
	var b = global.stylemultiplier;
	var hud_xx = 121 + irandom_range(-collect_shake, collect_shake);
	var hud_yy = 90 + irandom_range(-collect_shake, collect_shake) + hud_posY;
	
	// heat meter
	if global.heatmeter
	{
		shader_set(global.Pal_Shader);
		pal_swap_set(sugary ? spr_heatmeterSPpal : spr_heatmeter_palette, min(global.stylethreshold, 3) + (global.stylethreshold >= 3 && global.style >= 55), false);
		draw_sprite_part(sugary ? spr_heatmeter_fillSP : spr_heatmeter_fill, pizzascore_index, 0, 0, sw * b, sh, hud_xx - 95, hud_yy + 24);
		draw_sprite_ext(sugary ? spr_heatmeterSP : spr_heatmeter, pizzascore_index, hud_xx, hud_yy, 1, 1, 0, c_white, alpha);
		reset_shader_fix();
	}
	
	// score
	var pizzascorespr = spr_pizzascore
	if sugary
		pizzascorespr = spr_cakehud
	else if piss
		pizzascorespr = spr_pizzascorePP
	else
		pizzascorespr = spr_pizzascore
	draw_sprite_ext(pizzascorespr, pizzascore_index, hud_xx, hud_yy, 1, 1, 0, c_white, alpha);
	
	var peppersprite = spr_pizzascore_pepper
	var pepperonisprite = spr_pizzascore_pepperoni
	var olivesprite = spr_pizzascore_olive
	var shroomsprite = spr_pizzascore_shroom
	switch obj_player1.character
	{
		default:
			peppersprite = spr_pizzascore_pepper
			pepperonisprite = spr_pizzascore_pepperoni
			olivesprite = spr_pizzascore_olive
			shroomsprite = spr_pizzascore_shroom
			break;
		case "SP":
			peppersprite = spr_cakehud_crank
			pepperonisprite = spr_cakehud_brank
			olivesprite = spr_cakehud_arank
			shroomsprite = spr_cakehud_srank
			break;
		case "PP":
			peppersprite = spr_pizzascore_pepper
			pepperonisprite = spr_pizzascore_pepperoniPP
			olivesprite = spr_pizzascore_olivePP
			shroomsprite = spr_pizzascore_shroomPP
			break;
	}		
	var _score = global.collect;
	if (global.coop)
		_score += global.collectN;
	if (_score >= global.crank)
		draw_sprite_ext(peppersprite, pizzascore_index, hud_xx, hud_yy, 1, 1, 0, c_white, alpha);
	if (_score >= global.brank)
		draw_sprite_ext(pepperonisprite, pizzascore_index, hud_xx, hud_yy, 1, 1, 0, c_white, alpha);
	if (_score >= global.arank)
		draw_sprite_ext(olivesprite, pizzascore_index, hud_xx, hud_yy, 1, 1, 0, c_white, alpha);
	if (_score >= global.srank)
		draw_sprite_ext(shroomsprite, pizzascore_index, hud_xx, hud_yy, 1, 1, 0, c_white, alpha);
	
	var rx = hud_xx + 142;
	var ry = hud_yy - 22;
	var rank_ix = 0;
	if (_score >= global.srank && scr_is_p_rank())
		rank_ix = 5;
	else if (_score >= global.srank)
		rank_ix = 4;
	else if (_score >= global.arank)
		rank_ix = 3;
	else if (_score >= global.brank)
		rank_ix = 2;
	else if (_score >= global.crank)
		rank_ix = 1;
	if (previousrank != rank_ix)
	{
		var _snd = global.snd_rankup;
		previousrank = rank_ix;
		if (rank_ix < previousrank)
			_snd = global.snd_rankdown;
		fmod_event_instance_play(_snd);
		fmod_event_instance_set_parameter(_snd, "state", rank_ix - 1, true);
		rank_scale = 3;
	}
	rank_scale = Approach(rank_scale, 1, 0.2);
	var ranksprite = spr_ranks_hud
	if sugary
		ranksprite = spr_ranks_hudSP
	else if piss
		ranksprite = spr_ranks_hud
	else
		ranksprite = spr_ranks_hud
	draw_sprite_ext(ranksprite, rank_ix, rx, ry, rank_scale, rank_scale, 0, c_white, 1);
	var spr_w = sprite_get_width(spr_ranks_hudfill);
	var spr_h = sprite_get_height(spr_ranks_hudfill);
	var spr_xo = sprite_get_xoffset(spr_ranks_hudfill);
	var spr_yo = sprite_get_yoffset(spr_ranks_hudfill);
	var perc = 0;
	switch (rank_ix)
	{
		case 4:
			perc = 1;
			break;
		case 3:
			perc = (_score - global.arank) / (global.srank - global.arank);
			break;
		case 2:
			perc = (_score - global.brank) / (global.arank - global.brank);
			break;
		case 1:
			perc = (_score - global.crank) / (global.brank - global.crank);
			break;
		default:
			perc = _score / global.crank;
	}
	var t = spr_h * perc;
	var top = spr_h - t;
	draw_sprite_part(sugary ? spr_ranks_hudfillSP : spr_ranks_hudfill, rank_ix, 0, top, spr_w, spr_h - top, rx - spr_xo, (ry - spr_yo) + top);
	draw_set_valign(0);
	draw_set_halign(0);
	var collectfont = global.collectfont
	if sugary
		collectfont = global.collectfontSP 
	else if piss
		collectfont = global.collectfontPP
	else
		collectfont = global.collectfont
	draw_set_font(collectfont);
	var text_y = 0;
	switch (floor(pizzascore_index))
	{
		case 1:
		case 2:
		case 3:
			text_y = 1;
			break;
		case 5:
		case 10:
			text_y = -1;
			break;
		case 6:
		case 9:
			text_y = -2;
			break;
		case 7:
			text_y = -3;
			break;
		case 8:
			text_y = -5;
			break;
	}
	var cs = 0;
	with (obj_comboend)
		cs += comboscore;
	with (obj_particlesystem)
	{
		for (var i = 0; i < ds_list_size(global.collect_list); i++)
			cs += ds_list_find_value(global.collect_list, i).value;
	}
	var sc = _score - global.comboscore - cs;
	if (sc < 0)
		sc = 0;
	var str = string(sc);
	var num = string_length(str);
	var w = string_width(str);
	var xx = hud_xx - (w / 2);
	if (lastcollect != sc)
	{
		color_array = array_create(num, 0);
		for (i = 0; i < array_length(color_array); i++)
			color_array[i] = choose(irandom(3));
		lastcollect = sc;
	}
	shader_set(global.Pal_Shader);
	draw_set_alpha(alpha);
	for (i = 0; i < num; i++)
	{
		var yy = (((i + 1) % 2) == 0) ? -5 : 0;
		var c = color_array[i];
		pal_swap_set(spr_font_palette, c, false);
		draw_text(floor(xx), floor((hud_yy - 56) + text_y + yy), string_char_at(str, i + 1));
		xx += (w / num);
	}
	draw_set_alpha(1);
	reset_shader_fix();
	
	// bullets
	if global.shootstyle == 1
	{
		bulletimage += 0.35;
		
		var bx = hud_xx - 63, by = hud_yy - 16, bpad = 42;
	    var bspr = spr_peppinobullet_collectible;
		
		if global.doublegrab == 3
			bpad = 25;
		
	    if obj_player1.character == "N"
	    {
	        bx = hud_xx - 69;
	        by = hud_yy + 45;
	        bspr = spr_playerN_noisebomb;
	    }
		
		if global.heatmeter
			by += 32;
		
	    bx += bpad * max(ceil(global.bullet), 3);
	    for (var i = 0; i < max(global.bullet, 3); i++)
	    {
			var a = alpha, img = bulletimage, col = c_white;
			if i >= floor(global.bullet)
			{
				a = 0.25;
				img = 10;
				col = c_black;
			}
			
	        bx -= bpad;
	        draw_sprite_ext(bspr, img, bx, by, 1, 1, 0, col, a);
			if i == floor(global.bullet)
			{
				draw_set_flash();
				draw_sprite_part_ext(bspr, img, 0, 0, 64, 96 * (0.5 + frac(global.bullet) / 2), bx - 32, by, 1, 1, c_white, 0.75);
				draw_reset_flash();
			}
	    }
	}
	
	// chainsaw
	if global.doublegrab == 3
	{
		var bx = hud_xx - 63, by = hud_yy + 60, bpad = 25;
	    var bspr = spr_fuelHUD;
		
		if global.shootstyle != 1
		{
			bulletimage += 0.35;
			bpad = 42;
		}
		else
			bx += 100;
		
		if global.heatmeter
			by += 32;
		
	    bx += bpad * max(ceil(global.fuel), 3);
	    for (i = 0; i < max(global.fuel, 3); i++)
	    {
			var a = alpha, img = bulletimage, col = c_white;
			if i >= floor(global.fuel)
			{
				a = 0.25;
				img = 10;
				col = c_black;
			}
			
	        bx -= bpad;
	        draw_sprite_ext(bspr, img, bx, by, -1, 1, 0, col, a);
			
			if i == floor(global.fuel)
			{
				draw_set_flash();
				draw_sprite_part_ext(bspr, img, 0, 0, 40, 46 * frac(global.fuel), bx - 20, by - 23, 1, 1, c_white, 0.75);
				draw_reset_flash();
			}
	    }
	}
	
	draw_set_font(lang_get_font("bigfont"));
	draw_set_halign(1);
	draw_set_color(c_white);
	if (obj_player1.character == "V")
		draw_text(200 + healthshake, 125 + healthshake, global.playerhealth);
}
