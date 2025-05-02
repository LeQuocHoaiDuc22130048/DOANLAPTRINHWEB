package vn.edu.hcmuaf.fit.doanweb.DAO;

import vn.edu.hcmuaf.fit.doanweb.DAO.Model.OrderDetails;
import vn.edu.hcmuaf.fit.doanweb.DAO.Model.Orders;

import java.util.List;

public interface OrderDao {

    public int saveOrder(Orders order);
    public List<Orders> getOrdersByUserId(int userId);
    public List<OrderDetails> getOrderDetailsByCode(String code);

}
