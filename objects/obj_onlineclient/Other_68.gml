var type_event = async_load[?"type"];
switch type_event
{
	case network_type_data: // received data
		var data = async_load[?"buffer"];
		buffer_seek(data, buffer_seek_start, 0);
		
		/*
		var str = "\n";
		for(var i = 0; i < buffer_get_size(data); i++)
			str += string(buffer_peek(data, i, buffer_u8)) + " ";
		show_debug_message(str + "\n");
		*/
		
		// Handle Nagle's algorithm
		var buffer_size = buffer_get_size(data);
		while true
		{
			if buffer_tell(data) >= buffer_size
				break;
			
			if splitSize == 0
			{
				if buffer_exists(headerSplit)
				{
					while buffer_tell(headerSplit) < 8
						buffer_write(headerSplit, buffer_u8, buffer_read(data, buffer_u8));
					size = buffer_read(headerSplit, buffer_u64);
					buffer_delete(headerSplit);
				}
				else if buffer_tell(data) + 8 >= buffer_size
				{
					headerSplit = buffer_create(8, buffer_fixed, 1);
					buffer_seek(headerSplit, buffer_seek_start, 0);
					
					while buffer_tell(data) < buffer_size
						buffer_write(headerSplit, buffer_u8, buffer_read(data, buffer_u8));
					break;
				}
				else
					size = buffer_read(data, buffer_u64);
			}
			if size == 0
				break;
			
			if splitSize != 0
			{
				buffer_copy(data, 8 - splitSize, size - splitSize, packetData, splitSize);
				
				pto_received_packet(buffer_read(packetData, buffer_u8), packetData);
				buffer_delete(packetData);
				
				buffer_seek(data, buffer_seek_start, size - splitSize + 8);
				splitSize = 0;
			}
			else if buffer_tell(data) + size > buffer_size
			{
				packetData = buffer_create(size, buffer_fixed, 1);
				splitSize = buffer_size - buffer_tell(data);
				if buffer_tell(data) + 8 < buffer_size
					buffer_copy(data, buffer_tell(data) + 8, splitSize, packetData, 0);
				break;
			}
			else
			{
				packetData = buffer_create(size, buffer_fixed, 1);
				buffer_copy(data, buffer_tell(data), size, packetData, 0);
				
				pto_received_packet(buffer_read(packetData, buffer_u8), packetData);
				buffer_delete(packetData);
				
				buffer_seek(data, buffer_seek_relative, size);
				splitSize = 0;
			}
		}
		buffer_delete(data);
		break;
	
	case network_type_non_blocking_connect:
		connected = async_load[?"succeeded"];
		if connected
		{
			trace("Connected!");
			state = SocketState.Connected;
			pto_on_connect();
		}
		else
		{
			trace("Could not connect.");
			state = SocketState.Dead;
		}
		break;
}
