package vn.edu.hcmuaf.fit.doanweb.Enum;

import lombok.Getter;

@Getter
public enum Roles {
    USER ("USER"), ADMIN ("ADMIN")  , BRONZE("BRONZE") , SILVER("SILVER") , GOLD("GOLD") , DIAMOND("DIAMOND") , GUEST("GUEST");
    private final String role ;

    Roles(String role) {
        this.role = role;
    }
}
