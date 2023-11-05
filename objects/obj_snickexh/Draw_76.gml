if lockcam
{
	x = camera_get_view_x(view_camera[0]) + xcam;
	y = camera_get_view_y(view_camera[0]) + ycam;
}
else
{
	x = xcam;
	y = ycam;
}