if (to_peak)
	offset += move_speed;
else
	offset -= move_speed;


if (offset > track_size)
{
	offset = track_size;
	to_peak = false;
}
if (offset < 0)
{
	offset = 0;
	to_peak = true;
}