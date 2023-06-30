if room == editor_room
	exit;

var player = (obj_player1.spotlight == 1) ? obj_player1 : obj_player2;
if !instance_exists(obj_pizzaball)
	targetgolf = -4;

// shaking when collect get
if collect_shake > 0
	collect_shake *= 0.5;

// shake health count
if healthshaketime > 0
{
	healthshaketime--;
	healthshake = random_range(-2, 2);
}
else
	healthshake = 0;

var hp = obj_player1.character == "V" ? global.playerhealth : global.hp;
if healthold != hp
{
	playerhealthup = healthold < hp;
	healthshaketime = 30;
	healthold = hp;
}

// coop player distance (isn't this useless code???)
if global.coop
{
	var p1 = player;
	var p2 = (obj_player1.spotlight == 1) ? obj_player2: obj_player1;
	p2pdistance = point_distance(p1.x, 0, p2.x, 0);
	p2pdistancex = ((p1.x >= p2.x) ? -p2pdistance : p2pdistance) / 5;
}
else
	p2pdistancex = 0;

// visibility
visible = true;
if room == strongcold_endscreen or room == Longintro or room == Mainmenu or room == rm_levelselect or room == rank_room or room == timesuproom or room == Realtitlescreen or room == characterselect or room == tower_extra or room == rm_baby or room == tower_baby or room == hub_loadingscreen or (string_copy(room_get_name(room), 1, 5) == "tower" && !global.panic)
	visible = false;
if !global.option_hud
	visible = false;
if instance_exists(obj_endlevelfade)
	visible = false;

// combo ending
if global.combo > 0
{
	comboend = true;
	
	var ct = global.combotime;
	if ct <= 40
	{
		if alarm[5] == -1
		{
			if ct >= 20
				alarm[5] = 12;
			else
				alarm[5] = 5;
		}
	}
	else
		combobubblevisible = true;
}
else if comboend
{
	comboend = false;
	event_perform(2, 4);
}

// shoving leftover
if floor(image_index) == 10
	shoving = false;
if shoving && image_index >= 3 && !bang
{
	with instance_create(x, y, obj_fallingHUDface)
	{
		if (obj_player1.spotlight == 0 && obj_player1.character == "P") or (obj_player1.spotlight == 1 && obj_player2.character == "P")
		{
			sprite = spr_pepinoHUDscream;
			hsp = random_range(-1, -5);
		}
		else
		{
			sprite = spr_noiseHUD_panic;
			hsp = random_range(1, 5);
		}
	}
	bang = true;
}
if !shoving
	bang = false;

// old timer
if global.seconds <= 0 && global.minutes <= 0 && ded == 0
{
	alarm[1] = -1;
	if global.miniboss or instance_exists(obj_toppinwarrior)
		alarm[2] = 1;
	else
		alarm[3] = 1;
	ded = true;
}
if global.seconds > 59
{
	global.minutes += 1;
	global.seconds -= 59;
}

// timed gate
if global.timedgatetimer
{
	if (global.timedgatetime > 0)
		global.timedgatetime--;
	else
	{
		global.timedgatetime = 0;
		global.timedgatetimer = false;
	}
}

// panic screen shake
if !instance_exists(obj_ghostcollectibles) && !REMIX
{
	if ((global.panic == true && global.minutes < 1) or player.sprite_index == player.spr_Timesup)
	{
		shake_mag = 2;
		shake_mag_acc = 3 / room_speed;
	}
	else if (global.panic == true && basement == 0)
	{
		shake_mag = 2;
		shake_mag_acc = 3 / room_speed;
	}
}

// screen shake handle
if shake_mag > 0
{
	shake_mag -= shake_mag_acc;
	if shake_mag < 0
		shake_mag = 0;
}

detachedby = -1;
detach = false;
follow_golf = false;

if instance_exists(player) && !lock && player.state != states.timesup && player.state != states.dead
{
	switch (state)
	{
		case states.normal:
			var target = player;
			var tx = target.x;
			var ty = target.y;
			if REMIX && target.object_index == obj_player1
				tx += target.smoothx;
			
			if target.state == states.backtohub
				ty = target.backtohubstarty;
			
			// charge cameras
			if target.state != states.backbreaker && (target.state != states.chainsaw or !REMIX)
			{
				if target.cutscene or target.collision_flags & colflag.secret > 0
				{
					if player.state == states.actor && room == tower_pizzafacehall
						chargecamera = Approach(chargecamera, 150, 8);
					else
						chargecamera = Approach(chargecamera, 0, 10);
				}
				else if target.state == states.mach2 or target.state == states.mach3
				{
					var _targetcharge = target.xscale * ((target.movespeed / 4) * 50);
					var _tspeed = 0.3;
					if target.xscale != sign(chargecamera) && REMIX
						_tspeed = 4;
					chargecamera = Approach(chargecamera, _targetcharge, _tspeed);
				}
				else if target.ratmount_movespeed > 2 && target.key_attack && (target.state == states.ratmount or target.state == states.ratmountjump)
				{
					_targetcharge = target.xscale * ((abs(target.hsp) / 4) * 70);
					_tspeed = 0.3;
					if target.xscale != sign(chargecamera) && REMIX
						_tspeed = 4;
					chargecamera = Approach(chargecamera, _targetcharge, _tspeed);
				}
				else if (abs(target.hsp) >= 16 or (target.state == states.chainsaw && target.tauntstoredmovespeed >= 16)) && player.state != states.climbwall && player.state != states.Sjump
				{
					_targetcharge = target.xscale * ((abs(target.hsp) / 4) * 50);
					_tspeed = 2;
					if (_targetcharge > 0 && chargecamera < 0) or (_targetcharge < 0 && chargecamera > 0)
						_tspeed = 8;
					chargecamera = Approach(chargecamera, _targetcharge, _tspeed);
				}
				else if target.state == states.machslide
					chargecamera = Approach(chargecamera, 0, 10);
				else
					chargecamera = Approach(chargecamera, 0, 6);
			}
			
			// remix specific
			if REMIX
			{
				// clamp chargecamera
				chargecamera = clamp(chargecamera, -320, 320);
				
				// crouch camera
				if ((player.state == states.crouch or (player.character == "S" && player.state == states.normal)) && player.hsp == 0)
				&& !crouchcamera_goingback && player.key_down
				{
					if crouchcamera < 1
						crouchcamera += 0.02;
					else
						crouchcamera = min(crouchcamera + 3, 150);
				}
				else
				{
					crouchcamera_goingback = true;
					crouchcamera = max(crouchcamera - 5, 0);
			
					if crouchcamera <= 0
						crouchcamera_goingback = false;
				}
			}
			
			// actually move the camera
			var cam_width = camera_get_view_width(view_camera[0]);
			var cam_height = camera_get_view_height(view_camera[0]);
			
			if targetgolf != -4 && !instance_exists(targetgolf)
				targetgolf = -4;
			if targetgolf == -4
			{
				if !global.coop or room == characterselect or room == rm_levelselect or room == Realtitlescreen
				{
					var cam_x = tx - cam_width / 2 + chargecamera + p2pdistancex;
					var cam_y = ty - cam_height / 2 - 50 + floor(crouchcamera);
					
					if !safe_get(obj_shell, "WC_oobcam")
					{
						cam_x = clamp(cam_x, 0, room_width - cam_width);
						cam_y = clamp(cam_y, 0, room_height - cam_height);
					}
					camera_zoom(1, 0.035);
				}
				else if obj_player2.state != states.titlescreen
				{
					var cam_x = ((obj_player1.x + obj_player2.x) / 2) - (cam_width / 2);
					var cam_y = ((obj_player1.y + obj_player2.y) / 2) - (cam_height / 2) - 50;
					
					var disx = abs(obj_player1.x - obj_player2.x) / coop_zoom_width;
					var disy = abs(obj_player1.y - obj_player2.y) / coop_zoom_height;
					
					camera_zoom(max(1, disx, disy), 0.035);
				}
			}
			else
			{
				var _px = 0;
				var _py = 0;
				if global.coop
				{
					_px = obj_player2.x;
					_py = obj_player2.y;
				}
				
				cam_x = ((obj_player1.x + targetgolf.x + _px) / 2) - (cam_width / 2);
				cam_y = ((obj_player1.y + targetgolf.y + _py) / 2) - (cam_height / 2) - 50;
				disx = abs(obj_player1.x - targetgolf.x - _px) / coop_zoom_width;
				disy = abs(obj_player1.y - targetgolf.y - _py) / coop_zoom_height;
				dis = max(disx, disy);
				dis = max(1, dis);
				camera_zoom(dis, 0.035);
			}
			if shake_mag != 0
			{
				cam_x += irandom_range(-shake_mag, shake_mag);
				repeat 2 cam_y += irandom_range(-shake_mag, shake_mag);
			}
			
			// better panic shake
			if REMIX && global.panic && !instance_exists(obj_ghostcollectibles)
			{
				cam_x += random_range(-1, 1);
				repeat 2 cam_y += random_range(-1, 1);
			}
			
			cx = cam_x + cam_width / 2;
			cy = cam_y + cam_height / 2;
			
			if !safe_get(obj_shell, "WC_oobcam")
			{
				if cam_width > room_width
					cam_x += (cam_width - room_width) / 2;
				if cam_height > room_height
					cam_y += (cam_height - room_height) / 2;
			}
			
			if lag > 0
				lagpos = undefined;
			if lag-- <= 0
			{
				if lagpos == undefined
					lagpos = camera_get_view_x(view_camera[0]) - cam_x;
				camera_set_view_pos(view_camera[0], cam_x + lagpos, cam_y);
			}
			else
				camera_set_view_pos(view_camera[0], camera_get_view_x(view_camera[0]), cam_y);
			lag = max(lag, 0);
			
			if lagpos != undefined
				lagpos = Approach(lagpos, 0, 25);
			
			lockx = cam_x;
			locky = cam_y;
			break;
		
		case states.camera_followtarget:
			cam_width = camera_get_view_width(view_camera[0]);
			cam_height = camera_get_view_height(view_camera[0]);
			tx = followtarget.x;
			ty = followtarget.y - 50;
			var dir = point_direction(x, y, followtarget.x, ty);
			cx = Approach(cx, followtarget.x, followspeed);
			cy = Approach(cy, ty, followspeed);
			if (abs(cx - followtarget.x) <= 4 && abs(cy - ty) <= 4)
				state = states.normal;
			cam_x = cx - (cam_width / 2);
			cam_y = cy - (cam_height / 2);
			cam_x = clamp(cam_x, 0, room_width - cam_width);
			cam_y = clamp(cam_y, 0, room_height - cam_height);
			if (shake_mag != 0)
			{
				cam_x += irandom_range(-shake_mag, shake_mag);
				cam_y += irandom_range(-shake_mag, shake_mag);
			}
			if (cam_width > room_width)
				cam_x += ((cam_width - room_width) / 2);
			if (cam_height > room_height)
				cam_y += ((cam_height - room_height) / 2);
			camera_set_view_pos(view_camera[0], cam_x, cam_y + irandom_range(-shake_mag, shake_mag));
			break;
	}
}
else if REMIX && room != rank_room && room != timesuproom && room != rm_baby && !instance_exists(obj_bosscontroller)
{
	var cam_x = lockx, cam_y = locky;
	if shake_mag != 0
	{
		cam_x += irandom_range(-shake_mag, shake_mag);
		repeat 2
			cam_y += irandom_range(-shake_mag, shake_mag);
	}
	
	// better panic shake
	if global.panic && !instance_exists(obj_ghostcollectibles)
	{
		cam_x += random_range(-1, 1);
		repeat 2 cam_y += random_range(-1, 1);
	}
	camera_set_view_pos(view_camera[0], cam_x, cam_y);
}

// update wave
if global.panic or global.snickchallenge
{
	global.wave = global.maxwave - global.fill;
	
	if check_sugary()
	{
		camera_set_view_angle(view_camera[0], scr_sin(3.5 * clamp(global.wave / global.maxwave, 0, 1), 65 - (5 * clamp(global.wave / global.maxwave, 0, 1))));
		if instance_exists(obj_pizzaface)
			greyscale = Approach(greyscale, 0.45, 0.005)
		else
			greyscale = Approach(greyscale, 0, 0.01)
	}
	else
	{
		camera_set_view_angle(view_camera[0], 0);
		greyscale = 0;
	}
}
else if !instance_exists(obj_endlevelfade)
{
	camera_set_view_angle(view_camera[0], 0);
	greyscale = 0;
}
else
	camera_set_view_angle(view_camera[0], Approach(camera_get_view_angle(view_camera[0]), 0, 15));
