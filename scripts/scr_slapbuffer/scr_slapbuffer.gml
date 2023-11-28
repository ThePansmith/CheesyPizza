function scr_resetslapbuffer()
{
	input_buffer_slap = 0;
	input_buffer_grab = 0;
}

function scr_slapbuffercheck()
{
	return input_buffer_slap > 0 or input_buffer_grab > 0
}
