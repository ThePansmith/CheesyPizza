/// @func launch_external(path, parameters)
/// @desc Launches an external application
/// @param	{string}	path	The path to the executable to execute
/// @param	{string}	parameters	The parameters to pass to the exectuable
/// @return {bool}	Returns true if successful
function launch_external(_path, _parameters = "")
{
	return ptcu_launch_external(_path, _parameters);
}