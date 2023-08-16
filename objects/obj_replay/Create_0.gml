record = false;
playback = false;
replay_file = STRING_UNDEFINED;

serialize_input = function()
{
	var tempValue = 0;
	

	tempValue |= (obj_player1.key_up ? 0b1 : 0b0) << 0;
	tempValue |= (obj_player1.key_up2 ? 0b1 : 0b0) << 1;
	tempValue |= (obj_player1.key_right ? 0b1 : 0b0) << 2;
	tempValue |= (obj_player1.key_right2  ? 0b1 : 0b0)  << 3;
	tempValue |= (obj_player1.key_left ? 0b1 : 0b0) << 4;
	tempValue |= (obj_player1.key_left2 ? 0b1 : 0b0) << 5;
	tempValue |= (obj_player1.key_down ? 0b1 : 0b0) << 6;
	tempValue |= (obj_player1.key_down2 ? 0b1 : 0b0) << 7;
	tempValue |= (obj_player1.key_jump ? 0b1 : 0b0) << 8;
	tempValue |= (obj_player1.key_jump2 ? 0b1 : 0b0) << 9;
	tempValue |= (obj_player1.key_slap ? 0b1 : 0b0) << 10;
	tempValue |= (obj_player1.key_slap2 ? 0b1 : 0b0) << 11;
	tempValue |= (obj_player1.key_taunt ? 0b1 : 0b0) << 12;
	tempValue |= (obj_player1.key_taunt2 ? 0b1 : 0b0) << 13;
	tempValue |= (obj_player1.key_attack ? 0b1 : 0b0) << 14;
	tempValue |= (obj_player1.key_attack2  ? 0b1 : 0b0)<< 15;
	tempValue |= (obj_player1.key_shoot ? 0b1 : 0b0) << 16;
	tempValue |= (obj_player1.key_shoot2 ? 0b1 : 0b0) << 17;
	tempValue |= (obj_player1.key_start ? 0b1 : 0b0) << 18;
	tempValue |= (obj_player1.key_escape  ? 0b1 : 0b0)<< 19;
	tempValue |= (obj_player1.key_chainsaw ? 0b1 : 0b0) << 20;
	tempValue |= (obj_player1.key_chainsaw2 ? 0b1 : 0b0) << 21;
	tempValue |= (obj_player1.stickpressed ? 0b1 : 0b0)<< 22;
	tempValue |= (obj_player1.stickpressed_horizontal ? 0b1 : 0b0) << 23;
	tempValue |= (obj_player1.stickpressed_vertical ? 0b1 : 0b0) << 24;
	
	return tempValue;
}
deserialize_input = function(value)
{
	var bit_index = 0;
	
	key_up = value & (0b1 << bit_index++);
	key_up2 = value & (0b1 << bit_index++); 
	key_right  = value & (0b1 << bit_index++);
	key_right2  = value & (0b1 << bit_index++);
	key_left  = value & (0b1 << bit_index++);
	key_left2  = value & (0b1 << bit_index++);
	key_down  = value & (0b1 << bit_index++);
	key_down2  = value & (0b1 << bit_index++);
	key_jump  = value & (0b1 << bit_index++);
	key_jump2  = value & (0b1 << bit_index++);
	key_slap  = value & (0b1 << bit_index++);
	key_slap2  = value & (0b1 << bit_index++);
	key_taunt = value & (0b1 << bit_index++);
	key_taunt2  = value & (0b1 << bit_index++);
	key_attack  = value & (0b1 << bit_index++);
	key_attack2   = value & (0b1 << bit_index++);
	key_shoot  = value & (0b1 << bit_index++);
	key_shoot2  = value & (0b1 << bit_index++);
	key_start  = value & (0b1 << bit_index++);
	key_escape   = value & (0b1 << bit_index++);
	key_chainsaw  = value & (0b1 << bit_index++);
	key_chainsaw2  = value & (0b1 << bit_index++);
	stickpressed  = value & (0b1 << bit_index++);
	stickpressed_horizontal = value & (0b1 << bit_index++);
	stickpressed_vertical  = value & (0b1 << bit_index++);
}