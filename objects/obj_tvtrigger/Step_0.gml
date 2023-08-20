if (prompt_array != noone && prompt_condition != noone && prompt_condition())
{
	if !in_saveroom()
	{
		tv_push_prompt_array(prompt_array);
		add_saveroom();
		instance_destroy();
	}
}
