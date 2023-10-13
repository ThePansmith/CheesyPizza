/// @description Insert description here
exit;

event_handle_count = fmod_debug_event_handle_count();
event_handle_free_count = fmod_debug_event_handle_free_count();
event_handle_used_count = event_handle_count - event_handle_free_count;
voice_count = fmod_get_active_voices();

draw_set_font(global.smallfont);
draw_set_halign(fa_left);
draw_set_valign(fa_middle);
draw_text_color(32, 96, $"EHND Count: {event_handle_count}", c_white, c_white, c_white, c_white, 1);
draw_text_color(32, 112, $"EHND Free: {event_handle_free_count}", c_white, c_white, c_white, c_white, 1);
draw_text_color(32, 138, $"EHND Used: {event_handle_used_count}", c_white, c_white, c_white, c_white, 1);
draw_text_color(32, 154, $"Voices: {voice_count} : 32", c_white, c_white, c_white, c_white, 1);

