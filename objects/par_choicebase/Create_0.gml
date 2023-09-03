live_auto_call;

// animation / background
sound_play("event:/modded/sfx/diagopen");

anim_con = 0;
anim_t = 0;
outback = animcurve_get_channel(curve_menu, "outback");
incubic = animcurve_get_channel(curve_menu, "incubic");
jumpcurve = animcurve_get_channel(curve_jump, "curve1");

bg_pos = 0;
bg_image = random(3);
mixingfade = 0;

image_speed = 0.35;
depth = -450;

// god help us all
vertex_buffer = vertex_create_buffer();
pizza_vbuffer = vertex_create_buffer();

vertex_format_begin();
vertex_format_add_position();
vertex_format_add_color();
vertex_format_add_texcoord();
vertex_format = vertex_format_end();

uvs = sprite_get_uvs(spr_skinchoicepalette, 0);
tex = sprite_get_texture(spr_skinchoicepalette, 0);
uv_info = {
	left : uvs[0],
	top : uvs[1],
	right : uvs[2],
	bottom : uvs[3],
	left_trim : uvs[4],
	top_trim : uvs[5]
}

// control
init = true;
postdraw = -1;
draw = -1;
select = -1;
move_hor = 0;
move_ver = 0;
arrowbufferH = -1;
arrowbufferV = -1;
mixing = false;

scr_init_input();
stickpressed_vertical = true;
open_menu();

event_user(1); // RX: Build pizza vertex array

// functions
select = function()
{
	
}
postdraw = function(curve)
{
	
}
draw = function(curve)
{
	
}
