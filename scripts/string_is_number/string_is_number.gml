function string_is_number(str)
{
	if str == ""
		return false;
	if is_real(str)
		return true;
	
	//return string_length(string_digits(str)) + string_count("-", str) + string_count(".", str) == string_length(str);
	
	try {
		real(str);
	}
	catch(str) {
		return false;
	}
	return true;
}
function number_in_range(num, a, b)
{
	if num >= a && num <= b
		return true;
	return false;
}
