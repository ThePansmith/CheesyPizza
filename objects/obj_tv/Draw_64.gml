// snick rematch vignette
if ((room == dungeon_10 or room == dungeon_9 or room == snick_challengeend) && global.snickchallenge && global.snickrematch)
{
	draw_sprite_ext(spr_vignette, 0, 0, 0, 1, 1, 0, c_white, random_range(0.8, 0.9));
	instance_destroy(obj_baddie, false);
	instance_destroy(obj_baddiespawner, false);
}

// snick rematch jumpscare
if jumpscare > -1
{
	jumpscare--;
	
	if irandom(2) == 0
		jumpscareimage = irandom(sprite_get_number(spr_scares) - 1);
	
	if jumpscare <= 5
		draw_sprite(spr_scares_txt, jumpscaretext, 0, 0);
	else
		draw_sprite(spr_scares, jumpscareimage, 0, 0);
}

draw_set_font(lang_get_font("bigfont"));
draw_set_halign(fa_center);
draw_set_color(c_white);
draw_set_alpha(1);

if room == editor_room or is_bossroom() or instance_exists(obj_tutorialbook)
	exit;

if global.hud == 1
	scr_tvdraw_old();
else
	scr_tvdraw();
