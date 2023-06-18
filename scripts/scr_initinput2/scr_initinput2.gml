function scr_initinput2()
{
	ini_open("saveData.ini");
	
	// VERY lazy to fix this - it's unused anyway.
	global.key_upN = ini_read_string("ControlsKeys2", "up", 87);
	global.key_rightN = ini_read_string("ControlsKeys2", "right", 68);
	global.key_leftN = ini_read_string("ControlsKeys2", "left", 65);
	global.key_downN = ini_read_string("ControlsKeys2", "down", 83);
	global.key_jumpN = ini_read_string("ControlsKeys2", "jump", 76);
	global.key_slapN = ini_read_string("ControlsKeys2", "slap", 75);
	global.key_tauntN = ini_read_string("ControlsKeys2", "taunt", 79);
	global.key_shootN = ini_read_string("ControlsKeys2", "shoot", 73);
	global.key_attackN = ini_read_string("ControlsKeys2", "attack", 74);
	global.key_startN = ini_read_string("ControlsKeys2", "start", 80);
	global.key_chainsawN = ini_read_string("ControlsKeys", "chainsaw", 77);
	
	global.key_upCN = ini_read_string("ControllerButton", "up", gp_padu);
	global.key_rightCN = ini_read_string("ControllerButton", "right", gp_padr);
	global.key_leftCN = ini_read_string("ControllerButton", "left", gp_padl);
	global.key_downCN = ini_read_string("ControllerButton", "down", gp_padd);
	global.key_jumpCN = ini_read_string("ControllerButton", "jump", gp_face1);
	global.key_slapCN = ini_read_string("ControllerButton", "slap", gp_face3);
	global.key_tauntCN = ini_read_string("ControllerButton", "taunt", gp_face4);
	global.key_shootCN = ini_read_string("ControllerButton", "shoot", gp_face2);
	global.key_attackCN = ini_read_string("ControllerButton", "attack", gp_shoulderr);
	global.key_startCN = ini_read_string("ControllerButton", "start", gp_start);
	global.key_chainsawCN = ini_read_string("ControlsKeys", "chainsaw", gp_shoulderl);
	
	ini_close();
}
