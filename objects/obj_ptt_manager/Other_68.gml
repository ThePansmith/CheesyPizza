if !Online exit;

try {
    switch async_load[?"type"] {
        case network_type_data:
            global.Net_LastMsg = 0
				
            var data = json_parse(buffer_read(async_load[?"buffer"], buffer_text))
            buffer_seek(async_load[?"buffer"], buffer_seek_start, 0)
				
			switch (data.type) {
	            case 5:
	                global.Net_Name = data.name
					global.Net_ID = data.id
	                global.Net_Admin = data.admin
	                global.Net_Logged = data.loggedIn
	                global.Net_PlayerCount = data.onlineCnt
                        
	                with (obj_chat) {
						if (ds_list_size(text_list) > 0) {
							var ms = data.msgs[array_length(data.msgs) - 1]
							if ds_list_find_value(text_list, ds_list_size(text_list) - 1)[2] != ms.mid && ms.mid != -1 {
								if ms.id == global.Net_ID {
									with (obj_player1) {
										if !is_undefined(bubble)
											instance_destroy(bubble)
										with (instance_create(x, y, obj_textbubble)) {
											msg = ms.body
											player = other
											other.bubble = self
										}
									}
								} else
									with (global.Net_Clients[?string(ms.id)]) {
										if !is_undefined(bubble)
											instance_destroy(bubble)
										with (instance_create(x, y, obj_textbubble)) {
											msg = ms.body
											player = other
											other.bubble = self
										}
									}
							}
						}
								
	                    ds_list_clear(text_list)
	                    for (var i = 0; i < array_length(data.msgs); i++) {
							var m = data.msgs[i]
							if (m.username == "") continue
	                        ds_list_add(text_list, [debug_text_type.msg, data.admin ? m.username + " (" + string(m.id) + ")" + ": " + m.body : m.username + ": " + m.body, m.mid]);    
	                    }
	                }
					
					// DEAL WITH CLIENTS
					array_foreach(data.clients, function(c) {						
						if !ds_map_exists(global.Net_Clients, string(c.id))
							ds_map_add(global.Net_Clients, string(c.id), instance_create(c.x, c.y, obj_player_other))
						global.Net_Clients[?string(c.id)].data = c
					})
					
					var arr = ds_map_keys_to_array(global.Net_Clients)
					if is_undefined(arr) break
					for (var e = 0; e < array_length(arr); e++) {
						var c = arr[e]
						var found = false
						for (var i = 0; i < array_length(data.clients); i++) {
							trace(string(data.clients[i].id) + " " + c)
							if string(data.clients[i].id) == c {
								found = true
								break
							}
						}
						
						if !found {
							instance_destroy(global.Net_Clients[?c])
							ds_map_delete(global.Net_Clients, c)	
						}
					}
	                break
	            case 6:
	                global.Net_Online = true
	                break
	            case 7:
	                show_message(data.msg)
	                break
	            case 8:
	                show_message(data.msg)
	                game_end()
	                break
	            case 9:
	                create_transformation_tip($"\{s}{data.msg}/") // Makes the text shaky
	                break	
			}
	}

} catch(e) {
    show_debug_message(e.message)
}