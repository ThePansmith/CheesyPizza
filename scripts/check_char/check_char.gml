function check_char(char)
{
	with obj_player1
	{
		if character == char or (char == "G" && isgustavo && REMIX)
			return true;
	}
	return false;
}
