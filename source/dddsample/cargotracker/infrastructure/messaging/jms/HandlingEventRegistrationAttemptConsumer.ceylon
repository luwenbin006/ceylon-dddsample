import dddsample.cargotracker.application {
	HandlingEventService
}
import dddsample.cargotracker.domain.model.handling {
	CannotCreateHandlingEventException
}
import dddsample.cargotracker.interfaces.handling {
	HandlingEventRegistrationAttempt
}

import javax.ejb {
	messageDriven,
	activationConfigProperty
}
import javax.inject {
	inject=inject__FIELD
}
import javax.jms {
	MessageListener,
	Message,
	ObjectMessage,
	JMSException
}

import org.slf4j {
	Logger
}


messageDriven{ activationConfig = {
	activationConfigProperty{
		propertyName = "destinationType"; 
		propertyValue = "javax.jms.Queue";},
	activationConfigProperty{
		propertyName = "destinationLookup"; 
		propertyValue = "java:global/jms/HandlingEventRegistrationAttemptQueue";}
	};
	messageListenerInterface=`MessageListener`;
}
shared class HandlingEventRegistrationAttemptConsumer() satisfies MessageListener{
	
	inject
	late Logger log;
	
	inject 
	late HandlingEventService handlingEventService;
	
	shared actual default void onMessage(Message message) {
		
		try {
			assert(
				is ObjectMessage objectMessage = message,
				is HandlingEventRegistrationAttempt attempt = objectMessage.\iobject
			);
			log.info("JMS Listener HandlingEventRegistrationAttemptQueue received``attempt``");
			handlingEventService.registerHandlingEvent(
				attempt.completionTime,
				attempt.trackingId,
				attempt.typeAndVoyage,
				attempt.unLocode);
		} catch (JMSException | CannotCreateHandlingEventException e) {
			// Poison messages will be placed on dead-letter queue.
			throw Exception("Error occurred processing message", e);
			//        } catch (JMSException e) {
			// logger.log(Level.SEVERE, e.getMessage(), e);
		}
		
	}
	
	
}