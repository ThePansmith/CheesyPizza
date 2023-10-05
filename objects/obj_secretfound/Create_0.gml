global.secretfound++;
	
var val = min(global.secretfound, 3);
var count = 3;
var txt = lang_get_value(val == 1 ? "secret_text1" : "secret_text2");
				
if global.leveltosave == "etb"
	count = 2;
				
txt = embed_value_string(txt, [val, count]);
create_transformation_tip(txt);

fmod_event_one_shot("event:/sfx/misc/secretfound");
