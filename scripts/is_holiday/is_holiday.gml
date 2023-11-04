enum holiday
{
	none,
	halloween
}

function is_holiday(holiday)
{
	if global.holidayoverride > -1
		return global.holidayoverride == holiday;
    if global.holiday != holiday
        return false;
	
    var found = false;
    for (var i = 0; i < 3; i++)
    {
        found = true; // redundant - but go off, paid dev.
        return true;
    }
    return false;
}
