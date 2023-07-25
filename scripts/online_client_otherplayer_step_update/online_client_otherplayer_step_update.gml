function online_client_otherplayer_step_update(buffer, size)
{
	
	var guid = array_create(16, 0);
	
	for (var i = 0; i < 16; i++)
		guid[i] = buffer_read(buffer, buffer_u8);
		
	obj_otherplayer.x = buffer_read(buffer, buffer_f32);
	obj_otherplayer.y = buffer_read(buffer, buffer_f32);
	obj_otherplayer.image_index = buffer_read(buffer, buffer_f32);
	obj_otherplayer.sprite_index = asset_get_index(buffer_read(buffer, buffer_string));
	
	return true;
}