image_speed = 0.35;
targetDoor = "A";

if check_sugary()
	sprite_index = spr_pizzabox_ss;

bo = check_midway();
if bo
{
	sprite_index = spr_boxofpizza_bo;
	image_index = 0;
	image_speed = 0;
}
