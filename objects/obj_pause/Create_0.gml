pause = false;
i = false;
color = make_color_rgb(121, 103, 151);
scr_init_input();
player1 = -4;
player2 = -4;
selected = 0;
stickpressed = false;
image_speed = 0;
depth = -500;
backbuffer = 0;
savedmusicmuffle = 0;
cursor_index = 0;
cursor_sprite_number = sprite_get_number(spr_angelpriest);
cursor_sprite_height = sprite_get_height(spr_angelpriest);
cursor_x = -1000;
cursor_y = -1000;
cursor_actualx = 0;
cursor_actualy = 0;
update_cursor = false;
hub = true;
treasurefound = false;
treasurealpha = 0;
secretcount = 0;
secretalpha = 0;
transfotext = -4;
transfotext_size = 0;
roomtorestart = Mainmenu;
pausemusicID = fmod_event_create_instance("event:/music/pause");
savedsecretpause = false;
savedmusicpause = false;
savedpillarpause = false;
savedpanicpause = false;
savedkidspartypause = false;
fade = 0;
fadein = false;
screensprite = -4;
screensize = 0;
guisprite = -4;
instance_list = ds_list_create();
sound_list = ds_list_create();
priest_list = ds_list_create();
start = false;
alarm[1] = 1;

screensprite = noone;
screensprite2 = noone;

// options
spr_palette = spr_peppalette;
paletteselect = 0;
character = "P";

pause_menu_base = ["pause_resume", "pause_options", "pause_restart", "pause_exit"];
pause_menu = -1;

pause_icons_base = array_create(0);
scr_pauseicon_add(spr_pauseicons, 0, -20, -12, pause_icons_base);
scr_pauseicon_add(spr_pauseicons, 1, 5, -15, pause_icons_base);
scr_pauseicon_add(spr_pauseicons, 2, -10, 0, pause_icons_base);
scr_pauseicon_add(spr_pauseicons, 3, -10, 0, pause_icons_base);
pause_icons = -1;

refresh_options = function()
{
	pause_menu = array_create(0);
	pause_icons = array_create(0);
	array_copy(pause_menu, 0, pause_menu_base, 0, array_length(pause_menu_base));
	array_copy(pause_icons, 0, pause_icons_base, 0, array_length(pause_icons_base));
}
