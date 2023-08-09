with (other)
{
	if character == "P"
	{
		character = "N";
		noisetype = 1;
	}
	else
		character = "P";
	respawn = 200;
	scr_characterspr();
	instance_destroy(other);
}
