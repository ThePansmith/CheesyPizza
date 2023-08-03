if (to_peak)
	offset += spotlight_speed;
else
	offset -= spotlight_speed;


if (offset > spotlight_track_size)
{
	offset = spotlight_track_size;
	to_peak = false;
}
if (offset < 0)
{
	offset = 0;
	to_peak = true;
}