enum menutype
{
	toggle,
	multiple,
	press,
	slide
}

// functions
function menu_goto(menu_id)
{
	with obj_option
	{
		menu = 0;
		for (var i = 0, n = array_length(menus); i < n; ++i)
		{
			if menus[i].menu_id == menu_id
			{
				menu = i;
				break;
			}
		}
		optionselected = 0;
	}
}
function create_menu_fixed(_menuid, _anchor, _xpad, _ypad, _backmenu = MENUS.main)
{
	return 
	{
		menu_id: _menuid,
		type: menutype.toggle,
		anchor: _anchor,
		xpad: _xpad,
		ypad: _ypad,
		backmenu: _backmenu,
		options: []
	};
}
function add_option_press(_menu, _optionid, _name, _func = noone)
{
	var b = 
	{
		option_id: _optionid,
		type: menutype.press,
		name: _name,
		localization: true,
		tooltip: ""
	};
	b.func = live_method(b, _func); // makes the scope of the function the struct, not obj_option.
	array_push(_menu.options, b);
	return b;
}
function add_option_toggle(_menu, _optionid, _name, _onchanged = noone)
{
	var b = 
	{
		option_id: _optionid,
		type: menutype.toggle,
		value: false,
		name: _name,
		tooltip: ""
	};
	b.on_changed = live_method(b, _onchanged);
	array_push(_menu.options, b);
	return b;
}
function add_option_multiple(_menu, _optionid, _name, _values, _onchanged = noone)
{
	var b = 
	{
		option_id: _optionid,
		type: menutype.multiple,
		values: _values,
		value: 0,
		name: _name,
		tooltip: ""
	};
	b.on_changed = live_method(b, _onchanged);
	array_push(_menu.options, b);
	return b;
}
function create_option_value(_name, _value, _localization = true)
{
	return 
	{
		name: _name,
		value: _value,
		localization: _localization
	};
}
function add_option_slide(_menu, _optionid, _name, _onmove = noone, _onchanged = noone, _sound = noone)
{
	var b = 
	{
		option_id: _optionid,
		type: menutype.slide,
		value: 100,
		moved: false,
		name: _name,
		on_move: _onmove,
		slidecount: 0,
		moving: false,
		sound: noone,
		tooltip: ""
	};
	b.on_changed = live_method(b, _onchanged);
	if _sound != noone
		b.sound = fmod_event_create_instance(_sound);
	array_push(_menu.options, b);
	return b;
}
