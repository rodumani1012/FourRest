package com.my.four.model.biz;

public interface MailService {

	public boolean send(String subject,String text,String from,String to,String filepath);
}
