import dddsample.cargotracker.application.util {
	toJavaList
}

import java.text {
	SimpleDateFormat
}
import java.util {
	JList=List,
	Date
}

"""
   DTO for registering and routing a cargo.
   """
shared class CargoRoute(trackingId, origin, finalDestination, Date arrivalDeadlineDate, 
	misrouted, claimed,  lastKnownLocation, transportStatus, {Leg*} legsIt){
	
	value dateFormat = SimpleDateFormat("MM/dd/yyyy hh:mm a z");
	
	shared String trackingId;
	shared String origin;
	shared String finalDestination;
	shared String arrivalDeadline = dateFormat.format(arrivalDeadlineDate);
	shared Boolean misrouted;
	shared Boolean claimed;
	shared String lastKnownLocation;
	shared String transportStatus;
	shared JList<Leg> legs = toJavaList(legsIt);
	
	shared Boolean routed => !legs.empty;
}
