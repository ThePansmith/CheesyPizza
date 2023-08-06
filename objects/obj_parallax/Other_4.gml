live_auto_call;

if room_started
	exit;
room_started = true;

// boss backgrounds ignore new system
old_bg = false;
if string_starts_with(room_get_name(room), "boss") or room == Longintro
	old_bg = true;

// fuck
var layers = layer_get_all();
for (var i = 0; i < array_length(layers); i++)
{
	var lay = layers[i];
	if !layer_exists(lay)
		exit;
	
	var layname = layer_get_name(lay);
	
	#region LAYER DEPTHS
	
	// Tiles
	if string_starts_with(layname, "Tiles_BG")
	{
		var no = string_digits(layname);
		if no != ""
			no = real(no) - 1;
		else
			no = 0;
		
		layer_depth(lay, 200 - no);
	}
	else if string_starts_with(layname, "Tiles_Foreground")
	{
		var no = string_digits(layname);
		if no != ""
			no = real(no);
		else
			no = 0;
		
		layer_depth(lay, 100 - no);
	}
	else if string_starts_with(layname, "Tiles_")
	{
		var no = string_digits(layname);
		if no != ""
			no = real(no) - 1;
		else
			no = 0;
		
		layer_depth(lay, 100 - no);
	}
	
	// Assets
	if string_starts_with(layname, "Assets_BG")
	{
		var no = string_digits(layname);
		if no != ""
			no = real(no) - 1;
		else
			no = 0;
		
		layer_depth(lay, 201 + no);
	}
	if string_starts_with(layname, "Assets_FG")
	{
		var no = string_digits(layname);
		if no != ""
			no = real(no) - 1;
		else
			no = 0;
		
		layer_depth(lay, -350 - no);
	}
	
	// Backgrounds
	var bgid = layer_background_get_id(lay);
	if bgid != -1 && !old_bg && layer_background_get_sprite(bgid) != bg_etbbrick
	{
		/*
		if 1000 + layer_get_depth(lay) < 16000
			layer_depth(lay, 1000 + layer_get_depth(lay));
		*/
		
		if layer_get_depth(lay) > 0
		{
			layer_depth(lay, 16000);
			array_push(background_layers, lay);
		}
	}
	
	#endregion
	#region ASSET PARALLAX
	
	var assetlay = array_get_index(asset_layers, layname);
	if assetlay != -1
	{
		var p = asset_parallax[assetlay];
		var q = layer_get_all_elements(lay);
		
		for (var j = 0; j < array_length(q); j++)
		{
			var _asset = q[j];
			
			var _x = layer_sprite_get_x(_asset);
			var _y = layer_sprite_get_y(_asset);
			var spr = layer_sprite_get_sprite(_asset);
			
			if p[0] != 0
				layer_sprite_x(_asset, _x - _x * p[0] + (SCREEN_WIDTH / 4) * p[0]);
			if p[1] != 0 && spr != spr_industrialpipe && spr != bg_farmdirtwall
				layer_sprite_y(_asset, _y - _y * p[1] + (SCREEN_HEIGHT / 4) * p[1]);
		}
	}
	
	#endregion
	#region HIDE TILES
	
	if global.hidetiles && layer_tilemap_get_id(lay) != -1
		layer_set_visible(lay, false);
	
	#endregion
	#region AUTO-FOREGROUND
	
	if layname == "Foreground_A"
	{
		var spr = layer_background_get_sprite(bgid);
		if sprite_exists(spr)
		{
			var ht = sprite_get_height(spr);
			
			var yy = ceil((room_height - ht) + (room_height - ht) * 0.15);
			if spr == fg_entrance1
				yy += 24;
			yy = floor(yy / 10) * 10;
			
			layer_y(lay, yy);
		}
	}
	
	#endregion
	#region SUGARY
	
	if string_starts_with(layname, "Backgrounds_Ground")
	{
		var spr = layer_background_get_sprite(bgid);
		if sprite_exists(spr)
		{
			var ht = sprite_get_height(spr);
			layer_y(lay, ceil((room_height - ht) + (room_height - ht) * 0.15));
		}
	}
	
	#endregion
}

// some more depths
layer_depth("Foreground_1", -400);
layer_depth("Foreground_Ground1", -401);

// waving backgrounds
bg_zigzag1_offset = layer_get_vspeed("Backgrounds_zigzag1");
bg_zigzag2_offset = layer_get_vspeed("Backgrounds_zigzag2");
bg_ZH1_offset = layer_get_vspeed("Backgrounds_stillZH1");
bg_ZH2_offset = layer_get_vspeed("Backgrounds_stillZH2");

layer_vspeed("Backgrounds_zigzag1", 0);
layer_vspeed("Backgrounds_zigzag2", 0);
layer_vspeed("Backgrounds_stillZH1", 0);
layer_vspeed("Backgrounds_stillZH2", 0);

// panic bg
/*
if (global.panic or global.snickchallenge) && global.panicbg && !instance_exists(obj_ghostcollectibles)
	scr_panicbg_init();
*/

// coded in backgrounds
if !instance_exists(obj_ghostcollectibles)
{
    // change color of entryway effect layer
    if global.leveltosave == "entryway"
    {
        var layerfx = layer_get_fx("Effect_1");
        if layerfx != -1
        {
            if global.panic or room == entryway_11 // nighttime color
                fx_set_parameter(layerfx, "g_TintCol", [216 / 255, 183 / 255, 228 / 255, 1]);
            else // normal sunset color
                fx_set_parameter(layerfx, "g_TintCol", [255 / 255, 221 / 255, 204 / 255, 1]);
        }
    }
}
