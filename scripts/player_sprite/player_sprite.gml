function player_sprite(player = obj_player1)
{
	if check_skin(SKIN.p_peter, player.character, player.paletteselect)
		return spr_player_petah;
	if check_skin(SKIN.n_chungus, player.character, player.paletteselect)
		return spr_playerN_chungus;
	if check_skin(SKIN.pn_homer, player.character, player.paletteselect)
		return spr_playerPN_homer;
	return player.sprite_index;
}
