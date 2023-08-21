targetRoom = entrance_1;
targetDoor = "A";
depth = 100;
image_speed = 0;
level = "none";
world = 1;
pizza = false;
rank = "d";
group_arr = -4;
boss = false;
drawing = false;
targetDoor = "A";
highscore = 0;
secret_count = 0;
toppin = array_create(5, 0);
scr_hub_bg_init();
scr_create_uparrowhitbox();

info = -4; // SET IF YOU WANT A SUGARY TITLECARD.
titlecard_sprite = spr_titlecards;
titlecard_index = 0;
title_sprite = spr_titlecards_title;
title_index = 0;
title_music = "event:/music/w1/entrancetitle";

transfotip = noone;
msg = "";
door_index = -1;

// FOR USE IN CYOP.
levelName = "";


//sugary shit
showtext = 0;
confecti_sprs = [ { sprite: spr_marshmellow_taunt, image: choose(0, 1) },
					{ sprite: spr_chocolate_taunt, image: choose(0, 1) },
					{ sprite: spr_crack_taunt, image: choose(0, 1) },
					{ sprite: spr_gummyworm_taunt, image: choose(0, 1) },
					{ sprite: spr_candy_taunt, image: choose(0, 1) } ];
