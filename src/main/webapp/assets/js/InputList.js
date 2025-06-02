const provinceSelect = document.getElementById('province');
const districtSelect = document.getElementById('district');
const wardSelect = document.getElementById('ward');

// Load tỉnh
fetch('https://provinces.open-api.vn/api/p/')
    .then(response => response.json())
    .then(data => {
        data.forEach(province => {
            const option = document.createElement('option');
            option.value = province.code; // ✅ Dùng code
            option.text = province.name;
            provinceSelect.add(option);
        });
    });

// Khi chọn tỉnh
provinceSelect.addEventListener('change', () => {
    const provinceCode = provinceSelect.value;
    districtSelect.innerHTML = '<option value="">-- Chọn huyện --</option>';
    wardSelect.innerHTML = '<option value="">-- Chọn xã --</option>';
    districtSelect.disabled = true;
    wardSelect.disabled = true;

    if (provinceCode) {
        fetch(`https://provinces.open-api.vn/api/p/${provinceCode}?depth=2`)
            .then(response => response.json())
            .then(data => {
                data.districts.forEach(district => {
                    const option = document.createElement('option');
                    option.value = district.code; // ✅ Dùng code
                    option.text = district.name;
                    districtSelect.add(option);
                });
                districtSelect.disabled = false;
            });
    }
});

// Khi chọn huyện
districtSelect.addEventListener('change', () => {
    const districtCode = districtSelect.value;
    wardSelect.innerHTML = '<option value="">-- Chọn xã --</option>';
    wardSelect.disabled = true;

    if (districtCode) {
        fetch(`https://provinces.open-api.vn/api/d/${districtCode}?depth=2`)
            .then(response => response.json())
            .then(data => {
                data.wards.forEach(ward => {
                    const option = document.createElement('option');
                    option.value = ward.code; // ✅ Dùng code
                    option.text = ward.name;
                    wardSelect.add(option);
                });
                wardSelect.disabled = false;
            });
    }
});
