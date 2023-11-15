function sh_onlinetest(args)
{
	var mode = "remote";
	if array_length(args) > 1
		mode = args[1];
	
	if instance_exists(obj_onlineclient)
	{
		instance_destroy(obj_onlineclient);
		return "Disconnected";
	}
	else
	{
		with instance_create(0, 0, obj_onlineclient)
		{
			if mode == "remote"
				ip = "65.108.214.197";
			else if mode == "local"
				ip = "127.0.0.1";
			else
				ip = mode;
			event_user(0);
		}
		return "Check output";
	}
}
function meta_onlinetest()
{
	return {
		arguments: ["ip"],
		suggestions: [["remote", "local"]]
	};
}
