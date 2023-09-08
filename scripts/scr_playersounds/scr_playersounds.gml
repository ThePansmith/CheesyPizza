function scr_playersounds()
{
	if (instance_exists(obj_pizzaface))
	{
		if (!fmod_event_instance_is_playing(global.snd_pizzafacemoving))
			fmod_event_instance_play(global.snd_pizzafacemoving);
		with (obj_pizzaface)
			sound_instance_move(global.snd_pizzafacemoving, x, y);
	}
	else
		fmod_event_instance_stop(global.snd_pizzafacemoving, true);
	if (state == states.actor && sprite_index == spr_firemouthend)
	{
		if (image_index > 8 && !fmod_event_instance_is_playing(burpsnd))
		{
			fmod_event_instance_play(burpsnd);
			sound_instance_move(burpsnd, x, y);
		}
	}
	if (state != states.tube && sprite_index != spr_knightpepstart && state != states.bombgrab && state != states.chainsaw && state != states.teleport && state != states.secretenter && state != states.door && state != states.victory && state != states.stunned && state != states.dead && state != states.fireass)
	{
		if (!scr_transformationcheck())
		{
			if (!transformationsnd)
			{
				transformationsnd = true;
				if (irandom(100) <= 70)
					fmod_event_instance_play(snd_voicetransfo);
				sound_play_oneshot_3d("event:/sfx/misc/transfo", x, y);
			}
		}
		else if (transformationsnd)
		{
			transformationsnd = false;
			if (irandom(100) <= 70)
				fmod_event_instance_play(snd_voiceouttransfo);
			sound_play_oneshot_3d("event:/sfx/misc/detransfo", x, y);
		}
	}
		
	sound_instance_move(snd_voiceouttransfo, x, y);
	sound_instance_move(snd_voicetransfo, x, y);
	sound_instance_move(snd_voiceok, x, y);
	sound_instance_move(snd_voicehurt, x, y);
	sound_instance_move(snd_uppercut, x, y);
	sound_instance_move(snd_dive, x, y);
	sound_instance_move(snd_crouchslide, x, y);
	sound_instance_move(rollgetupsnd, x, y);
	sound_instance_move(animatronicsnd, x, y);
	sound_instance_move(snd_dashpad, x, y);
	sound_instance_move(gallopingsnd, x, y);
		
	if (state == states.freefall || state == states.freefallprep || (state == states.superslam || (state == states.chainsaw && tauntstoredstate == states.superslam)))
	{
		if (!fmod_event_instance_is_playing(freefallsnd))
			fmod_event_instance_play(freefallsnd);
		fmod_event_instance_set_paused(freefallsnd, false);
		sound_instance_move(freefallsnd, x, y);
	}
	else
		fmod_event_instance_stop(freefallsnd, true);
		
	if (state == states.mach2 || state == states.mach3 || state == states.climbwall || state == states.rocket or (character == "S" && visible))
	{
		if sprite_index == spr_playerN_jetpackboost
		{
			fmod_event_instance_stop(machsnd, true);
				
			if !fmod_event_instance_is_playing(snd_jetpackloop)
				fmod_event_instance_play(snd_jetpackloop);
			sound_instance_move(snd_jetpackloop, x, y);	
		}
		else 
		{
			fmod_event_instance_stop(snd_jetpackloop, true);
				
			fmod_event_instance_set_paused(machsnd, false);
			if !fmod_event_instance_is_playing(machsnd)
				fmod_event_instance_play(machsnd);
				
			var s = 0;
			if (state == states.mach2 && sprite_index == spr_mach1 && grounded)
				s = global.machsnd ? 5 : 1;
			else if ((state == states.mach2 && sprite_index == spr_mach) || state == states.climbwall)
			or (sprite_index == spr_snick_mach2 && grounded)
				s = global.machsnd ? 6 : 2;
			else if (state == states.mach3 && sprite_index != spr_crazyrun)
			or (sprite_index == spr_snick_mach3 && grounded)
				s = global.machsnd ? 7 : 3;
			else if (sprite_index == spr_crazyrun)
				s = global.machsnd ? 7 : 4;
			if state == states.rocket
				s = 4;
				
			sound_instance_move(machsnd, x, y);
			fmod_event_instance_set_parameter(machsnd, "state", s, true);
		}
	}
	else
	{
		fmod_event_instance_stop(machsnd, true);
		fmod_event_instance_stop(snd_jetpackloop, true)
	}
		
	if ((state == states.knightpepslopes && grounded && vsp > 0) || state == states.grind || (state == states.trashroll && grounded && vsp > 0 && sprite_index == spr_player_trashslide))
	{
		if (!fmod_event_instance_is_playing(knightslidesnd))
			fmod_event_instance_play(knightslidesnd);
		sound_instance_move(knightslidesnd, x, y);
	}
	else if (fmod_event_instance_is_playing(knightslidesnd))
		fmod_event_instance_stop(knightslidesnd, true);
	if (state == states.Sjumpprep)
	{
		if (!fmod_event_instance_is_playing(superjumpsnd))
		{
			fmod_event_instance_set_parameter(superjumpsnd, "state", 0, true);
			fmod_event_instance_play(superjumpsnd);
		}
	}
	else if (state == states.Sjump)
		fmod_event_instance_set_parameter(superjumpsnd, "state", 1, true);
	else if (state != states.Sjump)
	{
		if (fmod_event_instance_is_playing(superjumpsnd) && fmod_event_instance_get_parameter(superjumpsnd, "state") < 1)
			fmod_event_instance_stop(superjumpsnd, true);
		else if (!fmod_event_instance_is_playing(superjumpsnd))
			fmod_event_instance_set_parameter(superjumpsnd, "state", 0, true);
	}
	if (sprite_index == spr_Sjumpcancelstart)
		fmod_event_instance_stop(superjumpsnd, true);
	if (fmod_event_instance_is_playing(superjumpsnd))
		sound_instance_move(superjumpsnd, x, y);
	if (sprite_index == spr_tumblestart || sprite_index == spr_tumble)
	&& (state == states.tumble or character != "S")
	{
		if (!fmod_event_instance_is_playing(tumblesnd))
		{
			fmod_event_instance_play(tumblesnd);
			fmod_event_instance_set_parameter(tumblesnd, "state", 0, true);
			if (sprite_index == spr_tumblestart)
				tumbleintro = true;
		}
		if (sprite_index == spr_tumble && !tumbleintro)
			fmod_event_instance_set_parameter(tumblesnd, "state", 1, true);
		sound_instance_move(tumblesnd, x, y);
	}
	else
	{
		if (fmod_event_instance_is_playing(tumblesnd))
		{
			fmod_event_instance_set_parameter(tumblesnd, "state", 2, true);
			sound_instance_move(tumblesnd, x, y);
		}
		tumbleintro = false;
	}
	if (sprite_index == spr_machroll || sprite_index == spr_backslide || sprite_index == spr_backslideland)
	{
		if (!fmod_event_instance_is_playing(machrollsnd))
			fmod_event_instance_play(machrollsnd);
		sound_instance_move(machrollsnd, x, y);
	}
	else
		fmod_event_instance_stop(machrollsnd, true);
	if (fmod_event_instance_is_playing(suplexdashsnd))
	{
		if (state != states.handstandjump && state != states.chainsawbump)
			fmod_event_instance_stop(suplexdashsnd, true);
		sound_instance_move(suplexdashsnd, x, y);
	}
	if (state == states.trashroll && sprite_index == spr_player_corpsesurf && grounded && vsp > 0)
	{
		if (!fmod_event_instance_is_playing(gravecorpsesnd))
			fmod_event_instance_play(gravecorpsesnd);
		sound_instance_move(gravecorpsesnd, x + hsp, y + vsp);
	}
	else
		fmod_event_instance_stop(gravecorpsesnd, true);
	if (state == states.barrelslide && grounded && vsp > 0)
	{
		if (!fmod_event_instance_is_playing(barrelslidesnd))
			fmod_event_instance_play(barrelslidesnd);
		sound_instance_move(barrelslidesnd, x + hsp, y + vsp);
	}
	else
		fmod_event_instance_stop(barrelslidesnd, true);
	if (state == states.slipnslide && sprite_index == spr_currentplayer)
	{
		if (!fmod_event_instance_is_playing(waterslidesnd))
			fmod_event_instance_play(waterslidesnd);
		sound_instance_move(waterslidesnd, x + hsp, y + vsp);
	}
	else
		fmod_event_instance_stop(waterslidesnd, true);
	if (state == states.stringfall)
	{
		if (!fmod_event_instance_is_playing(mrpinchsnd))
			fmod_event_instance_play(mrpinchsnd);
		fmod_event_instance_set_parameter(mrpinchsnd, "state", 0, true);
		sound_instance_move(mrpinchsnd, x + hsp, y + vsp);
	}
	else if (fmod_event_instance_is_playing(mrpinchsnd))
	{
		fmod_event_instance_set_parameter(mrpinchsnd, "state", 1, true);
		sound_instance_move(mrpinchsnd, x + hsp, y + vsp);
	}
	if (hamkuffID != noone && instance_exists(hamkuffID) && !launched)
	{
		if (!fmod_event_instance_is_playing(hamkuffsnd))
			fmod_event_instance_play(hamkuffsnd);
		if (launch)
			fmod_event_instance_set_parameter(hamkuffsnd, "state", 1, true);
		else
			fmod_event_instance_set_parameter(hamkuffsnd, "state", 0, true);
		sound_instance_move(hamkuffsnd, x + hsp, y + vsp);
	}
	else
	{
		if (fmod_event_instance_is_playing(hamkuffsnd))
		{
			fmod_event_instance_set_parameter(hamkuffsnd, "state", 2, true);
			sound_instance_move(hamkuffsnd, x + hsp, y + vsp);
		}
		hamkuffID = -4;
	}
	if ((state == states.ratmount || state == states.ratmountjump) && ratmount_movespeed >= 12 && (sprite_index == spr_ratmount_attack || sprite_index == spr_ratmount_mach3 || sprite_index == spr_ratmount_dashjump || sprite_index == spr_lonegustavodash || sprite_index == spr_lonegustavomach3 || sprite_index == spr_lonegustavodashjump))
	{
		if (!fmod_event_instance_is_playing(ratmountmachsnd))
			fmod_event_instance_play(ratmountmachsnd);
		s = 0;
		if (sprite_index == spr_ratmount_mach3 || sprite_index == spr_lonegustavomach3 || sprite_index == spr_ratmount_dashjump || sprite_index == spr_lonegustavodashjump)
			s = 1;
		fmod_event_instance_set_parameter(ratmountmachsnd, "state", s, true);
		if (grounded)
			fmod_event_instance_set_parameter(ratmountmachsnd, "ground", 1, true);
		else
			fmod_event_instance_set_parameter(ratmountmachsnd, "ground", 0, true);
		sound_instance_move(ratmountmachsnd, x + hsp, y + vsp);
	}
	else
		fmod_event_instance_stop(ratmountmachsnd, true);
	if (state == states.ratmountpunch)
	{
		if (!fmod_event_instance_is_playing(ratmountpunchsnd))
			fmod_event_instance_play(ratmountpunchsnd);
		sound_instance_move(ratmountpunchsnd, x + hsp, y + vsp);
	}
	else
		fmod_event_instance_stop(ratmountpunchsnd, true);
	if (state == states.ratmountbounce && sprite_index == spr_ratmount_walljump)
	{
		if (!fmod_event_instance_is_playing(ratmountgroundpoundsnd))
			fmod_event_instance_play(ratmountgroundpoundsnd);
		s = 0;
		if (instance_exists(superslameffectid))
			s = 1;
		fmod_event_instance_set_parameter(ratmountgroundpoundsnd, "state", s, true);
		sound_instance_move(ratmountgroundpoundsnd, x + hsp, y + vsp);
	}
	else
		fmod_event_instance_stop(ratmountgroundpoundsnd, true);
	if (state == states.animatronic)
	{
		if (!fmod_event_instance_is_playing(animatronicsnd))
			fmod_event_instance_play(animatronicsnd);
		sound_instance_move(animatronicsnd, x + hsp, y + vsp);
	}
	else
		fmod_event_instance_stop(animatronicsnd, true);
	if (instance_exists(obj_brickball))
	{
		if (!fmod_event_instance_is_playing(ratmountballsnd))
			fmod_event_instance_play(ratmountballsnd);
		sound_instance_move(ratmountballsnd, obj_brickball.x + obj_brickball.hsp, obj_brickball.y + obj_brickball.vsp);
	}
	else
		fmod_event_instance_stop(ratmountballsnd, true);
	if (instance_exists(obj_balloongrabbableeffect))
	{
		if (!fmod_event_instance_is_playing(ratdeflatesnd))
			fmod_event_instance_play(ratdeflatesnd);
		sound_instance_move(ratdeflatesnd, obj_balloongrabbableeffect.x, obj_balloongrabbableeffect.y);
	}
	else
		fmod_event_instance_stop(ratdeflatesnd, true);
	if (state == states.cheeseball && grounded && vsp > 0)
	{
		if (!fmod_event_instance_is_playing(cheeseballsnd))
			fmod_event_instance_play(cheeseballsnd);
		sound_instance_move(cheeseballsnd, x + hsp, y + vsp);
	}
	else
		fmod_event_instance_stop(cheeseballsnd, true);
	if (state == states.rideweenie && abs(hsp) > 8 && grounded)
	{
		if (!fmod_event_instance_is_playing(gallopingsnd))
			fmod_event_instance_play(gallopingsnd);
	}
	else if (fmod_event_instance_is_playing(gallopingsnd))
		fmod_event_instance_stop(gallopingsnd, true);
	if (state == states.boxxedpepspin)
	{
		if (!fmod_event_instance_is_playing(boxxedspinsnd))
			fmod_event_instance_play(boxxedspinsnd);
		sound_instance_move(boxxedspinsnd, x + hsp, y + vsp);
	}
	else
		fmod_event_instance_stop(boxxedspinsnd, true);
	if (fmod_event_instance_is_playing(pizzapeppersnd))
	{
		if (state == states.jetpackjump)
		{
			fmod_event_instance_set_parameter(pizzapeppersnd, "state", 0, true);
			sound_instance_move(pizzapeppersnd, x + hsp, y + vsp);
		}
		else
			fmod_event_instance_set_parameter(pizzapeppersnd, "state", 1, true);
	}
	if (state == states.ghost && sprite_index != spr_ghostidle)
	{
		if (!fmod_event_instance_is_playing(ghostspeedsnd))
			fmod_event_instance_play(ghostspeedsnd);
		s = 0;
		if (ghostpepper == 1)
			s = 1;
		else if (ghostpepper == 2)
			s = 2;
		else if (ghostpepper >= 3)
			s = 3;
		sound_instance_move(ghostspeedsnd, x, y);
		fmod_event_instance_set_parameter(ghostspeedsnd, "state", s, true);
	}
	else if (fmod_event_instance_is_playing(ghostspeedsnd))
		fmod_event_instance_stop(ghostspeedsnd, false);
		
	// pizzelle flipping
	if (sprite_index == spr_playerSP_mach2jump)
	{
		if !fmod_event_instance_is_playing(flippingsnd)
			fmod_event_instance_play(flippingsnd);
			
		fmod_event_instance_set_paused(flippingsnd, false);
		sound_instance_move(flippingsnd, x, y);
	}
	else
		fmod_event_instance_stop(flippingsnd, true);
}
