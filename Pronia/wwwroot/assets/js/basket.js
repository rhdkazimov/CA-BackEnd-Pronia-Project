let basketBtns = document.querySelectorAll(".addbasketbtn")
let basketItemCounts = document.querySelectorAll(".minicart-wrap .quantity")
let itemContainer = document.querySelector("#miniCart")
let layoutBasketItemCounts = document.querySelectorAll(".basket-quantity")

basketBtns.forEach(basketBtn => {
    basketBtn.addEventListener('click', function (e) {
        e.preventDefault();

        let url = basketBtn.getAttribute("href")

        fetch(url)
            .then(response => {
                if (!response.ok) {
                    alert("xeta bas verdi!")
                }
                return response.text();
            })
            .then(data => {
                itemContainer.innerHTML = data
                layoutBasketItemCounts.forEach(layoutBasketItemCount => {
                    console.log(layoutBasketItemCount)
                    layoutBasketItemCount.innerText = document.querySelector("#basketitemcounter").getAttribute('data-count');
                })
            })
    })
})

$(document).on("click", ".product-item_remove", function (e) {
    e.preventDefault();
    let url = $(this).attr("href");
    fetch(url)
        .then(response => {
            if (!response.ok) {
                alert("xeta bas verdi")
                return
            }
            return response.text()
        })
        .then(data => {
            itemContainer.innerHTML = data
        })
})