function string_get_substring(_source, _startIndex, _length = -1)
{
	if ((!_length && _length != -1)|| string_is_empty_or_null(_source))
        return _source;
		
	return string_copy(_source, _startIndex, _length == -1 ? (string_length(_source) - _startIndex) + 1 : _length);
}