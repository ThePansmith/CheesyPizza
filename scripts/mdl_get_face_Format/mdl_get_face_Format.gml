enum rx_obj_faceformat
{
	invalid,
	vertex,
	vertex_texture,
	vertex_normal,
	vertex_texture_normal
}

function mdl_get_face_Format(faceString)
{
	if (!is_string(faceString))
		return rx_obj_faceformat.invalid;
		
	var terms = string_split(faceString, " ", true);
	
	if (array_length(terms) <= 0)
		return rx_obj_faceformat.invalid;
		
	var firstTerm = terms[0];
	
	if (firstTerm == "f")
	{
		if (array_length(terms) <= 1)
			return rx_obj_faceformat.invalid;
		
		firstTerm = terms[1];
	}
	var firstIndex = string_pos(@"/", firstTerm);
	var lastIndex = string_last_pos(@"/", firstTerm);
	
	if (!firstIndex)
		return rx_obj_faceformat.vertex;
	
	if (firstIndex == lastIndex)
		return rx_obj_faceformat.vertex_texture;
	if (firstIndex + 1 == lastIndex)
		return rx_obj_faceformat.vertex_normal;
	
	
	return rx_obj_faceformat.vertex_texture_normal;
}