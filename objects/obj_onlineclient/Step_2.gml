/// @description Send Update Data

#region Game
buf_write_string("game"); // chunk header
buf_write_float(obj_pause.pause); // Gamestate

if !obj_pause.pause
{
	buf_write_float(global.panic);
	buf_write_string(room_get_name(room));
}
#endregion

#region Player Sync
if !obj_pause.pause
{
	buf_write_string("plyr"); // chunk header
	buf_write_float(obj_player1.x);
	buf_write_float(obj_player1.y);
	buf_write_string(sprite_get_name(obj_player1.sprite_index));
	buf_write_float(obj_player1.image_index);
	buf_write_float(obj_player1.xscale);
	buf_write_float(obj_player1.yscale);
	buf_write_float(obj_player1.state);
	buf_write_string(sprite_get_name(obj_player1.spr_palette));
	buf_write_float(obj_player1.paletteselect);

// todo: sync grabbed enemie

#endregion


#region Info
	buf_write_string("info"); // chunk header
	buf_write_string(player_name);
	buf_write_array(player_guid);
#endregion
}

// send data
#endregion
buffer_delete(write_buffer);
write_buffer = buffer_create(8, buffer_grow, 1);