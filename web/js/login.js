// let code = "123456";//模拟手机验证码
let right = [false,false,false,false,false];



window.onload = function () {
  change();
};

function login(){
    isNameLegal();
    isPasswordLegal();
    isRePasswordLegal();
    isEmailLegal();
    isCodeLegal();

    for (let boo in right){
        if (!boo){
            return;
        }
    }

    let obj = document.getElementsByName("power");
    let power;
    for(let i=0; i<obj.length; i ++){
        if(obj[i].checked){
            power = obj[i].value;
        }
    }


    window.location.href="/login?name="+document.getElementById("userName").value+"&password="+
        document.getElementById("password").value+
        "&email="+document.getElementById("emailAddress").value+"&power="+"&power="+power+"&page="+document.getElementById("page").value;
}


function add() {
    isNameLegal();
    isPasswordLegal();
    isEmailLegal();
    isRePasswordLegal();
    let i = 0;
    for (let boo in right){
        if (i > 3){
            return;
        }
        if (!boo){
            return;
        }
        i++;
    }

    let obj = document.getElementsByName("power");
    let power;
    for(let i=0; i<obj.length; i ++){
        if(obj[i].checked){
            power = obj[i].value;
        }
    }

    window.location.href="/login?name="+document.getElementById("userName").value+"&password="+
        document.getElementById("password").value+
        "&email="+document.getElementById("emailAddress").value+"&power="+"&power="+power+"&page="+document.getElementById("page");

}

function hide(parts){
    document.getElementById(parts).style.display="none";
}

function show(parts){
    document.getElementById(parts).style.display="block";
}


function isNameLegal() {
    let name = document.getElementById("userName");

    if (name.value == null || name.value === ""){
        hide("nameLength");
        show("nameNull");
        return false;
    } 
    if (name.value.length < 4 || name.value.length > 15){
        show("nameLength");
        hide("nameNull");
        return false;
    }

    hide("nameNull");
    hide("nameLength");
    right[0] = true;
    return true;
}


function isPasswordLegal() {
    let password = document.getElementById("password");

    if (password.value == null || password.value === ""){
        show("passwordNull");
        hide("passwordError");
        hide("passwordLength");
        return false;
    }
    if (password.value.length < 6 || password.value.length > 10){
        show("passwordLength");
        hide("passwordNull");
        hide("passwordError");
        return false;
    }
    let matter = /[A-Za-z].*[0-9]|[0-9].*[A-Za-z]/;
    if (!matter.test(password.value) ){
        show("passwordError");
        hide("passwordNull");
        hide("passwordLength");
        return false;
    }
    hide("passwordLength");
    hide("passwordError");
    hide("passwordNull");
    right[1] = true;
    return true;
}

function isRePasswordLegal() {
    let rePassword = document.getElementById("rePassword");
    let password = document.getElementById("password");

    if (password.value !== rePassword.value){
        show("rePasswordError");
        return false;
    }
    hide("rePasswordError");
    right[2] = true;
    return true;
}

function isEmailLegal() {
    let email = document.getElementById("emailAddress");

    if (email.value == null || email.value === ""){
        show("emailNull");
        hide("emailError");
        return false;
    }

    let matter = /^([a-zA-Z]|[0-9])(\w)+@[a-zA-Z0-9]+\.([a-zA-Z]{2,4})$/;
    if (!matter.test(email.value)){
        show("emailError");
        hide("emailNull");
        return false;
    }

    hide("emailNull");
    hide("emailError");
    right[3] = true;
    return true;
}

function isCodeLegal() {
    let code = document.getElementById("verifyCode");

    if (code.value == null || code.value === ""){
        show("codeNull");
        hide("codeError");
        return false;
    }
    if (code.value !== document.getElementById("code").innerText) {
        show("codeError");
        hide("codeNull");
        return false;
    }
    hide("codeError");
    hide("codeNull");
    right[4] = true;
    return true;
}


function change() {
    document.getElementById("code").innerHTML = Math.floor(Math.random()*10000);
}





