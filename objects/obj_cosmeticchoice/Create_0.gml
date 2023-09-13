//live_auto_call;
event_inherited();

image_speed = 0.35;

// init
sel = {
	side: 0,
	hat: 0,
	pet: 0
};
hats = [];
pets = [];

select = function()
{
	anim_con = 2;
	
	with obj_player
	{
		hat = other.hats[other.sel.hat].hat;
		pet = other.pets[other.sel.pet].pet;
		
		sound_play("event:/sfx/misc/collecttoppin");
	}
}
draw = function(curve)
{
	// hat
	var hat = hats[sel.hat];
	draw_sprite_ext(hat.sprite, -1, lerp(0, 960, 0.3), 540 / 2 + charshift[0], 2, 2, 0, c_white, charshift[2]);
	
	// pet
	var pet = pets[sel.pet];
	draw_sprite_ext(pet.sprite, -1, lerp(0, 960, 0.7), 540 / 2 + charshift[1], 2, 2, 0, c_white, charshift[3]);
	
	// text
	draw_set_font(global.bigfont);
	draw_set_align(fa_left);
	
	var str = string_upper(hat.name), xx = lerp(0, 960, 0.3) - string_width(str) / 2;
	for(var i = 1; i <= string_length(str); i++)
	{
		// hat
		var char = string_char_at(str, i);
		var yy = 380;
		
		var d = (i % 2 == 0) ? -1 : 1;
		var _dir = floor(Wave(-1, 1, 0.1, 0));
		yy += _dir * d;
		
		draw_text(round(xx), yy, char);
		xx += string_width(char);
	}
	
	var str = string_upper(pet.name), xx = lerp(0, 960, 0.7) - string_width(str) / 2;
	for(var i = 1; i <= string_length(str); i++)
	{
		// pet
		var char = string_char_at(str, i);
		var yy = 380;
		
		var d = (i % 2 == 0) ? -1 : 1;
		var _dir = floor(Wave(-1, 1, 0.1, 0));
		yy += _dir * d;
		
		draw_text(round(xx), yy, char);
		xx += string_width(char);
	}
	
	draw_set_font(global.font_small);
	draw_set_align(fa_center);
	draw_text_ext(lerp(0, 960, 0.3), 420, hat.desc, 16, 400);
	draw_text_ext(lerp(0, 960, 0.7), 420, pet.desc, 16, 400);
	
	switch sel.side
	{
		case 0: handx = lerp(handx, lerp(0, 960, 0.3) - 70, 0.25); break;
		case 1: handx = lerp(handx, lerp(0, 960, 0.7) - 70, 0.25); break;
	}
	draw_sprite_ext(spr_skinchoicehand, 0, handx, 200, 2, 2, 0, c_white, 1);
}
charshift = [0, 0, 1, 1];
handx = 0;

function add_hat(hat, sprite, name = "HAT", desc = "loypoll please add details", entry = "")
{
	array_push(hats, {hat: hat, sprite: sprite, name: name, desc: desc});
}
function add_pet(pet, sprite, name = "HAT", desc = "loypoll please add details", entry = "")
{
	array_push(pets, {pet: pet, sprite: sprite, name: name, desc: desc});
}

// hats
add_hat(-1, spr_nocosmetic, "No Hat", "Don't you already have a hat?");
add_hat(0, spr_cowboyhat, "Cowboy Hat", "Yeehaw!");

// pets
add_pet(-1, spr_nocosmetic, "No Pet", "All alone...");
add_pet(PET.noiserat, spr_playerN_cheesedidle, "Noi", "se");
add_pet(PET.berry, spr_petberry_idle, "Berry", "The one and only blue tin can.");
add_pet(PET.sneck, spr_petsneck_idle, "Sneck", "He's here for you.");
add_pet(PET.boykiss, spr_petboykiss_idle, "Boykisser", "me when uhmmm ummm men men boys i like boys i'm a boy liker i like kissing men on the lips");
add_pet(PET.willigie, spr_petwilligie_idle, "Willigie", "McPig's original character!");
add_pet(PET.rush, spr_petrush_idle, "Mini Rush", "Unknown innofensive creature, or dog.\nFeed him with mayo.");

// auto select
for(var i = 0; i < array_length(hats); i++)
{
	if obj_player1.hat == hats[i].hat
		sel.hat = i;
}
for(var i = 0; i < array_length(pets); i++)
{
	if obj_player1.pet == pets[i].pet
		sel.pet = i;
}
