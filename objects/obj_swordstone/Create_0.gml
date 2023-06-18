image_index = 0.35;
if (room == rm_editor)
{
	if (place_meeting(x, y + 32, obj_solid))
	{
		while (!place_meeting(x, y + 1, obj_solid))
			y += 1;
	}
}
if (room == rm_editor)
	exit;
skip = false;
with obj_player1
{
	if character == "V" or isgustavo
		other.skip = true;
}
if !skip
{
	with (instance_create(x, y - 20, obj_grabmarker))
	{
		ID = other.id;
		other.ID = id;
	}
}
depth = 10;
