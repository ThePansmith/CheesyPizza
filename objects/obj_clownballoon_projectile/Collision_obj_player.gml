if (other.clowntimer <= 0)
{
	create_particle(x, y, particle.genericpoofeffect);
	other.movespeed = 10;
	other.state = states.mach2;
	other.skateboarding = true;
	other.clowntimer = 150;
}
