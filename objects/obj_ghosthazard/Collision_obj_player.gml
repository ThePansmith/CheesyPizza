with (other)
{
	if (character == "V")
		scr_hurtplayer(id);
	else if (!isgustavo && state != states.ghost && state != states.ghostpossess && state != states.johnghost && state != states.actor && state != states.parry && state != states.gotoplayer)
	{
		scr_losepoints();
		create_transformation_tip(lang_get_value("ghosttip"), "ghost");
		fmod_event_one_shot("event:/sfx/pep/ghostintro");
		grav /= 2;
		state = states.ghost;
		movespeed = hsp;
		ghostdash = false;
		ghostpepper = 0;
		ghosttimer = 0;
		sprite_index = spr_ghostidle;
		
		var xscale = REMIX ? self.xscale : image_xscale;
		with (instance_create(x, y, obj_sausageman_dead))
		{
			hsp = xscale * 3;
			image_xscale = -xscale;
			sprite_index = other.spr_dead;
			spr_palette = other.spr_palette;
			paletteselect = other.paletteselect;
			oldpalettetexture = global.palettetexture;
		}
		
		other.debris = false;
	}
}
