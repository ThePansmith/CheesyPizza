scr_initenemy();

destroyable = false;
stompable = false;
bumpable = false;
killbyenemy = false;
instantkillable = false;
stunnable = false;
parryable = false;

stunfallspr = spr_junk;
walkspr = spr_junk;
scaredspr = spr_junk;
spr_dead = spr_junk;
movespeed = 0;
hsp = 0;

image_speed = 0;
img = random_range(0, image_number - 1);
image_index = img;
depth = -5;
