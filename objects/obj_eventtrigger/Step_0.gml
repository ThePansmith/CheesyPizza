// If Condition is correct then output
if condition != noone && condition()
{
    if !activated || !flags.do_once
    {
		output();
		if flags.do_save && !in_saveroom(id, flags.saveroom)
			ds_list_add(flags.saveroom, id);
		
		activated = true;
    }
}
else if reverse_output != noone && condition != noone && !condition() // Reverse of the Condition
{
    if activated || !flags.do_once
    {
		reverse_output();
		activated = false;
    }
}

// Activated
if activated && flags.do_once
	instance_destroy();
