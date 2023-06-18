x = data.x
y = data.y

try {
	var spr = asset_get_index(data.sprite)
	if is_undefined(spr) {
		sprite_index = spr_player_hurt
		exit
	}
	if sprite_index != spr {
		if check_sprite("supertaunt") {
			if check_sprite("playerSP")
				fmod_event_one_shot_3d("event:/ptt/sfx/pizzysupertaunt", x, y);
			else
				fmod_event_one_shot_3d("event:/sfx/pep/supertaunt", x, y);
		}
		else if check_sprite("taunt") {
			instance_create(x, y, obj_baddietaunteffect)
			
			if data.paletteTexture == "spr_pattern_supreme"
				sound_play_3d("event:/ptt/sfx/instinct", x, y)
			else if check_sprite("playerSP")
				sound_play_3d("event:/ptt/sfx/pizzytaunt", x, y)
			else if check_sprite("playerN") && data.palette == 8
				sound_play_3d("event:/ptt/sfx/soapytaunt", x, y)
			else
				sound_play_3d("event:/sfx/pep/taunt", x, y)
		}
		else if string_ends_with(data.sprite, "_shotgun") {
			with instance_create(x + data.dir * 46, y + 6, obj_shotgunblast_synced)
				image_xscale = other.data.dir
		}
	}
	sprite_index = spr
	image_index = data.frame
	image_xscale = data.dir
} catch (e) {
	trace(e)
	sprite_index = spr_player_hurt
}

namecolor = data.admin ? c_orange : global.Net_Color_Others