if (!obj_player1.isgustavo)
	sprite_index = spr_gustavosign;
else
{
	with (obj_gustavoswitch)
		sprite_index = spr_pepsign;
}
if obj_player1.character == "G"
	instance_destroy();
