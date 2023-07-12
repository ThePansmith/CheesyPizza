if (global.panic && has_changed == 0)
{
	sprite_index = choose(spr_candle_lit, spr_candle_off);
	has_changed = true;
	ds_list_add(global.saveroom, id, sprite_index);
}
