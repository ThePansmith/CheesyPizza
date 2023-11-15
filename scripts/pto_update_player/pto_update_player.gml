function pto_reset()
{
	pto_update_player.paletteselect = 0;
	pto_update_player.palettetexture = noone;
	pto_update_player.panic = 0;
	pto_update_player.current_room = "";
	pto_update_player.yscale = 1;
	
	pto_update.busy = 0;
}
function pto_update()
{
	static busy = 0;
	static timeout = 0;
	
	// busy
	var dbusy = 0;
	if obj_pause.pause dbusy = 1;
	//if chat_open dbusy = 2;
	if global.in_menu dbusy = 3;
	
	if busy != dbusy or timeout >= room_speed * 5
	{
		busy = dbusy;
		timeout = 0;
		
		var packeter = new Packeter(EventType.Variable);
		packeter.Write(buffer_u8, Var.Busy);
		packeter.Write(buffer_u8, busy);
		packeter.Send();
	}
}
function pto_update_player()
{
	static paletteselect = 0;
	static palettetexture = noone;
	static panic = 0;
	static current_room = "";
	static yscale = 1;
	
	// room
	var droom = room_get_name(room);
	if droom != current_room
	{
		current_room = droom;
		
		var packeter = new Packeter(EventType.Variable);
		packeter.Write(buffer_u8, Var.Room);
		packeter.Write(buffer_text, current_room);
		packeter.Send();
	}
	
	// palettes
	if self.paletteselect != paletteselect
	or global.palettetexture != palettetexture
	{
		paletteselect = self.paletteselect;
		palettetexture = global.palettetexture;
		
		var pat = sprite_get_name(palettetexture);
		pat = string_replace(pat, "spr_peppattern", "");
		pat = string_replace(pat, "spr_pattern_", "");
		
		var packeter = new Packeter(EventType.Variable);
		packeter.Write(buffer_u8, Var.Palette);
		packeter.Write(buffer_u8, paletteselect);
		packeter.Write(buffer_text, pat);
		packeter.Send();
	}
	
	// timers
	var dpanic = 0;
	if global.panic dpanic = 1;
	if global.snickchallenge dpanic = 2;
	
	if panic != dpanic
	{
		panic = dpanic;
		
		var packeter = new Packeter(EventType.Variable);
		packeter.Write(buffer_u8, Var.Panic);
		packeter.Write(buffer_u8, dpanic);
		packeter.Write(buffer_u16, global.fill);
		packeter.Send();
	}
	
	// yscale
	if (self.yscale >= 0) != yscale
	{
		yscale = self.yscale >= 0;
		
		var packeter = new Packeter(EventType.Variable);
		packeter.Write(buffer_u8, Var.YScale);
		packeter.Write(buffer_bool, yscale);
		packeter.Send();
	}
	
	// optimized sprite
	var spr = chr(0);
	if visible
	{
		spr = sprite_get_name(sprite_index);
		spr = string_replace(spr, "spr_player_ratmount", "ratmount");
	
		spr = string_replace(spr, "spr_", "");
		spr = string_replace(spr, "player_", "P_");
		spr = string_replace(spr, "player", "");
	
		spr = string_replace(spr, "snick_", "S_");
		spr = string_replace(spr, "pizzano", "SN_");
	
		spr = string_replace(spr, "knightpep_", "kn");
		spr = string_replace(spr, "bombpep_", "bo");
		spr = string_replace(spr, "shotgun_", "sh");
		spr = string_replace(spr, "boxxedpep_", "bx");
		spr = string_replace(spr, "cheesepep_", "ch");
	}
	
	// SEND
	var packeter = new Packeter(EventType.Update);
	packeter.Write(buffer_f32, x);
	packeter.Write(buffer_f32, y);
	packeter.Write(buffer_f32, image_index);
	packeter.Write(buffer_u16, state);
	packeter.Write(buffer_bool, xscale >= 0 ? 1 : 0);
	packeter.Write(buffer_text, spr);
	packeter.Send();
	
	pto_update.timeout = 0;
}
