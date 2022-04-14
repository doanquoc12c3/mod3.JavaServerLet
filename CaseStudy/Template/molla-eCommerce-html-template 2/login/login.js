function login() {
    let username = $('#singin-email').val();
    let password = $('#singin-password').val();
    let user = {
        username: username,
        password: password
    }
    $.ajax({
        type: 'POST',
        url: 'http://localhost:8080/login',
        data: JSON.stringify(user),
        headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json'
        },
        success: function (data) {
            localStorage.setItem('currentUser', JSON.stringify(data));
            if (data.roles[0].authority === "ROLE_ADMIN") {
                location.href = "admin.html"
            }else if (data.roles[0].authority === "ROLE_USER"){
                location.href = "index-1.html"
            }else {
                location.href = "seller.html"
            }
        }
    });
}