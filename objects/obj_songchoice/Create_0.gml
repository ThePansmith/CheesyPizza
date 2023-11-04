live_auto_call;
event_inherited();

// init
sel = {
	game: 0,
	song: 0
};
if global.jukebox != noone
{
	sel.game = global.jukebox.sel.game;
	sel.song = global.jukebox.sel.song;
}

charshift = [0, 0, 1];
discrot = 0;
dumbass = false;

// sections
sections = [];
add_section = function(name, songs)
{
	var struct = {name: name, songs: songs};
	array_push(sections, struct);
	return struct;
}

// get events from FMOD
var pizzatower = [];
var sugaryspire = [];
var cheesedup = [];
var custom = [];

var events = fmod_soundtest_get_events(FMOD_BANK_MUSIC);
trace("Events: ", events);

for(var i = 0; i < events; i++)
{
	var category = fmod_soundtest_get_song_category(i);
	var arr = [fmod_soundtest_get_song_event(i), fmod_soundtest_get_song_name(i)];
	
	var split = fmod_soundtest_get_song_index(i);
	if split >= 0
	{
		switch category
		{
			case 0: pizzatower[split] = arr; break;
			case 1: cheesedup[split] = arr; break;
			case 2: sugaryspire[split] = arr; break;
			case 3: custom[split] = arr; break;
		}
	}
	else switch category
	{
		case 0: array_push(pizzatower, arr); break;
		case 1: array_push(cheesedup, arr); break;
		case 2: array_push(sugaryspire, arr); break;
		case 3: array_push(custom, arr); break;
	}
}

if array_length(pizzatower) > 0
	add_section("Pizza Tower", pizzatower);
if array_length(cheesedup) > 0
	add_section("Cheesed Up", cheesedup);
if array_length(sugaryspire) > 0
	add_section("Sugary Spire", sugaryspire);
if array_length(custom) > 0
	add_section("Custom", custom);

// failsafe
if array_length(sections) == 0
	add_section("Failsafe", [["event:/music/pizzatime", "It's Pizza Time - MrSauceman"]]);

scroll = -50;
textx = 0;

draw = function(curve)
{
	draw_set_spotlight(SCREEN_WIDTH / 2, SCREEN_HEIGHT / 2, (SCREEN_WIDTH / (960 / 560)) * curve);
	
	// background and disc
	var talpha = 1;
	
	draw_set_colour(c_black);
	draw_set_alpha(0.75);
	draw_rectangle(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT, false);
	draw_set_alpha(1);
	draw_set_colour(c_white);
	
	draw_sprite_ext(bg_jukeboxdisc, sel.game, 640, 280, 2, 2, discrot, c_white, talpha * 0.8);
	
	// current song
	var ballsack = string_split(sections[sel.game].songs[sel.song][1], " - ", false, 1);
	var _palname = string_upper(ballsack[0]);
	var _paldesc = ballsack[1];
	
	draw_set_alpha(charshift[2]);
	draw_set_align(fa_center, fa_bottom);
	draw_set_font(global.bigfont);
	draw_text_ext((SCREEN_WIDTH / 1.5) + random_range(-1, 1), SCREEN_HEIGHT - 250 + charshift[1], _palname, 32, 540);
	
	draw_set_valign(fa_top);
	draw_set_font(global.font_small);
	draw_text_ext(SCREEN_WIDTH / 1.5, SCREEN_HEIGHT - 240 + charshift[1], _paldesc, 16, 960 - 32);
	
	draw_set_alpha(1);
	
	// game names
	var sep = 640 / array_length(sections);
	var lerpish = 0.5;
	
	for(var i = 0; i < array_length(sections); i++)
	{
		if array_length(sections) > 1
			lerpish = i / (array_length(sections) - 1)
		
		draw_set_colour(sel.game == i ? c_white : c_gray);
		draw_text(lerp(sep, SCREEN_WIDTH - sep, i / (array_length(sections) - 1)), 32, sections[i].name);
	}
	
	// song list
	draw_set_halign(fa_left);
	
	draw_reset_clip();
	draw_set_bounds(64 + charshift[0], 0, 364 + charshift[0], SCREEN_HEIGHT);
	if curve < 1
		draw_set_spotlight(SCREEN_WIDTH / 2, SCREEN_HEIGHT / 2, (SCREEN_WIDTH / (960 / 560)) * curve, false, true);
	//shader_set(shd_rectclip);
	//var clip = shader_get_uniform(shd_rectclip, "u_clip_bounds");
	//shader_set_uniform_f_array(clip, [64 + charshift[0], 0, 364 + charshift[0], 540]);
	
	var scroller = max((sel.song - 8) * 16, 0);
	for(var i = 0; i < array_length(sections[sel.game].songs); i++)
	{
		var yy = 128 + i * 16;
		yy -= scroller;
	
		if yy < 0
			continue;
		if yy > 540
			break;
	
		if yy <= 128
			draw_set_alpha((yy / 128) * talpha);
		if yy > 540 - 128
			draw_set_alpha(((540 - yy) / 128) * talpha);
		
		draw_set_colour(sel.song == i ? c_white : c_ltgray);
		
		var song = sections[sel.game].songs[i];
		if is_array(song)
		{
			var ballsack = string_split(song[1], " - ", false, 1);
			var str = string_replace_all(ballsack[0], "\n", " ");
			
			var textwidth = round(string_width(str) - 300);
			if sel.song == i
			{
				scroll++;
				if scroll >= textwidth + 50
					scroll = -50;
			}
			
			draw_text(64 + charshift[0] - (clamp(scroll, 0, max(textwidth, 0)) * (sel.song == i)), yy + textx, str);
		}
		else
		{
			// section
			
		}
	}
	
	draw_reset_clip();
	if curve < 1
		draw_set_spotlight(SCREEN_WIDTH / 2, SCREEN_HEIGHT / 2, (SCREEN_WIDTH / (960 / 560)) * curve, false, false);
	draw_set_alpha(talpha);
	draw_sprite(spr_cursor, -1, 64 - 36 + xo + charshift[0], 128 + 10 - scroller + sel.song * 16 + textx);
	
	draw_set_align();
	draw_reset_clip();
	if curve < 1
		draw_set_spotlight(SCREEN_WIDTH / 2, SCREEN_HEIGHT / 2, (SCREEN_WIDTH / (960 / 560)) * curve, false, true);
	else
		draw_reset_clip();
	
	// song position
	var pos = 0;
	if global.jukebox != noone && sections[sel.game].songs[sel.song][0] == global.jukebox.name
	{
		pos = (fmod_event_instance_get_timeline_pos(global.jukebox.instance) / fmod_event_get_length(global.jukebox.name)) * 480;
		discrot -= 1;
	}
	
	draw_set_colour(c_gray);
	draw_rectangle(400, 350 + charshift[1], 400 + 480, 350 + 15 + charshift[1], false);
	draw_set_colour(c_white);
	draw_rectangle(400, 350 + charshift[1], 400 + pos, 350 + 15 + charshift[1], false);
	draw_circle(400 + pos, 350 + 15 / 2 + charshift[1], 15, false);
	draw_set_colour(c_black);
	draw_circle(400 + pos, 350 + 15 / 2 + charshift[1], 15, true);
	
	// kohn offset X: 13 y:: 20
	/*
	var timer_x =(640 - sprite_get_width(spr_timer_bar) / 2)
	var timer_y = (350 + charshift[1]) - (sprite_get_height(spr_timer_bar) / 4);
	draw_sprite(spr_timer_bar, 0, timer_x, timer_y);
	
	var timer_john_x = timer_x + 13;
	var timer_john_x_lim = (timer_x + sprite_get_width(spr_timer_bar) - 26);
	
	var music_offset = global.jukebox == noone ? 0 : (fmod_event_instance_get_timeline_pos(global.jukebox.instance) / fmod_event_get_length(global.jukebox.name));
	
	var pixel_offset = ((timer_x + sprite_get_width(spr_timer_bar) - 13) - (timer_john_x)) * music_offset;
	draw_sprite(global.jukebox == noone ? spr_jukebox_john_idle : spr_jukebox_john_active, -1, timer_john_x + pixel_offset, timer_y + 11);
	draw_set_alpha(1);
	*/
}
xo = 0;
