#macro REPLAY_MAJOR_VERSION 1
#macro REPLAY_MINOR_VERSION 0
record = false;
playback = false;
playback_start_room = noone;
replay_file = STRING_UNDEFINED;
active = false;
replay_dictionary_pos = -1;
latest_input = 0;

enum game_controls
{
	none					= 0b00000000000000000000000000000000,
	key_up					= 0b10000000000000000000000000000000,
	key_up2					= 0b01000000000000000000000000000000,
	key_right				= 0b00100000000000000000000000000000,
	key_right2				= 0b00010000000000000000000000000000,
	key_left				= 0b00001000000000000000000000000000,
	key_left2				= 0b00000100000000000000000000000000,
	key_down				= 0b00000010000000000000000000000000,	
	key_down2				= 0b00000001000000000000000000000000,
	key_jump				= 0b00000000100000000000000000000000,
	key_jump2				= 0b00000000010000000000000000000000,
	key_slap				= 0b00000000001000000000000000000000,
	key_slap2				= 0b00000000000100000000000000000000,	
	key_taunt				= 0b00000000000010000000000000000000,
	key_taunt2				= 0b00000000000001000000000000000000,
	key_attack				= 0b00000000000000100000000000000000,
	key_attack2				= 0b00000000000000010000000000000000,
	key_shoot				= 0b00000000000000001000000000000000,
	key_shoot2				= 0b00000000000000000100000000000000,
	key_start				= 0b00000000000000000010000000000000,
	key_escape				= 0b00000000000000000001000000000000,
	key_chainsaw			= 0b00000000000000000000100000000000,
	key_chainsaw2			= 0b00000000000000000000010000000000,
	stickpressed			= 0b00000000000000000000001000000000,
	stickpressed_horizontal	= 0b00000000000000000000000100000000,
	stickpressed_vertical	= 0b00000000000000000000000010000000
};
	
serialize_input = function()
{
	var tempValue = int64(game_controls.none);
	
	// Direction
	if obj_player1.key_up
		tempValue |= game_controls.key_up;
	if obj_player1.key_up2
		tempValue |= game_controls.key_up2;
	if obj_player1.key_right
		tempValue |= game_controls.key_left;
	if obj_player1.key_right2
		tempValue |= game_controls.key_left2;
	if obj_player1.key_left
		tempValue |= game_controls.key_right;
	if obj_player1.key_left2
		tempValue |= game_controls.key_right2;
	if obj_player1.key_down
		tempValue |= game_controls.key_down2;
	if obj_player1.key_down2
		tempValue |= game_controls.key_down2;
		
	// Action
	if obj_player1.key_jump
		tempValue |= game_controls.key_jump;
	if obj_player1.key_jump2
		tempValue |= game_controls.key_jump2;
	if obj_player1.key_slap
		tempValue |= game_controls.key_slap;
	if obj_player1.key_slap2
		tempValue |= game_controls.key_slap2;
	if obj_player1.key_taunt
		tempValue |= game_controls.key_taunt;
	if obj_player1.key_taunt2
		tempValue |= game_controls.key_taunt2;
	if obj_player1.key_attack
		tempValue |= game_controls.key_attack;
	if obj_player1.key_attack2
		tempValue |= game_controls.key_attack2;
	if obj_player1.key_shoot
		tempValue |= game_controls.key_shoot;
	if obj_player1.key_shoot2
		tempValue |= game_controls.key_shoot2;
	if obj_player1.key_chainsaw
		tempValue |= game_controls.key_chainsaw;
	if obj_player1.key_chainsaw2
		tempValue |= game_controls.key_chainsaw2;
		
	// Menu
	if obj_player1.key_start
		tempValue |= game_controls.key_start;
	if obj_player1.key_escape
		tempValue |= game_controls.key_escape;
	
	// Joystick
	if obj_player1.stickpressed
		tempValue |= game_controls.stickpressed;
	if obj_player1.stickpressed_horizontal
		tempValue |= game_controls.stickpressed_horizontal;
	if obj_player1.stickpressed_vertical
		tempValue |= game_controls.stickpressed_vertical;
	
	trace($"writing {tempValue}");
		
	return tempValue;
}

deserialize_input = function(value)
{
	value = int64(value);
	obj_player1.key_up				    = (value & game_controls.key_up) != 0;
	obj_player1.key_up2				    = (value & game_controls.key_up2) != 0; 
	obj_player1.key_right			    = (value & game_controls.key_right) != 0;
	obj_player1.key_right2			    = (value & game_controls.key_right2) != 0;
	obj_player1.key_left			    = (value & game_controls.key_left) != 0;
	obj_player1.key_left2			    = (value & game_controls.key_left2) != 0;
	obj_player1.key_down			    = (value & game_controls.key_down) != 0;
	obj_player1.key_down2			    = (value & game_controls.key_down2) != 0;
	obj_player1.key_jump			    = (value & game_controls.key_jump) != 0;
	obj_player1.key_jump2			    = (value & game_controls.key_jump2) != 0;
	obj_player1.key_slap			    = (value & game_controls.key_slap) != 0;
	obj_player1.key_slap2			    = (value & game_controls.key_slap2) != 0;
	obj_player1.key_taunt			    = (value & game_controls.key_taunt) != 0;
	obj_player1.key_taunt2			    = (value & game_controls.key_taunt2) != 0;
	obj_player1.key_attack			    = (value & game_controls.key_attack) != 0;
	obj_player1.key_attack2			    = (value & game_controls.key_attack2) != 0;
	obj_player1.key_shoot			    = (value & game_controls.key_shoot) != 0;
	obj_player1.key_shoot2			    = (value & game_controls.key_shoot2) != 0;
    // skip 2									 
	obj_player1.key_chainsaw            = (value & game_controls.key_chainsaw) != 0;
	obj_player1.key_chainsaw2           = (value & game_controls.key_chainsaw2) != 0;
	obj_player1.stickpressed            = (value & game_controls.stickpressed) != 0;
	obj_player1.stickpressed_horizontal = (value & game_controls.stickpressed_horizontal) != 0;
	obj_player1.stickpressed_vertical   = (value & game_controls.stickpressed_vertical) != 0;
}

write_meta_data = function()
{
	// RX: Loy write your shit here that is important and needs to be saved for each replay
	// things such as key config, and shit, I'll leave that to you
	
}