package vn.edu.hcmuaf.fit.doanweb.DAO;

import org.jdbi.v3.core.Jdbi;
import vn.edu.hcmuaf.fit.doanweb.DAO.DB.JDBIConnect;
import vn.edu.hcmuaf.fit.doanweb.DAO.Model.Subscribers;

import java.util.List;

public class SubscriberDaoImp implements SubscriberDao {
    private Jdbi jdbi = JDBIConnect.get();

    //Add Subscriber xuống db
    @Override
    public boolean addSubscriber(String name, String email) {
        return jdbi.withHandle(handle ->
                handle.createUpdate("INSERT INTO newsletter_subscribers (name, email,created_at) VALUES (:name,:email,NOW())")
                        .bind("name", name)
                        .bind("email", email)
                        .execute() > 0
        );
    }

    // get all subscriber
    public List<Subscribers> getSubscriberList() {
        return jdbi.withHandle(handle ->
                handle.createQuery("SELECT * FROM newsletter_subscribers")
                        .mapToBean(Subscribers.class)
                        .list()

        );
    }

    // find subscriber by email
    public Subscribers getSubscriberByEmail(String email) {
        return jdbi.withHandle(handle ->
                handle.createQuery("SELECT * FROM newsletter_subscribers WHERE email= :email")
                        .bind("email",email)
                        .mapToBean(Subscribers.class)
                        .findOne()
                        .orElse(null)
        );
    }

    public static void main(String[] args) {
//      System.out.println(new SubscriberDaoImp().addSubscriber("kiều","abcd@gmail.com"));
//        Subscribers s= new SubscriberDaoImp().getSubscriberByEmail("abc@gmail.com");
//        System.out.println(s);
    }
}
