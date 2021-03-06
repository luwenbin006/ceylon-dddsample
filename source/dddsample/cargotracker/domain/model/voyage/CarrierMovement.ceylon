import dddsample.cargotracker.domain.model.location {
	Location
}

import java.lang {
	Long
}
import java.util {
	Date
}

import javax.persistence {
	entity,
	id=id__FIELD,
	generatedValue=generatedValue__FIELD,
	table,
	manyToOne=manyToOne__FIELD,
	joinColumn=joinColumn__FIELD,
	TemporalType,
	column=column__FIELD,
	temporal=temporal__FIELD
}


"""
   A location in our model is stops on a journey, such as cargo origin or
   destination, or carrier movement end points.
   
   It is uniquely identified by a UN location code.
   
"""
entity
table{name = "carrier_movement";}
shared class CarrierMovement(
		departureLocation,
		arrivalLocation,
		departureTime,
		arrivalTime){

	suppressWarnings("unusedDeclaration")
	id
	generatedValue
	Long? id = null;

	manyToOne
	joinColumn{name = "departure_location_id";}
	shared Location departureLocation;
	
	manyToOne
	joinColumn{name = "arrival_location_id";}
	shared Location arrivalLocation;
	
	temporal(TemporalType.\iTIMESTAMP)
	column{name = "departure_time";}
	shared Date departureTime;
	
	temporal(TemporalType.\iTIMESTAMP)
	column{name = "arrival_time";}
	shared Date arrivalTime;
	
		
}