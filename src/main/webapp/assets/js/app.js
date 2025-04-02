$(document).ready(function () {
    let token = "8b21f845-0d0d-11f0-9f28-eacfdef119b3";
    $.ajax({
        url: "https://dev-online-gateway.ghn.vn/shiip/public-api/master-data/province",
        type: "GET",
        headers: {
            "Token": "8b21f845-0d0d-11f0-9f28-eacfdef119b3"
        },
        success: function (response) {
            if (response.code === 200) {
                let citySelect = $("#city");
                response.data.forEach(province => {
                    if (province.ProvinceName !== "Test") {
                        citySelect.append(`<option value="${province.ProvinceID}">${province.ProvinceName}</option>`);
                    }
                });
            }
        },
        error: function (xhr, status, error) {
            console.error("Lỗi tải danh sách tỉnh/ thành phố: ", error);
        }
    });

    // Khi chọn tỉnh/thành phố, gọi API để lấy quận/huyện
    $("#city").change(function () {
        let provinceId = $(this).val();
        let districtSelect = $("#district");
        districtSelect.empty().append(`<option value="">Chọn Quận/Huyện</option>`);

        if (provinceId) {
            $.ajax({
                url: "https://dev-online-gateway.ghn.vn/shiip/public-api/master-data/district",
                type: "GET",
                headers: {
                    "Token": "8b21f845-0d0d-11f0-9f28-eacfdef119b3"
                },
                data: {province_id: provinceId},
                success: function (response) {
                    response.data.forEach(district => {
                        districtSelect.append(`<option value="${district.DistrictID}">${district.DistrictName}</option>`);
                    });
                },
                error: function (xhr, status, error) {
                    console.error("Lỗi tải danh sách quận/huyện: ", error);
                }

            });
        }

    });

    // Khi chọn quận/huyện, gọi API để lấy xã/phường
    $("#district").change(function () {
        let districtId = $(this).val();
        let wardSelect = $("#ward");
        wardSelect.empty().append(`<option value="">Chọn Xã/Phường</option>`); // Xóa xã cũ

        if (districtId) {
            $.ajax({
                url: "https://dev-online-gateway.ghn.vn/shiip/public-api/master-data/ward",
                type: "GET",
                headers: {
                    "Token": "8b21f845-0d0d-11f0-9f28-eacfdef119b3"
                },
                data: {district_id: districtId},
                success: function (response) {
                    response.data.forEach(ward => {
                        wardSelect.append(`<option value="${ward.WardCode}">${ward.WardName}</option>`);
                    });
                },
                error: function (xhr, status, error) {
                    console.error("Lỗi tải danh sách xã/phường:", error);
                }
            });
        }
    });

    //Khi chọn xã/phường, tự động tính phí vận chuyển
    $("#ward").change(function () {
        let fromDistrictID = 3695;  // Giả lập thành pho gửi hàng (Thủ Đức)
        let toDistrictID = Number($("#district").val());
        let toWardCode = $(this).val();
        let weight = 300; //giả lập 300g
        let length = 10, width = 10, height = 5;

        if (toDistrictID && toWardCode) {
            $.ajax({
                url: "https://dev-online-gateway.ghn.vn/shiip/public-api/v2/shipping-order/fee",
                type: "POST",
                headers: {
                    "Token": token,
                    "Content-Type": "application/json",
                    "ShopId": 196261
                },
                data: JSON.stringify({
                    "service_type_id": 2, //giao hàng tiêu chuẩn 2-5 ngày
                    "insurance_value": 0,
                    "from_district_id": fromDistrictID,
                    "to_district_id": toDistrictID,
                    "to_ward_code": toWardCode,
                    "height": height,
                    "length": length,
                    "weight": weight,
                    "width": width
                }),
                success: function (response) {
                    console.log("Shipping Fee API Response:", response);
                    if (response.code === 200) {
                        let fee = response.data.total;
                        console.log("Shipping Fee:", fee);
                        $("#shippingFee").text(`${fee.toLocaleString()} đ`);
                        $("#shippingFeeHidden").val(fee || 0); // Lưu phí ship vào input hidden

                        // Lấy tổng tiền trước đó
                        let totalOrder = Number($("#total_price_orders").text().replace(/[^\d]/g, ''));

                        // Tính lại tổng sau khi cộng phí ship
                        let newTotal = totalOrder + fee;

                        // Cập nhật tổng tiền hiển thị
                        $("#total_price_orders").text(newTotal.toLocaleString() + "đ");
                    }
                }
            });
        }

    });


});