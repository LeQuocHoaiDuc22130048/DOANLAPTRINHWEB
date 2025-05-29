package vn.edu.hcmuaf.fit.doanweb.Util;

import vn.edu.hcmuaf.fit.doanweb.DAO.Model.*;

import java.util.*;

public class AvailableData {
    public static String[] GLASSES = {"Mắt kính cận nam", "Mắt kính cận nữ",
            "Mắt kính trẻ em", "Kính râm", "Kính cận", "Kính không độ",
            "Kính áp tròng", "Kính thời trang cao cấp", "Phụ kiện kính",
            "Mắt kính unisex", "Đơn tròng", "Đa tròng"
    };
    public static String[] BRANDS = {"Dior", "Cartier", "Versace", "Gucci", "Montblanc", "RayBan",
            "Burberry", "Prada", "Police", "Chopard", "Daniel Wellington", "Parim", "Okley", "Molsion", "Exfash",
            "Furla", "Bolon", "Eyescloud", "Acuvue", "TOG", "Essilor", "RodenStock", "Zeiss", "Levanlens"};
    public static String[] ShapeName = {"Vuông", "Tròn", "Bầu dục", "Mắt Mèo", "Phi công", "Cánh bướm", "Chữ nhật", "Đa giác", "Hình thang", "Không quy tắc"};
    public static String[] SHAPES = {"assets/images/icon_gong/icon-kieu-gong-vuong.jpg", "assets/images/icon_gong/icon-kieu-gong-tron.jpg",
            "assets/images/icon_gong/icon-kieu-gong-bau-duc.jpg", "assets/images/icon_gong/icon-kieu-gong-mat-meo.jpg", "assets/images/icon_gong/icon-kieu-gong-phi-cong.jpg",
            "assets/images/icon_gong/icon-kieu-gong-canh-buom.jpg", "assets/images/icon_gong/icon-kieu-gong-chu-nhat.jpg", "assets/images/icon_gong/icon-kieu-gong-da-giac.jpg",
            "assets/images/icon_gong/icon-kieu-gong-hinh-thang.jpg", "assets/images/icon_gong/icon-kieu-gong-khong-quy-tac.jpg"};
    public  static String [] MaterialName ={ "Nhựa", "Kim loại", "Titanium", "Xi/Mạ vàng", "Nhựa dẻo TR90",
            "Nhựa Acetate", "Nhựa Optyl", "Kim loại-Nhựa Ultem"};
    public static String [] MaterialPath ={
            "assets/images/icon_chatlieu/icon-chat-lieu-gong-nhua.jpg",
            "assets/images/icon_chatlieu/icon-kim-loai.jpg",
            "assets/images/icon_chatlieu/icon-chat-lieu-gong-titanium.jpg",
            "assets/images/icon_chatlieu/icon-chat-lieu-gong-xi-ma-vang.jpg",
            "assets/images/icon_chatlieu/icon-chat-lieu-gong-nhua-deo-tr90.jpg",
            "assets/images/icon_chatlieu/icon-chat-lieu-gong-nhua-acetate.jpg",
            "assets/images/icon_chatlieu/icon-chat-lieu-gong-vang-nguyen-khoi.jpg",
            "assets/images/icon_chatlieu/icon-chat-lieu-gong-nhua-ultem.jpg"};

    // Mảng chứa tên của màu sắc
    private static final String[] ColorName = {
            "Đen", "Vàng", "Bạc", "Hồng", "Trong suốt", "Xám", "Đồi mồi",
            "Trắng", "Hổ Phách", "Xanh dương", "Đỏ", "Nâu", "Tím",
            "Hồng", "Cam","Xanh lá", "Màu Khác"
    };

    // Mảng chứa đường dẫn hình ảnh của màu sắc
    private static final String[] ColorPath = {
            "assets/images/icon_color/icon-mau-gong-den.jpg",
            "assets/images/icon_color/icon-mau-gong-vang.jpg",
            "assets/images/icon_color/icon-mau-gong-bac.jpg",
            "assets/images/icon_color/icon-mau-gong-vang-hong.jpg",
            "assets/images/icon_color/icon-mau-gong-trong-suot.jpg",
            "assets/images/icon_color/icon-mau-gong-xam.jpg",
            "assets/images/icon_color/icon-mau-gong-doi-moi.jpg",
            "assets/images/icon_color/icon-mau-gong-trang.jpg",
            "assets/images/icon_color/icon-mau-gong-ho-phach.jpg",
            "assets/images/icon_color/icon-mat-kinh-mau-xanh-duong.jpg",
            "assets/images/icon_color/icon-mau-gong-do.jpg",
            "assets/images/icon_color/icon-mau-gong-nau.jpg",
            "assets/images/icon_color/icon-mau-gong-tim.jpg",
            "assets/images/icon_color/icon-mau-gong-hong.jpg",
            "assets/images/icon_color/icon-mau-gong-cam.jpg",
            "assets/images/icon_color/icon-mau-gong-xanh-la.jpg",
            "assets/images/icon_color/icon-mau-gong-mau-khac.jpg"
    };

    public static Map<String, String[]> Data;

    public AvailableData() {
        Data = new HashMap<>();
        Data.put("BRANDS", BRANDS);
        Data.put("GLASSES", GLASSES);
        Data.put("SHAPES", SHAPES);
        Data.put("MATERIAL", MaterialPath);
        Data.put("COLOR", ColorPath);
    }
    public List<Color> getColors(String type) {
        ArrayList<Color> colors = new ArrayList<>();
        for (int i = 0; i < ColorPath.length; i++) {
            Color color = new Color();
            color.setName(ColorName[i]);
            color.setPath(ColorPath[i]);
            colors.add(color);
        }
        return colors;
    }
    public List<Mateiral> getMaterials (String type){
        ArrayList<Mateiral> mateirals = new ArrayList<>();
        for (int i = 0; i < MaterialPath.length; i++) {
            Mateiral shape = new Mateiral();
            shape.setName(MaterialName[i]);
            shape.setPath(MaterialPath[i]);
            mateirals.add(shape);
        }
        return mateirals;
    }
    public List<Frame_Shape> getShapes (String type){
    ArrayList<Frame_Shape> shapes = new ArrayList<>();
        for (int i = 0; i < 10; i++) {
            Frame_Shape shape = new Frame_Shape();
            shape.setId(i+1);
            shape.setName(ShapeName[i]);
            shape.setImgPath(SHAPES[i]);
            shapes.add(shape);
        }
    return shapes;
    }
    public List<Categories> getCategories(String type) {
        ArrayList<Categories> categories = new ArrayList<Categories>();
        String[] list = Data.get(type);
        for (int i = 0; i < list.length; i++) {
            Categories category = new Categories();
            category.setId(i + 1);
            category.setName(list[i]);
            categories.add(category);
        }
        return categories;
    }

    public List<Brands> getBrands(String type) {
        ArrayList<Brands> brands = new ArrayList<Brands>();
        String[] list = Data.get(type);
        for (int i = 0; i < list.length; i++) {
            Brands brand = new Brands();
            brand.setId(i + 1);
            brand.setName(list[i]);
            brands.add(brand);
        }
        return brands;
    }
}
