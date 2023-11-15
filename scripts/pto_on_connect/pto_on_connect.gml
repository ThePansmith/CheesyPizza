function pto_on_connect()
{
	var packeter = new Packeter(EventType.PlayerJoin);
	packeter.Write(buffer_string, GM_version);
	packeter.Write(buffer_text, username);
	packeter.Send();
}
