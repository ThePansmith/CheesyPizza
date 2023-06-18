function sh_destroy(args)
{
	if !WC_debug
		return "You do not have permission to use this command";
	if array_length(args) < 2
		return "Not enough arguments. Usage: var <instance(:index)> (<execute_event>)";
	
	// get arguments
	var pretarget = args[1];
	
	var exec = true;
	if array_length(args) > 2
		var exec = args[2];
	
	if exec == "1" or exec == "true"
		exec = true;
	else if exec == "0" or exec == "false"
		exec = false;
	
	// resolve target
	var target_one = false; // only target one instance
	var target = noone;
	
	var obj = WCscr_findobj(pretarget);
	if is_array(obj)
	{
		target = obj[0];
		target_one = obj[1];
	}
	else
		return obj;
	if target == noone // target non existent
		return "Instance " + pretarget + " doesn't exist";
	if target == all // what
		return "Not a good idea";
	
	with target
		instance_destroy(target, exec);
	
	// log
	obj = (target_one ? "object " : "all instances of object ") + string(pretarget);
	return string("Destroyed {0}", obj);
}
function meta_destroy()
{
	return
	{
		description: "destroy an instance or all instances of an object",
		arguments: ["instance", "<execute_event>"],
		suggestions: [
			function()
			{
				var obj_array = [];
				for(var i = 0; i < instance_count; i++)
				{
					var inst = instance_find(all, i);
					if !instance_exists(inst)
						continue;
					var obj = inst.object_index;
					
					for(var j = 0; j < instance_number(obj); j++)
					{
						if instance_find(obj, j).id == inst.id
							array_push(obj_array, object_get_name(obj) + ":" + string(j));
					}
				}
				array_sort(obj_array, true);
				return obj_array;
			},
			["false", "true"],
		],
		argumentDescriptions: [
			"instance or object",
			"whether to execute the destroy events or not",
		],
	}
}
