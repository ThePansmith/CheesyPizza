state = states.normal;
detach = false;
detachedby = -1;
follow_golf = false;
targetgolf = -4;
camzoom = 1;
max_zoom = 100;
targetzoom = 1;
zoomspd = 0.01;
lastcollect = -1;
color_array = array_create(1, 0);
collect_shake = 0;
combobubblevisible = true;
lock = false;
comboend = false;
followtarget = -4;
followspeed = 10;
previousrank = 0;
rank_scale = 1;
original_cam_width = SCREEN_WIDTH;
original_cam_height = SCREEN_HEIGHT;
coop_zoom_width = (original_cam_width / 4) * 1.5;
coop_zoom_height = (original_cam_height / 4) * 1.5;
hud_posY = 0;
pizzascore_index = 0;
pizzascore_number = sprite_get_number(spr_pizzascore);
n = 0;
image_speed = 0.35;
alarm[1] = -1;
global.seconds = 59;
global.minutes = 0;
global.miniboss = false;
angle = 0;
frame = 0;
global.pizza = 0;
global.pizzameter = 0;
global.pillarhunger = 4000;
basement = false;
shake_mag = 0;
shake_mag_acc = 0;
zoom = false;
chargecamera = 0;
alpha = 1;
zoomh = SCREEN_HEIGHT;
zoomw = SCREEN_WIDTH;
global.maxwave = 0;
global.wave = 0;
ded = false;
player = obj_player1;
spr_player = -4;
spr_speedbarHUD = -4;
spr_speedbar_index = 0;
shoving = false;
bang = false;
image_speed = 0.35;
p2pdistance = 0;
p2pdistancex = 0;
bound_camera = false;
global.timedgate = false;
healthshake = 0;
healthold = 8;
healthshaketime = 0;
playerhealthup = false;

// pto
crouchcamera = 0;
crouchcamera_goingback = false;
lockx = 0;
locky = 0;
bulletimage = 0;
lag = 0;
lagpos = undefined;
