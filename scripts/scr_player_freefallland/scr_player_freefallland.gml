function scr_player_freefallland()
{
	mach2 = 0;
	jumpAnim = true;
	dashAnim = true;
	landAnim = false;
	moveAnim = true;
	stopAnim = true;
	crouchslideAnim = true;
	crouchAnim = false;
	machhitAnim = false;
	movespeed = 0;
	facehurt = true;
	start_running = true;
	alarm[4] = 14;
	vsp = 0;
	hsp = 0;
	
	if key_jump && REMIX
	{
		state = states.jump;
        vsp = -13;
        jumpstop = true;
		scr_fmod_soundeffect(jumpsnd, x, y);
		
		if character == "P" && ispeppino
			sprite_index = spr_player_groundpoundjump;
		else
			sprite_index = spr_machfreefall;
		
		particle_set_scale(particle.highjumpcloud2, xscale, 1);
		create_particle(x, y, particle.highjumpcloud2, 0);
	}
	else if (floor(image_index) == (image_number - 1))
	{
		facehurt = true;
		sprite_index = spr_facehurtup;
		image_index = 0;
		state = states.normal;
		jumpstop = true;
	}
	image_speed = 0.35;
}
