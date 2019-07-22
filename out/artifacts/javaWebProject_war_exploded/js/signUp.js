
let right =[false,false];


function hide(parts){
    document.getElementById(parts).style.display="none";
}

function show(parts){
    document.getElementById(parts).style.display="block";
}


function signUp() {
    let page = document.referrer;
    if (isNameLegal() && isPasswordLegal()) {
        window.location.href="/signUp?name="+document.getElementById("userName").value+"&password="+
            document.getElementById("password").value+"&page=" + page;
    }else {
        show("error");
    }
}
function isNameLegal() {
    let name = document.getElementById("userName");

    if (name.value == null || name.value === ""){
        return false;
    }

    return true;
}


function isPasswordLegal() {
    let password = document.getElementById("password");

    if (password.value == null || password.value === ""){
        return false;
    }

    return true;
}