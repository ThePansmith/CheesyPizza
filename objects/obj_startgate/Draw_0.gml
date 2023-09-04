draw_set_color(c_white);

draw_self_safe();
if sprite_index != spr_snickchallengecomputer
{
	draw_sprite_safe(sprite_index, 1, x, y);
	scr_hub_bg_draw(x, y, sprite_index, 1);
}

if (SUGARY)
{
	if showtext
	{
		draw_set_font(global.smallfont_ss);
		draw_set_halign(fa_center);
		draw_set_color(c_white);
		if (laps == 0 && highscore == 0)
			laps = -1;
		draw_text(x - 1, (y - 108), string(highscore) + " POINTS - " + string(laps + 1) + " LAPS");
		draw_text(x, (y - 134), secret_count + " OF 3 SECRETS");	
		
		for (var i = 0; i < 5; ++i) 
		{
			var x_pos = -100 + (50 * i);
			var collected = toppin[i];
			if !collected 
				draw_sprite_ext(confecti_sprs[i].sprite, confecti_sprs[i].image, x + x_pos, y - 183, 1, 1, 0, c_black, 1);
			else
				draw_sprite_ext(confecti_sprs[i].sprite, confecti_sprs[i].image, x + x_pos, y - 183, 1, 1, 0, c_white, 1);
		}
		var _rankspr = 6;
		switch (rank)
		{
			case "p": _rankspr = 5; break;
			case "s": _rankspr = 4; break;
			case "a": _rankspr = 3; break;
			case "b": _rankspr = 2; break;
			case "c": _rankspr = 1; break;
			case "d": _rankspr = 0; break;
			default: _rankspr = 6; break;
		}
		if (rank == "d" && highscore == 0)
			_rankspr = 6;
		var _deathspr = -1;
		
		if death_rank != ""
		{
			switch death_rank
			{
				case "p": _deathspr = 5; break;
				case "s": _deathspr = 4; break;
				case "a": _deathspr = 3; break;
				case "b": _deathspr = 2; break;
				case "c": _deathspr = 1; break;
				case "d": _deathspr = 0; break;
				default: _deathspr = 6; break;
			}
		}
		if _deathspr != -1
		{
			var offset = (sprite_get_width(spr_ranks_hudSP) + sprite_get_width(spr_ranks_deathss)) / 4;
			
			draw_sprite_ext(spr_ranks_hudSP, _rankspr, x - offset, y - 43, 1, 1, 0, c_white, 1);
			draw_sprite_ext(spr_ranks_deathss, _deathspr, x + offset, y - 43, 1, 1, 0, c_white, 1);
		}
		else
			draw_sprite_ext(spr_ranks_hudSP, _rankspr, x, y - 43, 1, 1, 0, c_white, 1);
		
	}
}
