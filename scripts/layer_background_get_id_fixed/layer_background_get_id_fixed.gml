function layer_background_get_id_fixed(layer)
{
	var bwah = layer_background_get_id(layer);
	if bwah > -1
		return bwah;
	
	if layer_exists(layer)
	{
		var els = layer_get_all_elements(layer);
		for (var i = 0; i < array_length(els); i++)
		{
			var el = els[i];
			if layer_get_element_type(el) == layerelementtype_background
				return el;
		}
		return -1;
	}
	return -1;
}
