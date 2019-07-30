package com.my.four.model.biz;

import java.io.File;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

@Service
public class MailServiceImpl implements MailService {
	@Autowired
	private JavaMailSender mailSender;
	
	@Override
	public boolean send(String subject, String text, String from, String to, String filepath) {
		
		MimeMessage msg = mailSender.createMimeMessage();
		
		try {
			MimeMessageHelper helper = new MimeMessageHelper(msg,true,"UTF-8");
			helper.setSubject(subject);
			helper.setText(text,true);
			helper.setFrom(from);
			helper.setTo(to);
			
			//첨부파일 처리
			if(filepath!=null) {
				File file = new File(filepath);
				if(file.exists()) {
					helper.addAttachment(file.getName(), new File(filepath));
				}
				
			}
			
			mailSender.send(msg);
			System.out.println("메일성공");
			return true;
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("메일 실패");
		}
		
		return false;
	}

}
