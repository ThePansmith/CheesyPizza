enum EventType
{
	// Server -> Client
	AcceptPlayer,
	ServerClosing,

	// Client -> Server -> All clients
	PlayerJoin,
	PlayerLeft,             // send to client for kicking it.
	Update,                 // x, y, frame, state, xscale, sprite
	Variable,
	Chat,
}

enum Var
{
	Palette,
	Panic,
	Busy,
	Room,
	YScale
}
