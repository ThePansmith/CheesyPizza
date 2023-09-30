function fmod_get_soundtest_events()
{
	
	var return_array = [];
	var event_count = fmod_bank_get_event_count(FMOD_BANK_MUSIC);
	
	fmod_suppress_errors(true);
	for (var i = 0; i < event_count; i++)
	{
		var event_path = fmod_bank_get_event_at_index(FMOD_BANK_MUSIC, i);
		
		var event_category = fmod_event_get_user_property(event_path, FMOD_PROP_CATEGORY);
		var event_name = fmod_event_get_user_property(event_path, FMOD_PROP_AUTHOR);
		
		if (event_name != STRING_UNDEFINED && event_category != STRING_UNDEFINED)
		{
			var push_struct = {
				event_path : event_path,
				event_category : event_category,
				event_name : event_name
			};
			
			array_push(return_array, push_struct);
			
			trace($"COMPATIBLE EVENT FOUND: {push_struct}");
		}
	}
	fmod_suppress_errors(false);
	return return_array;
}