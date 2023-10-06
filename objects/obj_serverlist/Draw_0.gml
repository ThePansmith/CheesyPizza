if state == 1
	exit;

#region draw boxes and text

bgscroll -= .35;
draw_box(32, 64, 480, 540 - 96);
draw_box(540, 320 + 76, SCREEN_WIDTH - 540 - 32, 112, -540 + 28, -332);
draw_box(540, 64, SCREEN_WIDTH - 540 - 32, 320, -540 + 28);

// username
var def = serverlist.username;
serverlist.username = draw_textfield(604, 422, /*w*/, /*h*/, /*max*/, "Username", def);
if uname_check(serverlist.username)
	room_goto(Funnyroom);

// loby code
var lobby = draw_textfield(604, 454, /*w*/, /*h*/, 6, "Lobby Code");

// text at the top
draw_set_font(global.creditsfont);
draw_set_color(c_white);
draw_set_align(fa_center);
draw_text(256 + 16, 18, "Server List");
draw_text(720 + 16, 18, "Direct Connect");

#endregion
#region draw server buttons

if !surface_exists(surffinal)
	surffinal = surface_create(480, 540 - 96 - 3);
else
	surface_resize(surffinal, 480, 540 - 96 - 3);

surface_set_target(surffinal);
draw_clear_alpha(c_black, 0);

var hoverable = point_in_rectangle(cursor.x, cursor.y, 32, 64, 32 + 480, 64 + 540 - 96);
var yy = 0;

draw_set_align();
for(var i = 0; i < array_length(officialservers) + array_length(serverlist.servers); i++)
{
	var s, official = false;
	if i < array_length(officialservers)
	{
		s = officialservers[i];
		official = true;
	}
	else
		s = serverlist.servers[i - array_length(officialservers)];
	
	var txt = s.name; // 15 maximum letters using WWWWWW
	var w = string_width(txt) + 64;
	yy = 16 + (80 * i);
	
	var button = drawbutton(16, yy + listscroll, w, 72, hoverable, -32, -66);
	draw_text(50, 20 + yy + listscroll, txt);
	
	// click or remove
	if button
	{
		if (mouse_check_button_pressed(mb_right) or cursor.rightclick) && !official
			array_delete(serverlist.servers, i - array_length(officialservers), 1);
		if mouse_check_button_pressed(mb_left) or cursor.leftclick
		{
			sound_play_centered(sfx_step);
			if serverlist.username == ""
				message_show("INPUT A USERNAME!");
			else
			{
				state = 1;
				event_user(0);
				show_message("Unfinished!");
			}
		}
	}
}

surface_reset_target();
draw_surface(surffinal, 32, 66);

#endregion
#region scroll

if hoverable
{
	if cursor.scrolldown
		listscroll_true -= 42;
	if cursor.scrollup
		listscroll_true += 42;
}
listscroll_true = clamp(listscroll_true, -yy + 348, 0);
listscroll = lerp(listscroll, listscroll_true, 0.5);

#endregion
#region direct connect

var server_name = draw_textfield(604, 116, /*w*/, /*h*/, 15, "Server Name");
var server_ip = draw_textfield(604, 116 + 32, /*w*/, /*h*/, 64, "IP");
var server_port = draw_textfield(604, 116 + 32 + 32, /*w*/, /*h*/, /*max*/, "Port", "6666");

// connect
if drawbutton(608 - 72 + 32, 242, 200, 72, /*hoverable*/, /*mxo*/, /*myo*/, "Connect") == 2
{
	sound_play_centered(sfx_step);
	if server_port == ""
		server_port = "6666";
	
	if server_ip == "" or (string_pos(".", server_ip) == 0 && server_ip != "localhost")
		message_show("INVALID IP!");
	else if serverlist.username == ""
		message_show("INPUT A USERNAME!");
	else
	{
		state = 1;
		event_user(0);
		show_message("Unfinished!");
	}
}

// add
if drawbutton(608 + 172, 242, 116, 72, /*hoverable*/, /*mxo*/, /*myo*/, "Add") == 2
{
	sound_play_centered(sfx_step);
	if server_name == ""
		server_name = server_ip;
	if server_port == ""
		server_port = "6666";
	
	if server_ip == "" or (string_pos(".", server_ip) == 0 && server_ip != "localhost")
		message_show("INVALID IP!");
	else
		add_server(server_ip, server_port, server_name, false);
}

#endregion

if loading
{
	image_angle += 5;
	draw_sprite_ext(spr_loading, 0, 960 / 2, 540 / 2, 1, 1, image_angle, c_white, 1);
}
if cursor.active
	draw_sprite(spr_fakecursor, 0, cursor.x, cursor.y);
