package com.rang.jsp.common;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;
 
public class SMTPAuthenticator extends Authenticator{
 
    @Override
    protected PasswordAuthentication getPasswordAuthentication() {
    	
        return new PasswordAuthentication("travelrang","rang09090");
    }
}

