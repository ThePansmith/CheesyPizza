function seq_afterimages_uppersnd()
{
	sound_play_centered_oneshot(sfx_uppercut);
}
function seq_afterimages_landsnd()
{
	sound_play_centered_oneshot(sfx_playerstep);
}
function seq_secretwall_sound()
{
	// very annoying actually so dont do that
	
	//if REMIX
	//	sound_play(global.snd_secretwall);
}
function seq_kungfu_sound()
{
	sound_play_centered_oneshot("event:/modded/sfx/kungfu");
}
function seq_grab_sound()
{
	sound_play_centered(sfx_suplexdash);
}
function seq_grab_stop()
{
	sound_stop(sfx_suplexdash, true);
}
function seq_punch_sound()
{
	sound_play_centered_oneshot(sfx_punch);
}
function seq_kill_sound()
{
	sound_play_centered_oneshot(sfx_killenemy);
}
function seq_killingblow_sound()
{
	sound_play_centered_oneshot(sfx_killingblow);
}
function seq_dive_sound()
{
	sound_play_centered_oneshot("event:/sfx/pep/dive");
}
function seq_step_sound()
{
	sound_play_centered_oneshot(sfx_playerstep);
}
