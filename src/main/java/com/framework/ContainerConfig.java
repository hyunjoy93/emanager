package com.framework;

import org.apache.catalina.connector.Connector;
import org.apache.coyote.ajp.AbstractAjpProtocol;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.web.embedded.tomcat.TomcatServletWebServerFactory;
import org.springframework.boot.web.servlet.server.ServletWebServerFactory;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class ContainerConfig {

    @Value("${tomcat.ajp.port}")
    int ajpPort;

    @Value("${tomcat.ajp.protocol}")
    String ajpProtocol;

    @Value("${tomcat.ajp.enabled}")
    boolean tomcatAjpEnabled;

    @Value("${tomcat.ajp.address}")
    String tomcatAjpAddress;
    
    @Value("${tomcat.ajp.allowedRequestAttributesPattern}")
    String tomcatAjpAllowedRequestAttributesPattern;
    
    @Bean
    public ServletWebServerFactory servletContainer() {
        TomcatServletWebServerFactory tomcat = new TomcatServletWebServerFactory();
        tomcat.addAdditionalTomcatConnectors(createAjpConnector());
        return tomcat;
    }

    @SuppressWarnings("rawtypes")
	private Connector createAjpConnector() {
    	Connector ajpConnector = new Connector(ajpProtocol);
    	ajpConnector.setPort(ajpPort);
        ajpConnector.setSecure(false);
        ajpConnector.setAllowTrace(false);
        ajpConnector.setScheme("http");
        ajpConnector.setProperty("address", tomcatAjpAddress);
        ajpConnector.setProperty("allowedRequestAttributesPattern", tomcatAjpAllowedRequestAttributesPattern);
        ((AbstractAjpProtocol) ajpConnector.getProtocolHandler()).setSecretRequired(false); 
        return ajpConnector;
    }
}