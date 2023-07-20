function string_is_number(str)
{
	if !string_length(str)
		return false;
	if is_real(str)
		return true;
	
	try {
		real(str);
	}
	catch(str) {
		return false;
	}
	return string(real(str)) == str;
}
function number_in_range(num, _min, _max)
{
	return _min <= num && num <= _max;
}
