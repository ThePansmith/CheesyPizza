image_speed = 0.35;
targetDoor = "A";
sound = "event:/sfx/pep/box";

if check_sugary()
	sprite_index = spr_pizzabox_ss;

bo = MIDWAY;
if bo
{
	sound = "event:/modded/sfx/boxBN";
	sprite_index = spr_boxofpizza_bo;
	image_index = 0;
	image_speed = 0;
}
