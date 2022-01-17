//User modal
const Modal = document.querySelector('.js_modal_user');
const openModal = document.querySelector('.js_open_modal');
const closeModal = document.querySelector('.js_modal_close');


function ShowModal() {
    Modal.classList.remove('hide');
}

function CloseModal() {
    Modal.classList.add('hide');
}



openModal.addEventListener('click', ShowModal);
closeModal.addEventListener('click', CloseModal);


$(document).ready(
    function () {
        $('.header').waypoint(
            function (direction) {
                if (direction === "down") {
                    $('nav').addClass('sticky');
                } else {
                    $('nav').removeClass('sticky');
                }
            }, {
                offset: '-10px'
            }
        );
    }

);

let listDivImg = document.querySelectorAll('.list_img div');
let next = document.querySelector('.next');
let prev = document.querySelector('.prev');
let imgWrap = document.querySelector('.img_main img');

let currentIndex = 0;

setCurrent(currentIndex);

function setCurrent(index) {
    currentIndex = index;
    imgWrap.src = listDivImg[currentIndex].querySelector('img').src;

    // remove all active img
    listDivImg.forEach((item) => {
        item.classList.remove('active');
    });

    // set active
    listDivImg[currentIndex].classList.add('active');
}

listDivImg.forEach((img, index) => {
    img.addEventListener('click', (e) => {
        setCurrent(index);
    });
});

next.addEventListener('click', () => {
    if (currentIndex === listDivImg.length - 1) {
        currentIndex = 0;
    } else currentIndex++;

    setCurrent(currentIndex);
});

prev.addEventListener('click', () => {
    if (currentIndex === 0) currentIndex = listDivImg.length - 1;
    else currentIndex--;

    setCurrent(currentIndex);
});

//tăng giảm số lượng
$('.ProductDetail_info_size_num  button').on('click', function () {
    var $button = $(this);
    var oldValue = $button.parent().find('input').val();
    if ($button.hasClass('btn-plus')) {
        var newVal = parseFloat(oldValue) + 1;
    } else {
        if (oldValue > 0) {
             newVal = parseFloat(oldValue) - 1;
        } else {
            newVal = 0;
        }
    }
    $button.parent().find('input').val(newVal);
});




// chuyển số sang giá tiền
    //var a = document.getElementById("price").outerText * 1; //lấy ra thẻ h
    //a = a.toLocaleString('vi-VN', {
    //    style: 'currency',
    //    currency: 'VND'
    //});
    //var b = document.getElementById("price").innerText = a;