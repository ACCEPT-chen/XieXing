function jumptoList(){
    var email=document.getElementById("jumptoList_email").innerText;
    console.log("111"+email)
    window.location.href="listServlet?param="+email;
}
