function replay_get_associated_rooms(_roomPrefix)
{
	// RadixComet: this is bad dumb code, but I don't know how to do it any better so, too bad!

	var currentRoomID = 0;
	// start at the beginning of the room list
	var currRoom = room_get_name(currentRoomID);
	
	var roomListDsListID = ds_list_create();

	while (currRoom != STRING_UNDEFINED) // iterate and find all of the associated rooms LOL
	{
		if (string_starts_with(currRoom, _roomPrefix))
			ds_list_add(roomListDsListID, currRoom);
		
		
		currentRoomID++;
		currRoom = room_get_name(currentRoomID);
	}
	return roomListDsListID;
	
}