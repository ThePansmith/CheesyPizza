scr_initinput();
depth = -7;
event_inherited();

if !global.Net_Paletted 
{
	paletteselect = 1;
	global.Net_Paletted = true;
}

bubble = undefined