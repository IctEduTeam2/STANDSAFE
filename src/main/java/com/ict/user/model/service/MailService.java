package com.ict.user.model.service;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

@Service
public class MailService {
	@Autowired
	private JavaMailSender mailSender;
	private MimeMessage message;
	private MimeMessageHelper messageHelper;
	
	public void sendEmail(String TEMP_PWtxt, String toMail) {
		MailHandler sendMail;
		try {
			sendMail = new MailHandler(mailSender);
			sendMail.setSubject("[ STANDSAFE 임시비밀번호 안내 이메일 입니다.]"); // 메일제목
			// 내용
			sendMail.setText(""
				    + "<div style='width: 100%; text-align: center; font-family: Arial, sans-serif;'>"
				    + "    <table style='margin: 0 auto; border-collapse: collapse; width: 80%; border: 1px solid #e0e0e0;'>"
				    + "        <tbody>"
				    + "            <tr>"
				    + "                <td style='padding: 20px; background-color: navy;'><h2 style='margin: 0; color: white;'>STANDSAFE 메일 인증</h2></td>"
				    + "            </tr>"
				    + "            <tr>"
				    + "                <td style='padding: 20px;'><h3 style='margin: 0; color: navy;'>STANDSAFE</h3></td>"
				    + "            </tr>"
				    + "            <tr>"
				    + "                <td style='padding: 20px;'><font size='4'>안녕하세요. STANDSAFE 임시비밀번호 안내 관련 이메일 입니다.</font></td>"
				    + "            </tr>"
				    + "            <tr>"
				    + "                <td style='padding: 20px;'><font size='4'>당신의 임시 비밀번호는 <span style='color: blue; font-weight: bold;'>"+ TEMP_PWtxt +"</span>입니다.</font></td>"
				    + "            </tr>"
				    + "            <tr>"
				    + "                <td style='padding: 20px;'><font size='3'>로그인 후에 비밀번호를 변경을 해주세요.</font></td>"
				    + "            </tr>"
				    + "        </tbody>"
				    + "    </table>"
				    + "</div>");

			// 보내는 이
			sendMail.setFrom("pletta900114@gmail", "STANDSAFE");
			
			// 받는이
			sendMail.setTo(toMail);
			sendMail.send();
		} catch (Exception e) {
			System.out.println(e);
		}
	}

}













