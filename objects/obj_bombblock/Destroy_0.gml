if !in_saveroom()
{
	repeat (4)
		create_debris(x + 32, y + 32, spr_bombdebris);
	add_saveroom();
}
