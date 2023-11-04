if room == rm_editor
	exit;

if !in_saveroom()
{
	/*
	if (global.coop == 1)
	{
		obj_player1.x = x;
		obj_player2.x = x;
		obj_player1.y = y;
		obj_player2.y = y;
	}
	*/
	
	var combototal = 10 + floor(global.combo * 0.5);
	global.collect += combototal;
	global.comboscore += combototal;
	global.combo += 1;
	global.enemykilled += 1;
	global.combotime = 60;
	
	global.style += (5 + floor(global.combo / 5));
	global.heattime = 60;
	
	instance_create(x, y, obj_bangeffect);
	repeat 3
	{
		create_slapstar(x, y);
		create_baddiegibs(x, y);
	}
	
	with (instance_create(x, y, obj_sausageman_dead))
	{
		var debris = id;
		sprite_index = other.deadspr;
		if (room == tower_finalhallway)
			sprite_index = spr_protojohn;
	}
	sound_play_3d("event:/sfx/enemies/kill", x, y);
	add_saveroom();
	
	activate_panic(false, debris);
}
