const modal = document.querySelector(".addItemModal");
const openModalBtn = document.querySelector(".addItem");
const iconCloseModal = document.querySelector(".close_modal i");
const buttonCloseModal = document.querySelector(".modal__footer button");

function toggleModal() {
    modal.classList.toggle("hide");
}

openModalBtn.addEventListener("click", toggleModal);
iconCloseModal.addEventListener("click", toggleModal);
buttonCloseModal.addEventListener("click", toggleModal);

// modal.addEventListener("click", (e) => {
//     if (e.target == e.currentTarget) toggleModal();
// });