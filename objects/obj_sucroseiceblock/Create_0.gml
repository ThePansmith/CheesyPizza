scr_initenemy();
image_speed = 0
color_index = 0
color = { 
	light: #ffa4a4, 
	dark: #cc5b5b 
}
invtime = 0
grounded = false;
flash = false;
state = states.idle
substate = 0
hsp = 0
vsp = 0
thrown = 0
stunned = 0
movespeed = 0
grav = 0.5
grav2 = 0.5
xscale = 1
touching = 0
contentsurf = -4;
contentspr = -4;
hp = 999;
stunfallspr = sprite_index;
destroyable = false;
dashpadbuffer = false;

lag = function()
{
	if state != states.hit
	{
		with obj_player1
		{
			tauntstoredmovespeed = movespeed;
			tauntstoredsprite = sprite_index;
			tauntstoredstate = state;
			tauntstoredhsp = hsp;
			tauntstoredvsp = vsp;
		
			hitLag = 5;
			hitX = x;
			hitY = y;
			state = states.chainsaw;
		}
	
		hithsp = hsp;
		hitvsp = vsp;
		hitLag = 5;
		hitX = x;
		hitY = y;
		state = states.hit;
	}
}
