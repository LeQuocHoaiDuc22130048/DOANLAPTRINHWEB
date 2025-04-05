package vn.edu.hcmuaf.fit.doanweb.DAO;

import vn.edu.hcmuaf.fit.doanweb.DAO.Model.Subscribers;

import java.util.List;

public interface SubscriberDao {

    boolean addSubscriber(String name, String email);

    boolean isExistEmail(String email);

    public List<Subscribers> getSubscriberList();

    public Subscribers getSubscriberByEmail(String email);

    public List<String> getAllEmails();
}
