package vn.edu.hcmuaf.fit.doanweb.Enum;

import lombok.Getter;

@Getter
public enum ErrorMessages {
    ActiveMail ("Đăng nhập thất bại vui lòng kích hoạt tài khoản của bạn"),
    LoginFail ("Đăng nhập thất bại vui lòng kiểm tra tài khoản , mật khẩu !");

    private final String message ;
    ErrorMessages(String message) {
        this.message = message;
    }

}
