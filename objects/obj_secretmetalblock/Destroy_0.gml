if !in_saveroom()
{
	trace("adding to save room!");
	repeat (8 * max(abs(image_xscale), abs(image_yscale)))
	{
		with (create_debris(x + random_range(0, sprite_width), y + random_range(0, sprite_height), particlespr))
		{
			hsp = random_range(-5, 5);
			vsp = random_range(-10, 10);
			image_index = random_range(0, image_number - 1);
			image_speed = 0;
		}
	}
	GamepadSetVibration(playerindex, 1, 1, 0.8);
	with (obj_camera)
	{
		shake_mag = 20;
		shake_mag_acc = 40 / room_speed;
	}
	sound_play_oneshot("event:/sfx/misc/breakmetal");
	add_saveroom();
}
scr_cutoff();
if (is_string(targettiles))
	scr_destroy_tiles(32, targettiles);
else
	scr_destroy_tile_arr(32, targettiles);
scr_destroy_nearby_tiles();
depth = 1;