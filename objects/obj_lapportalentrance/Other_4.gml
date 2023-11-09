var p = false;
with (obj_player)
{
	if (targetDoor == "LAP")
	{
		p = true;
		state = states.actor;
		x = other.x;
		y = other.y;
		roomstartx = x;
		roomstarty = y;
		visible = false;
		with (obj_pizzaface)
		{
			x = other.x;
			y = other.y;
		}
		
		if MOD.Lap3 == 1 && global.laps == 2 && !(is_struct(global.checkpoint_data) && global.checkpoint_data.loaded)
			set_checkpoint();
		
		if MOD.Lap3
		{
			switch global.laps
			{
				case 2:
					global.fill = 0;
					if !global.panic
					{
						instance_create(obj_player1.x, obj_player1.y, obj_pizzaface);
						scr_pizzaface_laugh();
					}
					break;
				
				case 3:
					instance_create_unique(0, 0, obj_snickexe);
					with obj_wartimer
					{
						addseconds = 60 * 2 + 30; // 2:30
						alarm[0] = -1;
						alarm[2] = 1;
					}
							
					with instance_create_unique(0, 0, obj_wartimer)
					{
						switch global.leveltosave
						{
							case "entrance":
							    minutes = 1;
							    break;
							case "medieval":
							    minutes = 1;
							    seconds = 30;
							    break;
							case "ruin":
							    minutes = 1;
							    seconds = 30;
							    break;
							case "dungeon":
							    minutes = 2;
							    break;
							case "badland":
							    minutes = 2;
							    break;
							case "graveyard":
							    minutes = 2;
							    break;
							case "farm":
							    minutes = 1;
							    break;
							case "saloon":
							    minutes = 1;
							    seconds = 30;
							    break;
							case "plage":
							    minutes = 1;
							    seconds = 30;
							    break;
							case "forest":
							    minutes = 2;
							    break;
							case "space":
							    minutes = 1;
							    seconds = 30;
							    break;
							case "minigolf":
							    minutes = 2;
							    seconds = 30;
							    break;
							case "street":
							    minutes = 1;
							    seconds = 30;
							    break;
							case "sewer":
							    minutes = 2;
							    seconds = 30;
							    break;
							case "industrial":
							    minutes = 2;
							    break;
							case "freezer":
							    minutes = 2;
							    break;
							case "chateau":
							    minutes = 2;
							    break;
							case "kidsparty":
							    minutes = 2;
							    break;
							case "exit":
							    minutes = 3;
							    seconds = 30;
							    break;
							default:
							    minutes = 2;
							    break;
							
							// pto
							case "sucrose":
								minutes = 3;
								break;
							case "etb":
								minutes = 1;
								break;
							case "entryway":
								minutes = 1;
								seconds = 30;
								break;
							case "ancient":
								seconds = 60;
								break;
						}
					}
					break;
			}
		}
	}
}
if (!p)
	instance_destroy();
else
	active = true;
