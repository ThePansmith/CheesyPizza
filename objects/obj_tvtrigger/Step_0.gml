if (prompt_array != -4 && prompt_condition != -4 && prompt_condition())
{
	if (!in_saveroom())
	{
		tv_push_prompt_array(prompt_array);
		add_saveroom();
		instance_destroy();
	}
}
