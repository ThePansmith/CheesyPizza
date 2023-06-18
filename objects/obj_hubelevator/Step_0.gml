if state == 1
{
	anim_t = Approach(anim_t, 1, 0.1);
	
	if obj_player1.state != states.normal && obj_player1.state != states.ratmount
	{
		state = 3;
		close_menu();
	}
	else
	{
		open_menu();
		scr_getinput(true);
		
		var move = -key_up2 + key_down2;
		if move != 0
		{
			var selprev = sel;
			sel = clamp(sel + move, 0, array_length(hub_array) - 1);
			
			if sel != selprev
				sound_play_centered(sfx_step);
		}
		
		if key_jump
		{
			sound_play_3d(sfx_keyunlock, x, y);
			
			state = 2;
			close_menu();
		}
		else if key_slap2 or keyboard_check_pressed(vk_escape)
		{
			sound_play_centered(sfx_enemyprojectile);
			state = 3;
			
			close_menu();
		}
	}
}

if state == 2
{
	obj_player1.targetRoom = hub_array[sel][1];
	obj_player1.targetDoor = hub_array[sel][2];
	
	if obj_player1.targetRoom != room
	{
		sound_play_3d("event:/sfx/misc/elevatorstart", x, y);
		
		state = 3;
		sound_play(sfx_door);
		
		obj_camera.chargecamera = 0;
		with obj_player1
		{
			lastroom = room;
			sprite_index = spr_lookdoor;
			if isgustavo
				sprite_index = spr_ratmount_enterdoor;
			image_index = 0;
			state = states.door;
			mach2 = 0;
			
			if REMIX
			{
				smoothx = x - (other.x + 50);
				x = other.x + 50;
			}
		}
		instance_create(x, y, obj_fadeout);
	}
	else
	{
		state = 0;
		if obj_player1.isgustavo
			obj_player1.state = states.ratmount;
		else
			obj_player1.state = states.normal;
	}
}

if state == 3
{
	anim_t = Approach(anim_t, 0, 0.2);
	if anim_t <= 0
		state = 0;
}
