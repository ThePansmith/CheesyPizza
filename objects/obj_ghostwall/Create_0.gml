with (instance_create(x, y, obj_ghosttransparency))
{
	mask_index = other.sprite_index;
	sprite_index = other.sprite_index;
	image_xscale = other.image_xscale;
}
away = false;
with obj_player1
	if character == "V" or character == "G" instance_destroy(other);
