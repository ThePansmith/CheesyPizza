#macro RX_OBJFILE_COMMENT_ID "#"
#macro RX_OBJFILE_COMMAND_ID "o"
#macro RX_OBJFILE_GEOMETRY_ID "v"
#macro RX_OBJFILE_NORMAL_ID "vn"
#macro RX_OBJFILE_TEXTURECOORD_ID "vt"
#macro RX_OBJFILE_POLYGONFACE_ID "f"
#macro RX_OBJFILE_USEMATERIAL_ID "usemtl"

#macro RX_OBJFILE_GEOMETRY_ID_LEN 1
#macro RX_OBJFILE_NORMAL_ID_LEN 2
#macro RX_OBJFILE_TEXTURECOORD_ID_LEN 2
#macro RX_OBJFILE_POLYGONFACE_ID_LEN 1
#macro RX_OBJFILE_USEMATERIAL_ID_LEN 6

enum rx_obj_parserhint
{
	ignore_none			 = 0b000,
	ignore_geometry_list = 0b001,
	ignore_texcoord_list = 0b010,
	ignore_normal_list   = 0b100,
}

// Returns a vertex buffer of a given OBJ file
function mdl_Load_OBJ_Model_File(filepath, format, parserHint, debug = false) 
{
	// Check for bad params
	/*
	var funcName = "rx_obj_LoadOBJModelFile";
	if (!rx_debug_CheckParameterType(funcName, "filepath", RX_GML_TYPES_STRING, filepath))
		return pointer_null;
	if (!rx_debug_CheckParameterType(funcName, "format", RX_GML_TYPES_NUMBER, format))
		return pointer_null;
	if (!rx_debug_CheckParameterType(funcName, "parserHint", RX_GML_TYPES_NUMBER, parserHint))
		return pointer_null;
	*/
	
	// Actual Function Stuff
	var objFile = file_text_open_read(filepath);
	
	if (objFile == -1)
	{
		trace($"There was an error loading OBJ file \"{filepath}\"");
		return pointer_null;	
	}

	var model = vertex_create_buffer();
	vertex_begin(model, format);
	
	var vertexGeometryList = ds_list_create();
	var vertexNormalList = ds_list_create();
	var vertexTextureCoordList = ds_list_create();
	
	var TEMP_latestUseMTL = "FFFFFF";
	
	while (!file_text_eof(objFile))
	{
		var line = file_text_readln(objFile);
		switch(string_split(line, " ")[0])
		{
			case RX_OBJFILE_COMMENT_ID:
			case RX_OBJFILE_COMMAND_ID:
			default:
			continue; // ignore it
				break; // We should never reach here, but just in case
			
			case RX_OBJFILE_GEOMETRY_ID:
				if (enum_flag_get(parserHint, rx_obj_parserhint.ignore_geometry_list))
					continue;
				var data = string_split(string_get_substring(line, RX_OBJFILE_GEOMETRY_ID_LEN + 2), " ", true);
				ds_list_add(vertexGeometryList, real(data[0]), real(data[1]), real(data[2]));
				break;
			case RX_OBJFILE_NORMAL_ID:
				if (enum_flag_get(parserHint, rx_obj_parserhint.ignore_normal_list))
					continue;
				var data = string_split(string_get_substring(line, RX_OBJFILE_NORMAL_ID_LEN + 2), " ", true);
				ds_list_add(vertexNormalList, real(data[0]), real(data[1]), real(data[2]));
				break;
			case RX_OBJFILE_TEXTURECOORD_ID:
				if (enum_flag_get(parserHint, rx_obj_parserhint.ignore_texcoord_list))
					continue;
				var data = string_split(string_get_substring(line, RX_OBJFILE_TEXTURECOORD_ID_LEN + 2), " ", true);
				ds_list_add(vertexTextureCoordList, real(data[0]), real(data[1]));
				break;
			case RX_OBJFILE_POLYGONFACE_ID:
				var faceInfoString = string_get_substring(line, RX_OBJFILE_POLYGONFACE_ID_LEN + 2);
				var faceData = string_split(faceInfoString, " ", true);
				var triData = array_create(0, "");
				var faceFormat = mdl_get_face_Format(faceInfoString);
				var triangulatedData = __rx_obj_TriangulateFaceData(faceData);
				for (var i = 0; i < array_length(triangulatedData) / 3; i++)
				{
					array_copy(triData, 0, triangulatedData, i * 3, 3);
					
					for (var v = 0; v < 3; v++)
					{
						var positionIndex = -1;
						var texCoordIndex = -1
						var normalIndex = -1;
					
					
						var vertexIndexInfo = triData;
					
						if (faceFormat != rx_obj_faceformat.vertex)
							vertexIndexInfo = string_split(triData[v], "/", true);
							
						switch (faceFormat)
						{
							case rx_obj_faceformat.invalid:
								trace($"Invalid Tri Face information: \"{faceInfoString}\"");
								return noone;
							case rx_obj_faceformat.vertex:
								if (!enum_flag_get(parserHint, rx_obj_parserhint.ignore_geometry_list))
									positionIndex = real(vertexIndexInfo[0]);
								break;
							case rx_obj_faceformat.vertex_texture:
								if (!enum_flag_get(parserHint, rx_obj_parserhint.ignore_geometry_list))
									positionIndex = real(vertexIndexInfo[0]);
								if (!enum_flag_get(parserHint, rx_obj_parserhint.ignore_texcoord_list))
									texCoordIndex = real(vertexIndexInfo[1]);
								break;
							case rx_obj_faceformat.vertex_normal:
								if (!enum_flag_get(parserHint, rx_obj_parserhint.ignore_geometry_list))
									positionIndex = real(vertexIndexInfo[0]);
								if (!enum_flag_get(parserHint, rx_obj_parserhint.ignore_normal_list))
									normalIndex = real(vertexIndexInfo[1]);
								break;
							case rx_obj_faceformat.vertex_texture_normal:
								if (!enum_flag_get(parserHint, rx_obj_parserhint.ignore_geometry_list))
									positionIndex = real(vertexIndexInfo[0]);
								if (!enum_flag_get(parserHint, rx_obj_parserhint.ignore_texcoord_list))
									texCoordIndex = real(vertexIndexInfo[1]);
								if (!enum_flag_get(parserHint, rx_obj_parserhint.ignore_normal_list))
									normalIndex = real(vertexIndexInfo[2]);
								break;
						}
					
					if (positionIndex != -1)
						vertex_position_3d(model, ds_list_find_value(vertexGeometryList, ((positionIndex - 1) * 3 + 0)), ds_list_find_value(vertexGeometryList, ((positionIndex - 1) * 3 + 1)), ds_list_find_value(vertexGeometryList, ((positionIndex - 1) * 3 + 2)));
					else
						vertex_position_3d(model, 0, 0, 0);
					
					if (debug)
					{
						var TEMP_r = string_copy(TEMP_latestUseMTL, 1, 2);
						var TEMP_g = string_copy(TEMP_latestUseMTL, 3, 2);
						var TEMP_b = string_copy(TEMP_latestUseMTL, 5, 2);
						vertex_color(model, real($"0x{TEMP_b}{TEMP_g}{TEMP_r}"), 1);
					}
					else
						vertex_color(model, 0xFFFFFF, 1);
					

					if (texCoordIndex != -1)
					{
						vertex_texcoord(model, ds_list_find_value(vertexTextureCoordList, ((texCoordIndex - 1) * 2 + 0)), ds_list_find_value(vertexTextureCoordList, ((texCoordIndex - 1) * 2 + 1)));
					}
					else
						vertex_texcoord(model, 0, 0);
					
					// wait until we have a normal shader LOL
					//if (normalIndex != -1)
					//	vertex_normal(model, ds_list_find_value(vertexNormalList, ((normalIndex - 1) * 3 + 0)), ds_list_find_value(vertexNormalList, ((normalIndex - 1)* 3 + 1)), ds_list_find_value(vertexNormalList,((normalIndex - 1) * 3 + 2)));
					//else
					//	vertex_normal(model, 0, 0, 0);
						
					}
				}
				break;
			case RX_OBJFILE_USEMATERIAL_ID:
				TEMP_latestUseMTL = string_split(string_get_substring(line, RX_OBJFILE_TEXTURECOORD_ID_LEN + 2), " ", true)[1];
				break;
				
		}
	}
	
	vertex_end(model);
	
	ds_list_destroy(vertexGeometryList);
	ds_list_destroy(vertexTextureCoordList);
	ds_list_destroy(vertexNormalList);
	
	file_text_close(objFile);
	return model;
}