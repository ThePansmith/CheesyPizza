instance_create(x, y, obj_genericpoofeffect)
sound_play_3d(sfx_angelmove, x, y)

angle = 0
namecolor = c_white
depth = -6
image_speed = 0

data = {
	id: -1,
	x: x,
	y: x,
	name: "",
	admin: false,
	room: Mainmenu,
	
	sprite: "spr_player_idle",
	frame: 0,
	dir: 1,
	palette: 1,
	paletteSprite: spr_peppalette,
	paletteTexture: undefined
}
function check_sprite(suffix) {
	var spr = data.sprite
	return string_pos(suffix, spr) > 0
}
	
bubble = undefined
