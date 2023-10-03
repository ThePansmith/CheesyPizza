sprite_index = gateSprite;
if !SUGARY
	depth = 100;
image_speed = 0;
world = 1;
pizza = false;
rank = "d";
group_arr = noone;
boss = false;
drawing = false;
highscore = 0;
secret_count = 0;
toppin = array_create(5, 0);
scr_hub_bg_init();
scr_create_uparrowhitbox();

info = noone; // SET IF YOU WANT A SUGARY TITLECARD.
//titlecard_sprite = spr_titlecards;
//titlecard_index = 0;
//title_sprite = spr_titlecards_title;
//title_index = 0;
//title_music = "event:/music/w1/entrancetitle";
show_titlecard = true;
allow_modifier = true;

transfotip = noone;

door_index = -1;

levelName = ""; // FOR USE IN CYOP.

// sugary startgate
confecti_sprs[0] = { sprite: spr_marshmellow_taunt, image: choose(0, 1) };
confecti_sprs[1] = { sprite: spr_chocolate_taunt, image: choose(0, 1) };
confecti_sprs[2] = { sprite: spr_crack_taunt, image: choose(0, 1) };
confecti_sprs[3] = { sprite: spr_gummyworm_taunt, image: choose(0, 1) };
confecti_sprs[4] = { sprite: spr_candy_taunt, image: choose(0, 1) };
