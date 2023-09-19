function check_char(char)
{
	with obj_player1
	{
		if character == char or (char == "G" && isgustavo && REMIX)
			return true;
	}
	return false;
}
function check_sugarychar()
{
	with obj_player1
		return character == "SP" or character == "SN"
	return false;
}
