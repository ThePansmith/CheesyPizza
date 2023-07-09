function replay_recordinput()
{
	var tempValue = 0;
	
	
	tempValue |= (key_up ? 0b1 : 0b0) << 0;
	tempValue |= (key_up2 ? 0b1 : 0b0) << 1;
	tempValue |= (key_right ? 0b1 : 0b0) << 2;
	tempValue |= (key_right2  ? 0b1 : 0b0)  << 3;
	tempValue |= (key_left ? 0b1 : 0b0) << 4;
	tempValue |= (key_left2 ? 0b1 : 0b0) << 5;
	tempValue |= (key_down ? 0b1 : 0b0) << 6;
	tempValue |= (key_down2 ? 0b1 : 0b0) << 7;
	tempValue |= (key_jump ? 0b1 : 0b0) << 8;
	tempValue |= (key_jump2 ? 0b1 : 0b0) << 9;
	tempValue |= (key_slap ? 0b1 : 0b0) << 10;
	tempValue |= (key_slap2 ? 0b1 : 0b0) << 11;
	tempValue |= (key_taunt ? 0b1 : 0b0) << 12;
	tempValue |= (key_taunt2 ? 0b1 : 0b0) << 13;
	tempValue |= (key_attack ? 0b1 : 0b0) << 14;
	tempValue |= (key_attack2  ? 0b1 : 0b0)<< 15;
	tempValue |= (key_shoot ? 0b1 : 0b0) << 16;
	tempValue |= (key_shoot2 ? 0b1 : 0b0) << 17;
	tempValue |= (key_start ? 0b1 : 0b0) << 18;
	tempValue |= (key_escape  ? 0b1 : 0b0)<< 19;
	tempValue |= (key_chainsaw ? 0b1 : 0b0) << 20;
	tempValue |= (key_chainsaw2 ? 0b1 : 0b0) << 21;
	tempValue |= (stickpressed ? 0b1 : 0b0)<< 22;
	tempValue |= (stickpressed_horizontal ? 0b1 : 0b0) << 23;
	tempValue |= (stickpressed_vertical ? 0b1 : 0b0) << 24;
	
	return tempValue;
}