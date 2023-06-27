if (obj_player1.sprite_index != obj_player1.spr_breakdance)
{
	create_particle(x, y, particle.genericpoofeffect);
	instance_destroy();
}
scr_collide();
fmod_event_instance_set_3d_attributes(snd, x, y);
