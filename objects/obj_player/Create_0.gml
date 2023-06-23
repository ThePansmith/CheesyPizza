if (instance_number(object_index) > 1)
{
	if Debug repeat 20
		trace("!! NEW obj_player INSTANCE !! room: ", room);
	else
	{
		instance_destroy();
		exit;
	}
}

soundinit = false;
function player_destroy_sounds()
{
	if !soundinit exit;
	
	fmod_event_instance_release(snd_voiceok);
	fmod_event_instance_release(snd_voicetransfo);
	fmod_event_instance_release(snd_voiceouttransfo);
	fmod_event_instance_release(snd_voicehurt);
	fmod_event_instance_release(global.snd_fireass);
	fmod_event_instance_release(global.snd_parry);
	fmod_event_instance_release(machsnd);
	fmod_event_instance_release(jumpsnd);
	fmod_event_instance_release(machrollsnd);
	fmod_event_instance_release(weeniebumpsnd);
	fmod_event_instance_release(knightslidesnd);
	fmod_event_instance_release(gravecorpsesnd);
	fmod_event_instance_release(barrelslidesnd);
	fmod_event_instance_release(barrelbumpsnd);
	fmod_event_instance_release(waterslidesnd);
	fmod_event_instance_release(mrpinchsnd);
	fmod_event_instance_release(hamkuffsnd);
	fmod_event_instance_release(ratmountmachsnd);
	fmod_event_instance_release(ratmountballsnd);
	fmod_event_instance_release(ratmountgroundpoundsnd);
	fmod_event_instance_release(ratmountpunchsnd);
	fmod_event_instance_release(cheeseballsnd);
	fmod_event_instance_release(boxxedspinsnd);
	fmod_event_instance_release(pizzapeppersnd);
	fmod_event_instance_release(ratdeflatesnd);
	fmod_event_instance_release(ghostspeedsnd);
	fmod_event_instance_release(freefallsnd);
	fmod_event_instance_release(rollgetupsnd);
	fmod_event_instance_release(tumblesnd);
	fmod_event_instance_release(snd_uppercut);
	fmod_event_instance_release(snd_dive);
	fmod_event_instance_release(snd_crouchslide);
	fmod_event_instance_release(snd_dashpad);
	fmod_event_instance_release(animatronicsnd);
	fmod_event_instance_release(burpsnd);
	fmod_event_instance_release(superjumpsnd);
	fmod_event_instance_release(suplexdashsnd);
	fmod_event_instance_release(gallopingsnd);
	fmod_event_instance_release(flippingsnd);
	fmod_event_instance_release(snd_jetpackloop);
}
function player_init_sounds()
{
	soundinit = true;
	
	// collect
	if character == "SP"
	{
		global.snd_collect = "event:/modded/sfx/collectSP";
		global.snd_collectpizza = "event:/modded/sfx/collectSP";
		global.snd_collectgiantpizza = "event:/modded/sfx/collectgiantpizzaSP";
	}
	else if character == "PP"
	{
		global.snd_collect = "event:/modded/sfx/collectPP";
		global.snd_collectpizza = "event:/modded/sfx/collectpizzaPP";
		global.snd_collectgiantpizza = "event:/modded/sfx/collectgiantpizzaPP";
	}
	else
	{
		global.snd_collect = "event:/sfx/misc/collect";
		global.snd_collectpizza = "event:/sfx/misc/collectpizza";
		global.snd_collectgiantpizza = "event:/sfx/misc/collectgiantpizza";
	}
	
	// the voices
	if character == "P"
	{
		snd_voiceok = fmod_event_create_instance("event:/sfx/voice/ok");
		snd_voicetransfo = fmod_event_create_instance("event:/sfx/voice/transfo");
		snd_voiceouttransfo = fmod_event_create_instance("event:/sfx/voice/outtransfo");
		snd_voicehurt = fmod_event_create_instance("event:/sfx/voice/hurt");
	}
	else if character == "N"
	{
		snd_voiceok = fmod_event_create_instance("event:/sfx/voice/noisepositive");
		snd_voicetransfo = fmod_event_create_instance("event:/sfx/voice/noisenegative");
		snd_voiceouttransfo = fmod_event_create_instance("event:/sfx/voice/noisepositive");
		snd_voicehurt = fmod_event_create_instance("event:/sfx/voice/noisenegative");
	}
	else if character == "V"
	{
		snd_voiceok = fmod_event_create_instance("event:/sfx/voice/vigiduel");
		snd_voicetransfo = fmod_event_create_instance("event:/sfx/voice/vigiangry");
		snd_voiceouttransfo = fmod_event_create_instance("event:/sfx/voice/vigiduel");
		snd_voicehurt = fmod_event_create_instance("event:/sfx/voice/vigiduel");
	}
	else
	{
		snd_voiceok = fmod_event_create_instance("event:/nosound");
		snd_voicetransfo = fmod_event_create_instance("event:/nosound");
		snd_voiceouttransfo = fmod_event_create_instance("event:/nosound");
		snd_voicehurt = fmod_event_create_instance("event:/nosound");
	}
	
	// fireass
	if character == "P"
		global.snd_fireass = fmod_event_create_instance("event:/sfx/pep/fireass");
	else if character == "PP"
		global.snd_fireass = fmod_event_create_instance("event:/sfx/pep/fireassPP");
	else if character == "SP"
		global.snd_fireass = fmod_event_create_instance("event:/sfx/pep/fireassSP");
	else
		global.snd_fireass = fmod_event_create_instance("event:/sfx/pep/fireassN");
	
	// parry
	if character == "SP"
		global.snd_parry = fmod_event_create_instance("event:/modded/sfx/parrySP");
	else
		global.snd_parry = fmod_event_create_instance("event:/sfx/pep/parry");
	
	machsnd = fmod_event_create_instance(character == "PP" ? "event:/modded/sfx/machPP" : "event:/sfx/pep/mach");
	jumpsnd = fmod_event_create_instance("event:/sfx/pep/jump");
	machrollsnd = fmod_event_create_instance("event:/sfx/pep/machroll");
	weeniebumpsnd = fmod_event_create_instance("event:/sfx/weenie/bump");
	knightslidesnd = fmod_event_create_instance("event:/sfx/knight/slide");
	gravecorpsesnd = fmod_event_create_instance("event:/sfx/pep/gravecorpse");
	barrelslidesnd = fmod_event_create_instance("event:/sfx/barrel/slide");
	barrelbumpsnd = fmod_event_create_instance("event:/sfx/barrel/bump");
	waterslidesnd = fmod_event_create_instance("event:/sfx/misc/waterslide");
	mrpinchsnd = fmod_event_create_instance("event:/sfx/misc/mrpinch");
	hamkuffsnd = fmod_event_create_instance("event:/sfx/misc/hamkuff");
	ratmountmachsnd = fmod_event_create_instance("event:/sfx/ratmount/mach");
	ratmountballsnd = fmod_event_create_instance("event:/sfx/ratmount/ball");
	ratmountgroundpoundsnd = fmod_event_create_instance("event:/sfx/ratmount/groundpound");
	ratmountpunchsnd = fmod_event_create_instance("event:/sfx/ratmount/punch");
	cheeseballsnd = fmod_event_create_instance("event:/sfx/cheese/ball");
	boxxedspinsnd = fmod_event_create_instance("event:/sfx/boxxed/spin");
	pizzapeppersnd = fmod_event_create_instance("event:/sfx/pep/pizzapepper");
	ratdeflatesnd = fmod_event_create_instance("event:/sfx/rat/deflate");
	ghostspeedsnd = fmod_event_create_instance("event:/sfx/pep/ghostspeed");
	freefallsnd = fmod_event_create_instance("event:/sfx/pep/freefall");
	rollgetupsnd = fmod_event_create_instance("event:/sfx/pep/rollgetup");
	tumblesnd = fmod_event_create_instance("event:/sfx/pep/tumble");
	snd_uppercut = fmod_event_create_instance("event:/sfx/pep/uppercut");
	snd_dive = fmod_event_create_instance("event:/sfx/pep/dive");
	snd_crouchslide = fmod_event_create_instance("event:/sfx/pep/crouchslide");
	snd_dashpad = fmod_event_create_instance("event:/sfx/misc/dashpad");
	animatronicsnd = fmod_event_create_instance("event:/sfx/pep/animatronic");
	burpsnd = fmod_event_create_instance("event:/sfx/enemies/burp");
	superjumpsnd = fmod_event_create_instance(character == "PP" ? "event:/modded/sfx/superjumpPP" : "event:/sfx/pep/superjump");
	suplexdashsnd = fmod_event_create_instance("event:/sfx/pep/suplexdash");
	gallopingsnd = fmod_event_create_instance("event:/sfx/misc/galloping");
	flippingsnd = fmod_event_create_instance("event:/modded/sfx/pizzyflip");
	snd_jetpackloop = fmod_event_create_instance("event:/sfx/noise/jetpackloop");
	sjumpcancelsnd = fmod_event_create_instance(character == "PP" ? "event:/modded/sfx/superjumpcancelPP" : "event:/sfx/pep/superjumpcancel");
}

global.throwarc = 1;
global.hidetiles = false;
global.leveltosave = -4;
global.leveltorestart = -4;
global.hub_bgsprite = -4;
global.offload_tex = -4;
global.bossplayerhurt = false;
global.boss_invincible = false;
global.highest_combo = 0;
global.player_damage = 0;
global.peppino_damage = 0;
global.gustavo_damage = 0;
global.enemykilled = 0;
global.johnresurrection = false;
global.startgate = false;
global.bossintro = false;
global.palettetexture = -4;
global.palettesurface = -4;
global.palettesurfaceclip = -4;
global.levelattempts = 0;
global.exitrank = false;
global.playerhit = 0;
global.door_sprite = spr_door;
global.door_index = 0;
global.pistol = false;

global.snd_escaperumble = fmod_event_create_instance("event:/sfx/misc/escaperumble");
global.snd_johndead = fmod_event_create_instance("event:/sfx/enemies/johndead");
global.snd_spaceship = fmod_event_create_instance("event:/sfx/misc/spaceship");
global.snd_fakesanta = fmod_event_create_instance("event:/sfx/enemies/fakesanta");
global.snd_rankup = fmod_event_create_instance("event:/sfx/ui/rankup");
global.snd_pizzafacemoving = fmod_event_create_instance("event:/sfx/pizzaface/moving");
global.snd_rankdown = fmod_event_create_instance("event:/sfx/ui/rankdown");
global.snd_rank = fmod_event_create_instance("event:/music/rank");
global.snd_rankSP = fmod_event_create_instance("event:/music/rankSP");
global.snd_rankBN = fmod_event_create_instance("event:/music/rankBN");
global.snd_breakblock = fmod_event_create_instance("event:/sfx/misc/breakblock");
global.snd_bellcollect = fmod_event_create_instance("event:/sfx/misc/bellcollect");
global.snd_cardflip = fmod_event_create_instance("event:/sfx/misc/cardflip");
global.snd_explosion = fmod_event_create_instance("event:/sfx/misc/explosion");
global.snd_cheesejump = fmod_event_create_instance("event:/sfx/pep/cheesejump");
global.snd_ventilator = fmod_event_create_instance("event:/sfx/misc/ventilator");
global.snd_trashjump1 = fmod_event_create_instance("event:/sfx/misc/trashjump1");
global.snd_thunder = fmod_event_create_instance("event:/sfx/knight/thunder");
global.snd_captaingoblinshoot = fmod_event_create_instance("event:/sfx/misc/captaingoblinshoot");
global.snd_golfjingle = fmod_event_create_instance("event:/sfx/misc/golfjingle");
global.snd_mrstickhat = fmod_event_create_instance("event:/sfx/misc/mrstickhat");
global.snd_alarm = fmod_event_create_instance("event:/sfx/enemies/alarm");
global.snd_slidersfx = fmod_event_create_instance("event:/sfx/ui/slidersfx");
global.snd_slidermusic = fmod_event_create_instance("event:/sfx/ui/slidermusic");
global.snd_slidermaster = fmod_event_create_instance("event:/sfx/ui/slidersfxmaster");
global.snd_bossbeaten = fmod_event_create_instance("event:/sfx/misc/bossbeaten");

uncrouch = 0;
parryID = -4;
bodyslam_notif = false;
swingdingthrow = false;
sjumptimer = 0;
can_jump = false;
coyote_time = 0;
invtime = 0;
parry_lethal = false;
usepalette = true;
jetpackeffect = 0;
superchargebuffer = 0;
fireasseffect = 0;
pistolanim = -4;
pistolindex = 0;
pistolcooldown = 0;
pistolchargesound = false;
policetaxi = false;
collision_flags = 0;
breakdance_pressed = 0;
restartbuffer = 0;
jetpackdash = false;
flamecloud_buffer = 0;
rankpos_x = x;
rankpos_y = y;
transformationlives = 0;
punch_afterimage = 0;
superchargecombo_buffer = -1;
superattackstate = states.normal;
afterimagedebris_buffer = 0;
scale_xs = 1;
scale_ys = 1;
verticalbuffer = 0;
verticalstate = states.normal;
webID = -4;
float = false;
boxxedpepjump = 10;
boxxedpepjumpmax = 10;
icemovespeed = 0;
prevmove = 0;
prevhsp = 0;
prevstate = states.normal;
prevxscale = 1;
prevsprite = sprite_index;
move = 0;
prevmovespeed = 0;
previcemovespeed = 0;
icedir = 1;
icemomentum = false;
savedicedir = 1;
isgustavo = false;
jumped = true;
grav = 0.5;
hsp = 0;
vsp = 0;
vsp_carry = 0;
hsp_carry = 0;
rocketvsp = 0;
sticking = false;
platformid = -4;
xscale = 1;
yscale = 1;
facehurt = false;
steppy = false;
steppybuffer = 0;
depth = -7;
movespeed = 19;
jumpstop = false;
ramp = false;
ramp_points = 0;
bombup_dir = 1;
knightmomentum = 0;
grabbingenemy = false;
blur_effect = 0;
firemouth_dir = 1;
firemouth_max = 10;
firemouth_buffer = firemouth_max;
firemouth_afterimage = 0;
cow_buffer = 0;
balloonbuffer = 0;
shoot_buffer = 0;
shoot_max = 20;
dynamite_inst = -4;
golfid = -4;
bombgrabID = -4;
barrelslope = false;
barrel_maxmovespeed = 16;
barrel_maxfootspeed = 10;
barrel_rollspeed_threshold = 10;
barrel_accel = 1;
barrel_deccel = 1;
barrel_slopeaccel = 0.25;
barrel_slopedeccel = 0.5;
barrelroll_slopeaccel = 0.5;
barrelroll_slopedeccel = 0.35;
hurt_buffer = -1;
hurt_max = 120;
invhurt_buffer = 0;
invhurt_max = 30;
ratmount_movespeed = 8;
ratmount_fallingspeed = 0;
ratgrabbedID = -4;
ratpowerup = -4;
ratshootbuffer = 0;
rateaten = false;
gustavodash = 0;
brick = false;
ratmountpunchtimer = 25;
gustavokicktimer = 5;
cheesepep_buffer = 0;
cheesepep_max = 10;
pepperman_accel = 0.25;
pepperman_deccel = 0.5;
pepperman_accel_air = 0.15;
pepperman_deccel_air = 0.25;
pepperman_maxhsp_normal = 6;
pepperman_jumpspeed = 11;
pepperman_grabID = -4;
shoulderbash_mspeed_start = 12;
shoulderbash_mspeed_loop = 10;
shoulderbash_jumpspeed = 11;
visible = true;
state = states.titlescreen;
jumpAnim = true;
landAnim = false;
machslideAnim = false;
moveAnim = true;
stopAnim = true;
crouchslideAnim = true;
crouchAnim = true;
machhitAnim = false;
stompAnim = false;
inv_frames = false;
hurted = false;
autodash = false;
mach2 = 0;
stop_buffer = 8;
slope_buffer = 8;
stop_max = 16;
parry = false;
parry_inst = -4;
taunt_to_parry_max = 8;
parrytimer = 0;
parry_count = 0;
parry_max = 8;
is_firing = false;
input_buffer_jump = 0;
input_buffer_jump_negative = 0;
input_buffer_shoot = 0;
input_buffer_secondjump = 8;
input_buffer_highjump = 8;
input_buffer_walljump = 0;
input_buffer_slap = 0;
input_attack_buffer = 0;
input_finisher_buffer = 0;
input_up_buffer = 0;
input_down_buffer = 0;
hit_connected = false;
player_x = x;
player_y = y;
targetRoom = tower_entrancehall;
targetDoor = "A";
scr_init_input();
flash = false;
key_particles = false;
barrel = false;
bounce = false;
a = 0;
idle = 0;
attacking = false;
slamming = false;
superslam = 0;
grounded = true;
grinding = false;
machpunchAnim = false;
punch = false;
machfreefall = 0;
shoot = false;
instakillmove = false;
stunmove = false;
windingAnim = 0;
facestompAnim = false;
ladderbuffer = 0;
toomuchalarm1 = 0;
toomuchalarm2 = 0;
idleanim = 0;
momemtum = false;
cutscene = false;
grabbing = false;
dir = xscale;
shotgunAnim = false;
goingdownslope = false;
goingupslope = false;
fallinganimation = 0;
bombpeptimer = 100;
suplexmove = false;
suplexhavetomash = 0;
anger = 0;
angry = false;
baddiegrabbedID = noone;

spr_palette = spr_peppalette;
character = "P";
scr_characterspr();
paletteselect = 1;

colorchange = false;
treasure_x = 0;
treasure_y = 0;
treasure_room = 0;
wallspeed = 0;
tauntstoredstate = states.normal;
tauntstoredmovespeed = 6;
tauntstoredsprite = spr_player_idle;
taunttimer = 20;
tauntstoredvsp = 0;
tauntstoredisgustavo = false;
tube_id = -1;
backtohubstartx = x;
backtohubstarty = y;
backtohubroom = Mainmenu;
slapcharge = 0;
slaphand = 1;
slapbuffer = 8;
slapflash = 0;
freefallsmash = 0;
costumercutscenetimer = 0;
heavy = false;
lastroom_x = 0;
lastroom_y = 0;
lastroom = 0;
lastTargetoor = "A";
hallway = false;
savedhallway = false;
hallwaydirection = 0;
savedhallwaydirection = 0;
vhallwaydirection = 0;
savedvhallwaydirection = 0;
verticalhallway = false;
savedverticalhallway = false;
vertical_x = x;
verticalhall_vsp = 0;
box = false;
roomstartx = 0;
roomstarty = 0;
swingdingbuffer = 0;
swingdingdash = 0;
lastmove = 0;
backupweapon = false;
stickpressed = false;
spotlight = true;
macheffect = false;
chargeeffectid = obj_null;
dashcloudid = obj_null;
crazyruneffectid = obj_null;
fightball = false;
superslameffectid = obj_null;
speedlineseffectid = obj_null;
angryeffectid = obj_null;
thrown = false;
transformationsnd = false;
mach1snd = -1;
mach2snd = -1;
mach3snd = -1;
knightslide = -1;
bombpep1snd = -1;
mach4snd = -1;
tumble2snd = -1;
tumble1snd = -1;
tumble3snd = -1;
tumbleintro = false;
rocketsnd = -1;
hamkuffID = -4;
superjumpholdsnd = -1;
superjumpprepsnd = -1;
pogospeed = 2;
pogocharge = 100;
pogochargeactive = false;
wallclingcooldown = 10;
bombcharge = 0;
flashflicker = false;
flashflickertime = 0;
kickbomb = false;
doublejump = false;
pogospeedprev = false;
fightballadvantage = false;
coopdelay = 0;
supercharged = false;
superchargedeffectid = obj_null;
used_supercharge = false;
pizzashield = false;
pizzashieldid = obj_null;
pizzapepper = 0;
transformation[0] = states.bombpep; // these are states
transformation[1] = states.knightpep;
transformation[2] = states.knightpepslopes;
transformation[3] = states.boxxedpep;
transformation[4] = states.cheeseball;
transformation[5] = states.cheesepep;
transformation[6] = states.cheesepepstick;
transformation[7] = states.cheesepepstickup;
transformation[8] = states.cheesepepstickside;
transformation[9] = states.firemouth;
transformation[10] = states.fireass;
transformation[11] = states.stunned;
transformation[12] = states.rideweenie;
transformation[13] = states.dead;
transformation[14] = states.door;
transformation[15] = states.ghost;
transformation[16] = states.ghostpossess;
transformation[17] = states.mort;
transformation[18] = states.tube;
transformation[19] = states.actor;
transformation[20] = states.rocket;
transformation[21] = states.gotoplayer;
transformation[22] = states.bombgrab;
transformation[23] = states.bombpepside;
transformation[24] = states.bombpepup;
transformation[25] = states.barrelslide;
transformation[26] = states.barreljump;
transformation[27] = states.barrel;
transformation[28] = states.cheeseballclimbwall;
transformation[29] = states.motorcycle;
transformation[30] = states.knightpepbump;
transformation[31] = states.knightpepattack;
transformation[32] = states.mortattack;
transformation[33] = states.morthook;
transformation[34] = states.mortjump;
transformation[35] = states.boxxedpepjump;
transformation[36] = states.boxxedpepspin;
transformation[37] = states.rocketslide;
transformation[38] = states.cheesepepjump;
transformation[39] = states.rideweenie;
transformation[40] = states.barrelclimbwall;
keysound = false;
c = 0;
stallblock = 0;
breakdance = 50;
skateboarding = false;
hitX = x;
hitY = y;
hithsp = 0;
hitvsp = 0;
hitstunned = 0;
hitxscale = 1;
stunned = 0;
hitLag = 25;
supercharge = 0;
mort = false;
sjumpvsp = -12;
freefallvsp = 15;
hitlist = ds_list_create();
animlist = ds_list_create();
lungeattackID = -4;
lunge_hits = 0;
lunge_hit_buffer = 0;
lunge_buffer = 0;
finisher = false;
finisher_buffer = 0;
finisher_hits = 0;
uplaunch = false;
downlaunch = false;
dash_doubletap = 0;
finishingblow = false;
launch = false;
launched = true;
launch_buffer = 0;
jetpackfuel = 0;
jetpackmax = 200;
walljumpbuffer = 0;
farmerpos = 0;
clowntimer = 0;
knightmiddairstop = 0;
knightmove = -1;
if (!variable_global_exists("saveroom"))
{
	global.combodropped = false;
	global.saveroom = ds_list_create();
	global.escaperoom = ds_list_create();
	global.lap = false;
	global.laps = 0;
	global.playerhealth = 100;
	global.instancelist = ds_list_create();
	global.followerlist = ds_list_create();
	global.maxrailspeed = 2;
	global.railspeed = global.maxrailspeed;
	global.levelreset = false;
	global.temperature = 0;
	global.temperature_spd = 0.01;
	global.temp_thresholdnumber = 5;
	global.use_temperature = false;
	global.timedgatetimer = false;
	global.timedgatetime = 0;
	global.timedgateid = -4;
	global.timedgatetimemax = 0;
	global.key_inv = false;
	global.shroomfollow = false;
	global.cheesefollow = false;
	global.tomatofollow = false;
	global.sausagefollow = false;
	global.pineapplefollow = false;
	global.pepanimatronic = false;
	global.keyget = false;
	global.collect = 0;
	global.collectN = 0;
	global.hats = 0;
	global.extrahats = 0;
	global.treasure = false;
	global.combo = 0;
	global.previouscombo = 0;
	global.combotime = 0;
	global.combotimepause = 0;
	global.prank_enemykilled = false;
	global.prank_cankillenemy = true;
	global.tauntcount = 0;
	global.comboscore = 0;
	global.savedcomboscore = 0;
	global.savedcombo = 0;
	global.heattime = 0;
	global.pizzacoin = 0;
	global.toppintotal = 1;
	global.hit = 0;
	global.baddieroom = ds_list_create();
	global.hp = 2;
	global.gotshotgun = false;
	global.showgnomelist = true;
	global.panic = false;
	global.snickchallenge = false;
	global.golfhit = 0;
	global.style = -1;
	global.secretfound = 0;
	global.shotgunammo = 0;
	global.monsterspeed = 0;
	global.monsterlives = 3;
	global.giantkey = false;
	global.coop = false;
	global.baddiespeed = 1;
	global.baddiepowerup = false;
	global.baddierage = false;
	global.style = 0;
	global.stylethreshold = 0;
	global.pizzadelivery = false;
	global.failcutscene = false;
	global.pizzasdelivered = 0;
	global.spaceblockswitch = true;
	global.gerome = false;
	global.pigtotal_add = 0;
	global.bullet = 0;
	global.fuel = 3;
	global.ammorefill = 0;
	global.ammoalt = 1;
	global.mort = false;
	global.stylelock = false;
	global.pummeltest = true;
	global.horse = false;
	global.checkpoint_room = -4;
	global.checkpoint_door = "A";
	global.kungfu = false;
	global.graffiticount = 0;
	global.graffitimax = 20;
	global.noisejetpack = false;
	global.hasfarmer = array_create(3, false);
	global.savedattackstyle = -4;
	
	global.throw_frame = 0;
	global.throw_frame[obj_pizzagoblin] = 11
	global.throw_frame[obj_canongoblin] = 13
	global.throw_frame[obj_noisegoblin] = 18
	global.throw_frame[obj_cheeserobot] = 6
	global.throw_frame[obj_spitcheese] = 2
	global.throw_frame[obj_bazookabaddie] = 7
	global.throw_frame[obj_trash] = 2
	global.throw_frame[obj_invtrash] = 2
	global.throw_frame[obj_robot] = 2
	global.throw_frame[obj_kentukykenny] = 8
	global.throw_frame[obj_kentukylenny] = 8
	global.throw_frame[obj_pizzard] = 6
	global.throw_frame[obj_pepgoblin] = 3
	global.throw_frame[obj_pepbat] = 8
	global.throw_frame[obj_swedishmonkey] = 15
	global.throw_frame[obj_rancher] = 10
	global.throw_frame[obj_pickle] = 2
	global.throw_frame[obj_tank] = 6
	global.throw_frame[obj_thug_blue] = 9
	global.throw_frame[obj_thug_green] = 9
	global.throw_frame[obj_thug_red] = 9
	global.throw_frame[obj_smokingpizzaslice] = 13
	global.throw_frame[obj_miniufo] = 3
	global.throw_frame[obj_kentukybomber] = 7
	global.throw_frame[obj_miniufo_grounded] = 11
	global.throw_frame[obj_farmerbaddie2] = 13
	global.throw_frame[obj_farmerbaddie3] = 13
	
	global.throw_sprite = 0;
	global.throw_sprite[obj_pizzagoblin] = spr_pizzagoblin_throwbomb
	global.throw_sprite[obj_canongoblin] = spr_canongoblin_throwbomb
	global.throw_sprite[obj_noisegoblin] = spr_archergoblin_shoot
	global.throw_sprite[obj_cheeserobot] = spr_cheeserobot_attack
	global.throw_sprite[obj_spitcheese] = spr_spitcheese_spit
	global.throw_sprite[obj_bazookabaddie] = spr_tank_shoot
	global.throw_sprite[obj_trash] = spr_trash_throw
	global.throw_sprite[obj_invtrash] = spr_invtrash_throw
	global.throw_sprite[obj_robot] = spr_robot_attack
	global.throw_sprite[obj_kentukykenny] = spr_kentukykenny_throw
	global.throw_sprite[obj_kentukylenny] = spr_kentukykenny_throw
	global.throw_sprite[obj_pizzard] = spr_pizzard_shoot
	global.throw_sprite[obj_pepgoblin] = spr_pepgoblin_kick
	global.throw_sprite[obj_pepbat] = spr_pepbat_kick
	global.throw_sprite[obj_swedishmonkey] = spr_swedishmonkey_eat
	global.throw_sprite[obj_rancher] = spr_ranch_shoot
	global.throw_sprite[obj_pickle] = spr_pickle_attack
	global.throw_sprite[obj_tank] = spr_tank_shoot
	global.throw_sprite[obj_thug_blue] = spr_shrimp_knife
	global.throw_sprite[obj_thug_green] = spr_shrimp_knife
	global.throw_sprite[obj_thug_red] = spr_shrimp_knife
	global.throw_sprite[obj_smokingpizzaslice] = spr_pizzaslug_cough
	global.throw_sprite[obj_miniufo] = spr_ufolive_shoot
	global.throw_sprite[obj_kentukybomber] = spr_kentukybomber_attack
	global.throw_sprite[obj_miniufo_grounded] = spr_ufogrounded_shoot
	global.throw_sprite[obj_farmerbaddie2] = spr_farmer2_throw
	global.throw_sprite[obj_farmerbaddie3] = spr_peasanto_throw
	
	global.reset_timer = 0;
	global.reset_timer[obj_pizzagoblin] = 200;
	global.reset_timer[obj_canongoblin] = 200;
	global.reset_timer[obj_noisegoblin] = 200;
	global.reset_timer[obj_cheeserobot] = 200;
	global.reset_timer[obj_spitcheese] = 100;
	global.reset_timer[obj_bazookabaddie] = 400;
	global.reset_timer[obj_trash] = 100
	global.reset_timer[obj_invtrash] = 100
	global.reset_timer[obj_robot] = 150
	global.reset_timer[obj_kentukykenny] = 200
	global.reset_timer[obj_kentukylenny] = 200
	global.reset_timer[obj_pizzard] = 100
	global.reset_timer[obj_pepgoblin] = 200
	global.reset_timer[obj_pepbat] = 200
	global.reset_timer[obj_swedishmonkey] = 200
	global.reset_timer[obj_rancher] = 100
	global.reset_timer[obj_pickle] = 200
	global.reset_timer[obj_tank] = 100
	global.reset_timer[obj_thug_blue] = 60
	global.reset_timer[obj_thug_green] = 60
	global.reset_timer[obj_thug_red] = 60
	global.reset_timer[obj_smokingpizzaslice] = 10
	global.reset_timer[obj_miniufo] = 100
	global.reset_timer[obj_kentukybomber] = 100
	global.reset_timer[obj_miniufo_grounded] = 100
	global.reset_timer[obj_farmerbaddie2] = 100
	global.reset_timer[obj_farmerbaddie3] = 100
}
angle = 0;
mach4mode = false;
railmomentum = false;
railmovespeed = 0;
raildir = 1;
boxxed = false;
boxxeddash = false;
boxxeddashbuffer = 0;
cheesepeptimer = -1;
cheeseballbounce = 0;
slopejump = false;
slopejumpx = 0;
hooked = false;
swingdingendcooldown = 0;
crouchslipbuffer = 0;
breakdance_speed = 0.25;
notecreate = 50;
jetpackbounce = false;
firemouthflames = false;
ghostdash = false;
ghostpepper = 0;
ghosteffect = 0;
ghostbump = 1;
ghostbumpbuffer = -1;
dashcloudtimer = 0;
grabclimbbuffer = 0;
gustavohitwall = false;
gusdashpadbuffer = 0;
holycross = 0;
knightdowncloud = false;
piledrivereffect = 0;
fireasslock = false;
pistolcharge = 0;
pistolcharged = false;
pistolchargebuffer = 0;
pistolchargedelay = 5;
pistolchargeshooting = false;
pistolchargeshot = 8;
pistolchargeeffect = 0;
gravesurfingjumpbuffer = 0;
spinsndbuffer = 5;
boxxedspinbuffer = 0;
noisebossscream = false;

// pto new
smoothx = 0;
oldHallway = false;
noisetype = 0;
input_buffer_pistol = 0;
input_buffer_grab = 0;
keydoor = false;
pistol = false;
jetpackcancel = false;
suplexmove2 = false;
