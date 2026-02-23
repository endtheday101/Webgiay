package com.iuh.service;

import javax.mail.MessagingException;

import com.iuh.entity.MailInfo;

public interface MailerService {
	void send(MailInfo mail) throws MessagingException;
	void send(String to, String subject, String body) throws MessagingException;
	void queue(MailInfo mail);
	void queue(String to, String subject, String body);
	void setMailBody(MailInfo mail, String body);
	void sendOtpEmail(String to, String subject, String body);
}
