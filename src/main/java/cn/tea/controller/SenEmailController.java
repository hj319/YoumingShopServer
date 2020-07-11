package cn.tea.controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.Random;

@Controller
@RequestMapping("/email")
public class SenEmailController {

    @Autowired
    private JavaMailSender javaMailSender;

    @Value("${mail.smtp.username}")
    private String emailFrom;

    @RequestMapping("/send")
    public @ResponseBody  Boolean  senMsg(HttpSession httpSession, @RequestParam String email){
        //������λ����֤��
        String Captcha = String.valueOf(new Random().nextInt(899999) + 100000);
        httpSession.setAttribute("Captcha",Captcha);
        SimpleMailMessage message = new SimpleMailMessage();
        //�����˵������ַ
        message.setFrom(emailFrom);
        //�ռ��˵������ַ
        message.setTo(email);
        //�ʼ�����
        message.setSubject("�ʼ�������");
        //�ʼ�����
        message.setText("���ݣ�"+Captcha);
        //�����ʼ�
        javaMailSender.send(message);
        return true;
    }
}

