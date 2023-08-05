title_index += 0.35;
if (title_index >= 2)
	title_index = frac(title_index);
image_index = (title * 2) + title_index;
if image_index > sprite_get_number(sprite_index)
{
	image_index -= sprite_get_number(sprite_index);
	very = true;
}
paletteselect = 0;
vsp -= 1;

y = ystart;
if sugary
{
	if title <= 24
	{
		image_index = title;
		y -= 50;
	}
	else
		visible = false;
}
if bo
{
	if image_alpha > 0
	    image_alpha -= 0.05;
	else
	    instance_destroy();
	
	if image_xscale < 1
	    image_xscale = Approach(image_xscale, 1, 0.1);
	if image_angle != 360 && type == 2
	    image_angle += 30;
	
	if image_alpha < 1
	{
	    image_xscale = Approach(image_xscale, 5, 0.05);
	    image_yscale = Approach(image_yscale, 5, 0.05);
	}
}
