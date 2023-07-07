if (other.key_up2 && other.grounded && other.vsp > 0 && func != -4)
{
	sound_play_oneshot_3d("event:/sfx/fakepep/step", x, y);
	func();
}
