image_speed = 0.05;
mask_index = spr_tutorialgranny_sleep;
show = false;
donepanic = false;
bubble_spr = SUGARY ? spr_icepop_bubble : spr_tutorialbubble;
rope_spr = SUGARY ? spr_icepop_rope : spr_tutorialbubble_rope;
rope_img = 0.0;
wave_timer = 0;
text = "";
text_borderpad = 32;
text_contentpad = 16;
text_ystart = text_borderpad;
text_y = -200;
tex_x = 0;
text_state = states.titlescreen;
text_xscale = (SCREEN_WIDTH - 64) / sprite_get_width(bubble_spr);
text_oldxscale = text_xscale;
text_yscale = 1;
text_sprite_width = sprite_get_width(bubble_spr);
text_sprite_height = sprite_get_height(bubble_spr);
text_wave_x = 0;
text_wave_y = 0;
text_arr = noone;
text_dir = 1;
background_spr = SUGARY ? spr_icepopbg : spr_pizzagrannytexture;
text_color = 0;
surfclip = noone;
surffinal = noone;
showgranny = true;
change_y = true;
alarm[0] = 1;
depth = 10;
voicecooldown = 0;

spr_sleep = spr_tutorialgranny_sleep;
spr_talk = spr_tutorialgranny_talk;
if SUGARY
{
	spr_sleep = spr_grandpop;
	spr_talk = spr_grandpop_speak;
}
