function scr_get_languages()
{
	global.lang_map = ds_map_create();
	global.lang = "en";
	
	var arr = [];
	for (var file = file_find_first("data/lang/*.txt", 0); file != ""; file = file_find_next())
		array_push(arr, file);
	file_find_close();
	
	for (var i = 0; i < array_length(arr); i++)
	{
		var fo = file_text_open_read(concat("data/lang/", arr[i]));
		
		var str = buffer_create(64, buffer_grow, 1);
		while !file_text_eof(fo)
		{
			buffer_write(str, buffer_text, file_text_readln(fo));
			buffer_write(str, buffer_text, "\n");
		}
		file_text_close(fo);
		
		buffer_seek(str, buffer_seek_start, 0);
		lang_parse(buffer_read(str, buffer_string));
		buffer_delete(str);
	}
	global.credits_arr = scr_lang_get_credits();
}

function scr_lang_get_credits()
{
	var fo = file_text_open_read("data/credits.txt");
	var arr = array_create(0);
	while fo != -1 && !file_text_eof(fo)
	{
		array_push(arr, file_text_read_string(fo));
		file_text_readln(fo);
	}
	file_text_close(fo);
	return arr;
}

function lang_get_value(entry)
{
	var n = ds_map_find_value(ds_map_find_value(global.lang_map, global.lang), entry);
	if is_undefined(n)
		n = ds_map_find_value(ds_map_find_value(global.lang_map, "en"), entry);
	if is_undefined(n)
	{
		n = entry;
		
		/*
		instance_create_unique(0, 0, obj_langerror);
		with (obj_langerror)
			text = concat("Error: Could not find lang value \"", entry, "\"\nPlease restore your english.txt file");
		*/
	}
	return n;
}

function lang_get_value_newline(entry)
{
	return string_replace_all(lang_get_value(entry), "\\n", "\n");
}

function lang_parse(langstring) // langstring being the entire file in a single string
{
	var list = ds_list_create();
	lang_lexer(list, langstring);
	var map = lang_exec(list);
	var lang = ds_map_find_value(map, "lang");
	ds_map_set(global.lang_map, lang, map);
	ds_list_destroy(list);
}

enum lexer
{
	set,
	name,
	value,
	keyword,
	eof
}

function lang_lexer(list, str)
{
	var len = string_length(str);
	var pos = 1;
	while pos <= len
	{
		var start = pos;
		var char = string_ord_at(str, pos);
		pos += 1;
		
		switch (char)
		{
			case ord(" "):
			case ord("	"): // horizontal tab
			case ord("\r"): // carriage return
			case ord("\n"): // newline
				break;
			
			case ord("#"):
				while pos <= len
				{
					char = string_ord_at(str, pos);
					if char == ord("\r") || char == ord("\n")
						break;
					pos += 1;
				}
				break;
			
			case ord("="):
				ds_list_add(list, [lexer.set, start]);
				break;
			
			case ord("\""):
				while pos <= len
				{
					char = string_ord_at(str, pos);
					if char != ord("\"") || string_ord_at(str, pos - 1) == ord("\\")
						pos += 1;
					else
						break;
				}
				
				if pos <= len
				{
					var val = string_copy(str, start + 1, pos - start - 1);
					string_replace_all(val, "\\\"", "\"");
					ds_list_add(list, [lexer.value, start, val]);
					pos += 1;
				}
				else
					exit;
				
				break;
			
			default:
				if lang_get_identifier(char, false)
				{
					while pos <= len
					{
						char = string_ord_at(str, pos);
						if lang_get_identifier(char, true)
							pos += 1;
						else
							break;
					}
					
					var name = string_copy(str, start, pos - start);
					switch name
					{
						case "false":
							ds_list_add(list, [lexer.keyword, start, false]);
							break;
						case "noone":
							ds_list_add(list, [lexer.keyword, start, noone]);
							break
						case "true":
							ds_list_add(list, [lexer.keyword, start, true]);
							break;
						default:
							ds_list_add(list, [lexer.name, start, name]);
					}
				}
				break;
		}
	}
	ds_list_add(list, [lexer.eof, len + 1]);
}

function lang_get_identifier(keycode, allow_numbers)
{
	if allow_numbers
		return keycode == ord("_") || (keycode >= ord("a") && keycode <= ord("z")) || (keycode >= ord("A") && keycode <= ord("Z")) || (keycode >= ord("0") && keycode <= ord("9"));
	else
		return keycode == ord("_") || (keycode >= ord("a") && keycode <= ord("z")) || (keycode >= ord("A") && keycode <= ord("Z"));
}

function lang_exec(token_list) // HAHAHA
{
	var map = ds_map_create();
	var len = ds_list_size(token_list);
	
	var pos = 0;
	while pos < len
	{
		var q = ds_list_find_value(token_list, pos++);
		switch q[0]
		{
			case lexer.set: // 0 is enum
				var ident = array_get(ds_list_find_value(token_list, pos - 2), 2);
				var val = array_get(ds_list_find_value(token_list, pos++), 2);
				ds_map_set(map, ident, val);
				break;
		}
	}
	return map;
}

function lang_get_custom_font(fontname, language)
{
	var _dir = concat(fontname, "_dir");
	if !is_undefined(ds_map_find_value(language, _dir))
	{
		var font_map = ds_map_find_value(language, concat(fontname, "_map"));
		var font_size = string_length(font_map);
		var font_sep = ds_map_find_value(language, concat(fontname, "_sep"));
		font_sep = real(font_sep);
		var font_xorig = 0;
		var font_yorig = 0;
		var spr = sprite_add(concat("lang/", ds_map_find_value(language, _dir)), font_size, false, false, font_xorig, font_yorig);
		
		return font_add_sprite_ext(spr, font_map, 0, font_sep);
	}
	else
		return lang_get_font(fontname);
}

function lang_get_font(fontname)
{
	var n = ds_map_find_value(global.font_map, lang_get_value(fontname));
	if !is_undefined(n)
		return n;
	return ds_map_find_value(global.font_map, concat(fontname, "_en"));
}
