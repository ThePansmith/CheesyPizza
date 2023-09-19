function check_sugary(pure = false)
{
	if pure return SUGARY;
	return SUGARY or (global.sugaryoverride && check_sugarychar());
}
