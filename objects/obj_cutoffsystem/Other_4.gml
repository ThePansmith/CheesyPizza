for(var i = 0; i < array_length(cutoffs); i++)
{
	var c = cutoffs[i];
	if c.buffer <= 0
	{
		delete cutoffs[i];
		array_delete(cutoffs, i, 1);
		i--;
	}
}
