package com.kh.ml.common.mail;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.scheduling.annotation.Async;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.stereotype.Component;

import com.kh.ml.common.code.Code;

@Component
@EnableAsync
public class MailSender {

	@Autowired
	private JavaMailSender mailSender;
	@Async
	public void send(String to, String subject, String htmlTxt) {
		try {
			MimeMessage msg = mailSender.createMimeMessage();
			msg.setFrom(Code.EMAIL.desc);
			msg.setRecipients(Message.RecipientType.TO, to);
			msg.setSubject(subject);
			msg.setContent(htmlTxt,"text/html;charset=UTF-8");
			
			mailSender.send(msg);
			
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
}
