if (follow == 1)
{
	x = obj_player1.x;
	y = obj_player1.y;
}
if REMIX
	visible = !obj_drawcontroller.use_dark or sprite_index == spr_parryeffect;
else
	visible = !obj_drawcontroller.use_dark or sprite_index != spr_deadjohnsmoke
