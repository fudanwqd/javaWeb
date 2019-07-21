function paging(page) {
    var xmlhttp;
    if (window.XMLHttpRequest)
    {
        //  IE7+, Firefox, Chrome, Opera, Safari 浏览器执行代码
        xmlhttp=new XMLHttpRequest();
    }
    else
    {
        // IE6, IE5 浏览器执行代码
        xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
    }

    xmlhttp.onreadystatechange=function(){

    if (xmlhttp.readyState==4 && xmlhttp.status==200)
    {
        document.getElementById("searchdiv").innerHTML=xmlhttp.responseText;
    }
}
xmlhttp.open("GET","/SearchServlet?page="+page,true);
xmlhttp.send();
}
var curPage = 1; //当前页码
$(document).ready(function() {
    paging(1);

});
// function getData(page) {
//     $.ajax({
//         type : 'POST',
//         url : '/Searchservlet',
//         data : {
//             'pagenow' : page
//         },
//         dataType : 'json',
//         success : function (json) {
//             $("searchdiv").empty();
//             totalpage = json.totalPage;
//             curPage  = json.curPage;
//             var limitSearches = json.limitSearches;
//             if(limitSearches.length>0){
//                 var row;
//                 if(limitSearches.length%3==0){
//                     row = limitSearches.length/3;
//                 }else{
//                     row = limitSearches.length/3+1;
//                 }
//             for(var i=0;i<row;i++){
//                 for(var j = 3*i;j<limitSearches.length&&)
//                 var searches = ""
//             }
//         }
//         }
// })
// }
//
