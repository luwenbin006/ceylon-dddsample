native("jvm")   module dddsample "1.0.0" {
	
	// Base
	shared import java.base "7";
	shared import javax.jaxws "7";
	shared import javax.inject "1";
	shared import ceylon.interop.java "1.2.0";
	shared import ceylon.json "1.2.0";
	
	// logging
	shared import org.slf4j.api "1.6.1";
	
	// JEE
	shared import hibernatejpa21api "jpa-2.1-api-1.0.0.Final";
	shared import cdiapi "api-1.2";
	shared import jsfapi22spec "2.2.11";
	shared import ejbapi32spec "1.0.0.Final";
	shared import annotationsapi12spec "1.0.0.Final";
	shared import javaxwsrsapi "2.0";
	shared import javaxjms.api "2.0.1";
	shared import validation.api "1.1.0";
	shared import websocketapi "1.1.1";
	
	// Here to workaround some limitations of Ceylon in Wildfly, but should be remove at some point
	shared import jbossvfs "3.2.9.Final";
	
}
