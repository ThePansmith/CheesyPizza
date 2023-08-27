function enum_flag_set(value, flag)
{
	return value | flag;
}

function enum_flag_get(value, flag)
{
	return value & flag;
}

function enum_flag_clear(value, flag)
{
	return value & ~flag;
}
