if !player_attached
{
	if !collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, obj_player, false, false)
		cooldown = false;
		
	exit;
}

with obj_player
{
	y = other.player_collide_y;
	x = (other.x + (sprite_get_xoffset(other.player_spr)) / 2); // RX: Center player so we can SPEEN
	hsp = 0;
	hsp_carry = 0;
	vsp = 0;
	vsp_carry = 0;
	image_speed = 0.35 + ((other.player_collide_speed / 12));	
}
if input_cooldown
{
	if (obj_player.key_jump || obj_player.key_jump2)
		exit;
		
	input_cooldown = false;
}

if !(obj_player.key_jump || obj_player.key_jump2) // RX: Do we launch player?
	exit;

var left = obj_player.key_left == -1 || obj_player.key_left2  == -1 ? -1 : 0;
var right = obj_player.key_right == 1 || obj_player.key_right2  == 1 ? 1 : 0;

var player_dir = left + right;

if player_dir == 0
	exit;
cooldown = true;
player_attached = false;

with obj_player
{
	machhitAnim = false;
	state = states.mach3;
	sprite_index = spr_mach;
	movespeed = (other.player_collide_speed * (1.25 * abs(player_dir)));
	vsp = -5;
	xscale = player_dir;
	dir = xscale;
	hsp = xscale * movespeed;
}


trace($"Player released with: {obj_player.hsp}, caught with {player_collide_speed}");