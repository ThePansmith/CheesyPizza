function string_is_empty_or_null(value)
{
	if (!is_string(value))
		return true;
		
	return string_length(value) == 0;
}