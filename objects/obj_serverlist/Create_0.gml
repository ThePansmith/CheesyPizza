if room != characterselect
{
	instance_destroy();
	exit;
}

ver = "1.0";

#region server list bullshit

add_server = function(IP, PORT, NAME, OFFICIAL)
{
	array_push(OFFICIAL ? officialservers : serverlist.servers, {ip: IP, port: PORT, name: NAME});
}
save_servers = function()
{
	var file = file_text_open_write("servers.json");
	file_text_write_string(file, json_stringify(serverlist));
	file_text_close(file);
}
uname_check = function(username)
{
	return false;
}

// attempt to load serverlist
var reset = true;
if file_exists("servers.json")
{
	try
	{
		var file = file_text_open_read("servers.json");
		if file != -1
		{
			var json = file_text_readln(file);
			file_text_close(file);
			
			serverlist = json_parse(json);
			
			// verify contents
			if variable_struct_exists(serverlist, "servers")
			&& variable_struct_exists(serverlist, "username")
			&& variable_struct_exists(serverlist, "version") && serverlist.version == ver
			{
				reset = false;
				if uname_check(serverlist.username)
					serverlist.username = "";
			}
			else 
				message_show("OUTDATED SERVER LIST!");
		}
	}
	catch(e)
	{
		reset = true;
	}
}

// if above fails, reset
if reset
{
	serverlist = 
	{
		username: "",
		servers: [],
		version: ver
	}
}

// network lists
officialservers = [];
communityservers = [];

req = -1;//http_get("https://pizzatowertogether.com/servers/list");
loading = true;

#endregion

state = 0;

scr_init_input();
surfclip = noone;
surffinal = noone;

bgscroll = 0;
listscroll = 0;
listscroll_true = 0;

pto_textbox_init();

cursor = 
{
	active: false,
	x: 960 / 2,
	y: 540 / 2,
	
	leftclick: false,
	rightclick: false,
	scrolldown: false,
	scrollup: false,
}
mx_previous = mouse_x;
my_previous = mouse_y;
stick = false;

scr_init_input();
if gamepad_is_connected(obj_inputAssigner.player_input_device[0])
	cursor.active = true;

#region function definitions

draw_box = function(x, y, w, h, txo = 0, tyo = 0)
{
	if surface_exists(surfclip)
		surface_resize(surfclip, w, h);
	if surface_exists(surffinal)
		surface_resize(surffinal, w, h);
	
	var xx = x;
	var yy = y;
	
	draw_sprite_ext(spr_tutorialbubble_rope, 0, xx + 16, y + 16, 1, y / 61 + 1, 0, c_white, 1);
	draw_sprite_ext(spr_tutorialbubble_rope, 0, xx + w - 16, y + 16, 1, y / 61 + 1, 0, c_white, 1);
	
	scr_draw_granny_texture(xx, yy, w / 96, h / 96, bgscroll, bgscroll, bg_serverlist, spr_tutorialbubble, txo, tyo);
	draw_sprite_ext(spr_tutorialbubble, 1, xx, yy, w / 96, h / 96, 0, c_white, 1);
}
draw_textfield = function(x, y, w = 254, h = 30, maximum = 32, placeholder = "", def = "")
{
	// setup the textbox
	var x2 = x + w, y2 = y + h;
	
	var varprefix = $"textfield{x * y}";
	var struct = ds_map_find_value(textboxes, varprefix);
	if struct == undefined
	{
		struct = {
			str : def,
			sel : false,
			textline : 0,
			scroll : 0
		}
	}
	
	// draw the text and the textbox itself
	var subwaysurfers = surface_create(w, h);
	surface_set_target(subwaysurfers);
	
	draw_set_font(global.font_small);
	draw_set_halign(fa_left);
	draw_clear(c_dkgray);
	draw_set_colour(c_black);
	draw_rectangle(1, 1, w - 2, h - 2, true);
	draw_set_colour(c_white);
	
	var xx = 0, yy = 0, scrollw = (h < 60 ? struct.scroll : 0), scrollh = (h >= 60 ? struct.scroll : 0);
	for(var i = 1; i <= string_length(struct.str); i++)
	{
		var char = string_char_at(struct.str, i);
		if xx + scrollw >= 0 && xx + scrollw <= w && yy + scrollh >= 0 && yy + scrollh <= h
			draw_text(xx + 6 + scrollw, yy + 6 + scrollh, char);
		
		xx += string_width(char);
		if xx >= w - 16 && h >= 60
		{
			xx = 0;
			yy += 16;
		}
	}
	if struct.str == "" && !struct.sel
		draw_text_color(xx + 6, yy + 6, placeholder, c_gray, c_gray, c_gray, c_gray, 0);
	if floor(struct.textline / 20)
	{
		draw_set_font(font0);
		draw_text(xx + scrollw + 6, yy + 4 + scrollh, "|");
	}
	
	// scrolling
	var hover = cursor.x >= x && cursor.y >= y && cursor.x < x2 && cursor.y < y2;
	if hover
	{
		if cursor.scrolldown
			struct.scroll -= 16;
		if cursor.scrollup
			struct.scroll += 16;
	}
	
	// selected
	if !struct.sel
	{
		if (mouse_check_button_pressed(mb_left) or cursor.leftclick) && hover
		{
			cooldown = 2;
			
			struct.textline = 20;
			struct.sel = true;
			keyboard_string = struct.str;
		}
	}
	if struct.sel
	{
		if cooldown <= 0
		{
			if struct.str != keyboard_string
			{
				keyboard_string = string_copy(keyboard_string, 1, maximum);
				
				xx -= string_width(struct.str) - string_width(keyboard_string);
				struct.scroll = -xx;
				struct.str = keyboard_string;
			}
		}
		else
			cooldown--;
		struct.textline = (struct.textline + 1) % 40;
		
		if (mouse_check_button_pressed(mb_left) or cursor.leftclick) && !hover
		{
			struct.textline = 0;
			struct.sel = false;
		}
	}
	
	surface_reset_target();
	draw_surface(subwaysurfers, x, y);
	surface_free(subwaysurfers);
	
	struct.scroll = clamp(struct.scroll, -max((h >= 60 ? yy - h + 32 : xx - w + 16), 0), 0);
	
	ds_map_set(textboxes, varprefix, struct);
	return struct.str;
}

#endregion
