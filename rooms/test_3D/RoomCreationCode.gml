global.FOV = 90;
global.camx = 0;	
global.camy = 0;	


/*
layer_script_begin("Tiles_1", function()
{
	shader_set(shd_passthrough);
	

	var projmat = matrix_build_projection_perspective_fov(global.FOV, 960/540, 10, 30000);
	var dist = 400;
	gpu_set_ztestenable(true);
	gpu_set_alphatestenable(true);
	gpu_set_texrepeat(true);
	camera_set_view_mat(view_camera[0], matrix_build_lookat(global.camx, global.camy - 50, dist, global.camx, global.camy, 0, 0, 1, 0));
	camera_set_proj_mat(view_camera[0], projmat);
	//matrix_set(matrix_world, matrix_build(0, 0, 0, 0, 0, 0, 2, 2, 2));
	//matrix_set(matrix_view, matrix_build_lookat(960, 540 - 50, dist, 960, 540, 0, 0, 1, 0))
	camera_apply(view_camera[0]);
});

layer_script_end("Tiles_1", function()
{
	shader_reset();
	matrix_set(matrix_world, matrix_build_identity());
	

	camera_set_view_mat(view_camera[0], matrix_build_lookat(960, 960, -10, 960, 540, 0, 0, 1, 0));
	camera_set_proj_mat(view_camera[0], matrix_build_projection_ortho(960, 960, -32000.0, 32000.0))
});
*/