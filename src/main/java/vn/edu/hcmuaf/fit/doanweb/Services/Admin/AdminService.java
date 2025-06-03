package vn.edu.hcmuaf.fit.doanweb.Services.Admin;

import vn.edu.hcmuaf.fit.doanweb.DAO.Admin.Admin;
import vn.edu.hcmuaf.fit.doanweb.DAO.Admin.ViewModels.*;
import vn.edu.hcmuaf.fit.doanweb.DAO.InventoryDaoImp;
import vn.edu.hcmuaf.fit.doanweb.DAO.Model.*;
import vn.edu.hcmuaf.fit.doanweb.DAO.cart.CartProduct;


import java.io.File;
import java.util.List;
import java.util.Map;

public class AdminService {
    static Admin admin = new Admin();
    static InventoryDaoImp dao= new InventoryDaoImp();

    public List<ProductVM> getAllProduct() {
        return admin.getAllProducts();
    }

    public Product getProductById(int id) {
        return admin.getProductById(id);
    }

    public int insertProduct(Product product) {
        // Thêm sản phẩm và lấy ID
        int productId = admin.insertProduct(product);
        if (productId <= 0) {
            return 0;
        }
        return productId;
    }

    public void insertProductImage(int productId, String imagePath, boolean isMain){
        admin.insertProductImage(productId, imagePath, isMain);
    }

    public List<BrandVM> getAllBrand() {
        return admin.getAllBrands();
    }

    public List<FrameShapes> getAllFrameShape() {
        return admin.getAllFrameShapes();
    }

    public ProductImage getProductImageById(String id) {
        return admin.getImageById(id);
    }

    public List<ProductImage> getAllProductImage(int id) {
        return admin.getProductImage(id);
    }

    public boolean deleteProduct(int id) {
        return admin.deleteProduct(id);
    }

    public boolean updateProduct(Product product) {
        boolean productUpdated = admin.updateProduct(product);
        return productUpdated;
    }

    public List<OrdersVM> getAllOrders() {
        return admin.getAllOrders();
    }

    public List<OrderItemVM> getOrderItems(int orderId) {
        return admin.getOrderItems(orderId);
    }

    public Orders getOrderById(int orderId) {
        return admin.getOrderById(orderId);
    }

    public boolean deleteOrder(int orderId) {
        return admin.deleteOrder(orderId);
    }

    public List<Discounts> getAllDiscounts() {
        return admin.getDiscounts();
    }

    public boolean addDiscount(Discounts discount) {
        return admin.addDiscount(discount);
    }

    public List<CategoriesVM> getAllCategories() {
        return admin.getCategories();
    }

    public boolean addCategory(CategoriesVM categories) {
        return admin.addCategory(categories);
    }

    public boolean deleteCategory(int id) {
        return admin.deleteCategory(id);
    }

    public List<User> getAllUsers() {
        return admin.getAllUsers();
    }

    public List<FeedBacks> getAllFeedbacks() {
        return admin.getAllFeedbacks();
    }

    public List<DashboardVM> getProductHot() {
        return admin.getProductHot();
    }

    public List<NewsletterSubscriber> getAllNewsletterSubscribers() {
        return admin.getAllNewsletterSubscribers();
    }

    public boolean replyFeedback(int id, String replyContent) {
        return admin.replyFeedback(id,replyContent);
    }

    public List<Banner> getAllBanners(){
        return admin.getAllBanners();
    }

    public boolean addBanner(String title, String linkUrl, String imageUrl) {
        return admin.addBanner(title,linkUrl,imageUrl);
    }

    public boolean updateStatusBanner(int bannerId, int status) {
        return admin.updateStatusBanner(bannerId,status);
    }

    public boolean updateBanner(int id, String title, String link, String imageUrl) {
        return admin.updateBanner(id, title, link, imageUrl);
    }

    public Map<Integer, Integer> getRealStockQuantityMap() {
        return dao.getRealStockQuantityMap();
    }

    public void updateStockAfterOrder(List<CartProduct> listProducts){dao.updateStockAfterOrder(listProducts);
    }

    public List<BrandVM> getAllBrands(){return admin.getAllBrand();}
    public int addBrand(Brands brands){
        return admin.insertBrand(brands);
    }



    public boolean updateBrand(BrandVM brands){
        return admin.updateBrand(brands);
    }

    public boolean deleteBrand(int id){
        return admin.deleteBrand(id);
    }

    public void importFromExcel(String filename) {
        dao.importFromExcel(filename);
    }

    public List<PostVM> getAllPosts(){
        return admin.getAllPosts();
    }

    public PostVM getPostById(int id){
        return admin.getPostById(id);
    }

    public boolean addPost(PostVM post) {
        return admin.addPost(post);
    }

    public boolean updatePost(PostVM post){
        return admin.updatePost(post);
    }

    public boolean toggleStatus(int id, int status){
        return admin.toggleStatus(id,status);
    }

//    public static void main(String[] args) {
//        AdminService adminService = new AdminService();
//    }


}
