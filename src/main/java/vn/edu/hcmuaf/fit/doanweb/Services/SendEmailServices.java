package vn.edu.hcmuaf.fit.doanweb.Services;

import vn.edu.hcmuaf.fit.doanweb.DAO.UserDaoImp;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;
import java.util.logging.Logger;

public class SendEmailServices {

    private UserDaoImp userDaoImp = new UserDaoImp();
    private static final Logger logger = Logger.getLogger(SendEmailServices.class.getName());

    public SendEmailServices() {

    }

    public String getPassword(String userName, String email) {
        return userDaoImp.getPassword(userName, email);
    }

    public void sendEmail(String to, String subject, String content) throws MessagingException {

        final String from = "22130177@st.hcmuaf.edu.vn";
        final String password = "tloy jdcq rfkd blhn";

        // thuộc tính cho phiên gửi email
        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", true);
        props.put("mail.smtp.starttls.enable", true);


        // tạo phiên
        Session session = Session.getInstance(props, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(from, password);

            }
        });


        try {

            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(from));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
            message.setSubject(subject);
            message.setContent(content,"charset=utf-8");

            Transport.send(message);


        } catch (Exception e) {

        }
    }


}