radieFrame += 0.30;
sunFrame += 0.20;

if (distance_to_object(obj_player1) < 250)
{
	// If we change states reset radie
	if (vengeful == false)
	{
		radieFrame = 0;
		sunFrame = 0;	
	}
	
	vengeful = true;
}
else
{
	// If we change states reset radie
	if (vengeful == true)
	{
		radieFrame = 0;
		sunFrame = 0;	
	}
	vengeful = false;
}
