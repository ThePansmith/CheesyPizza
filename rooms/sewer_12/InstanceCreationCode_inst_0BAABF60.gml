hsp = 1;
vsp = 0;

if global.laps >= 2
{
	if global.chasekind == 1
		instance_destroy();
	if global.chasekind == 2
	{
		hsp = 0;
		vsp = 1;
	}
}
