if (finish)
{
	sound_play_oneshot("event:/sfx/misc/cardcollect");
	with (obj_camera)
		healthshaketime = 30;
	global.hats++;
	instance_destroy();
}
