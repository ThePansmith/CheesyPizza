if (!kick && countdown <= 0)
{
	other.vsp = -14;
	other.jumpstop = true;
	if (other.state == states.jump)
	{
		other.sprite_index = other.spr_stompprep;
		other.image_index = 0;
		other.jumpAnim = true;
	}
	countdown = 10;
	sound_play_3d("event:/sfx/enemies/stomp", x, y);
	create_particle(x, y, part.jumpdust, 0);
}
