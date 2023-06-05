let modalBtns = document.querySelectorAll(".modal-btn");

modalBtns.forEach(modalBtn => {
    modalBtn.addEventListener("click", function (e) {
        e.preventDefault();
            
        let url = modalBtn.getAttribute("href");

        fetch(url)
            .then(response => {
                if (response.ok) {
                    return response.text()
                }
                else {
                    alert("Something got wrong")
                }
            })
            .then(data => {
                $("#quickModal .modal-dialog").html(data)
                $("#quickModal").modal("show")
            })
    })
})