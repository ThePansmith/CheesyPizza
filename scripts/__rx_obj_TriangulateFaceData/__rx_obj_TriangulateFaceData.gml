// Don't call this unless you know what you're doing
function __rx_obj_TriangulateFaceData(faceData)
{
	var vertArray = array_create(0, "");
	
	var ogFaceDataSize = array_length(faceData);
	
	for (var i = 0; i < ogFaceDataSize - 2; i++)
		array_push(faceData, faceData[i]);
	
	// Radix
	// THIS NEEDS TO BE ADJUSTED!!!!
	// FOR FACES OF GREATER SIDES !!!!!
	for (var i = 0; i < array_length(faceData) - 3; i += 2)
	{
		for (var a = 0; a < 3; a++)
			array_push(vertArray, faceData[i + a]);
			
		//array_copy(vertArray, i * 3, faceData, i, 3);
	}
	return vertArray;
	
}