let fileInput = document.getElementById("file-input");
let imageContainer = document.getElementById('images');
let numOfFiles = document.getElementById('num-of-file');


let imageContainerMain = document.getElementById('image-main');
let chooseImage = document.getElementById('chooseImage');
let fileInputMain = document.getElementById('file-input-main');

function previewMain() {
    imageContainerMain.innerHTML = '';
    const file = fileInputMain.files[0];

    if (!file) {
        chooseImage.textContent = 'Chưa chọn file ảnh';
        return;
    }

    chooseImage.textContent = 'Đã chọn ảnh chính';

    let readerMain = new FileReader();
    let figure = document.createElement('figure');
    figure.style.position = 'relative';

    let figCap = document.createElement('figcaption');
    figCap.innerText = file.name;

    let btnDelete = document.createElement('button');
    btnDelete.textContent = 'X';
    btnDelete.className = 'btn btn-danger btn-sm';
    btnDelete.onclick = () => {
        figure.remove();
        fileInputMain.value = '';
        chooseImage.textContent = 'Chưa chọn file ảnh';
    };

    figure.appendChild(btnDelete);
    figure.appendChild(figCap);

    readerMain.onload = () => {
        let img = document.createElement('img');
        img.setAttribute("src", readerMain.result);
        img.style.maxWidth = '100px';
        img.style.display = 'block';
        img.style.marginBottom = '5px';
        figure.insertBefore(img, figCap);
    };

    imageContainerMain.appendChild(figure);
    readerMain.readAsDataURL(file);
}

function preview() {
    imageContainer.innerHTML = '';
    numOfFiles.textContent = `Đã chọn ${fileInput.files.length} ảnh`;

    for (i of fileInput.files) {
        let reader = new FileReader();
        let figure = document.createElement('figure');
        let figCap = document.createElement('figcaption');
        figCap.innerText = i.name;

        let btnDelete = document.createElement('button');
        btnDelete.textContent = 'X';
        btnDelete.className = 'btn btn-danger btn-sm';
        btnDelete.onclick = () =>{
            figure.remove();
            const remaining = imageContainer.querySelectorAll('figure').length;
            numOfFiles.textContent = remaining > 0 ? `Đã chọn ${remaining} ảnh` : 'Chưa chọn file ảnh';
        }

        figure.appendChild(btnDelete);
        figure.appendChild(figCap);
        reader.onload = () => {
            let img = document.createElement('img');
            img.setAttribute("src", reader.result);
            figure.insertBefore(img, figCap);
        }

        imageContainer.appendChild(figure);
        reader.readAsDataURL(i);
    }
}