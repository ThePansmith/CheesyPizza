
	shader_set(shd_passthrough);
	

	var projmat = matrix_build_projection_perspective_fov(global.FOV, 960/540, 0.1, 30000);
	var dist = 400;
	gpu_set_ztestenable(true);
	gpu_set_alphatestenable(true);
	gpu_set_texrepeat(true);
	camera_set_view_mat(view_camera[0], matrix_build_lookat(global.camx, global.camy - 50, global.camz, global.camx, global.camy, 0, 0, 1, 0));
	camera_set_proj_mat(view_camera[0], projmat);
	matrix_set(matrix_world, matrix_build(global.movex, global.movey, global.movez, global.rotx, global.roty, global.rotz, 1, 1, 1));
	//matrix_set(matrix_view, matrix_build_lookat(960, 540 - 50, dist, 960, 540, 0, 0, 1, 0))
	camera_apply(view_camera[0]);
	draw_tilemap(layer_tilemap_get_id("Tiles_1"), 0, 0);
	shader_reset();
	
	matrix_set(matrix_world, matrix_build_identity());