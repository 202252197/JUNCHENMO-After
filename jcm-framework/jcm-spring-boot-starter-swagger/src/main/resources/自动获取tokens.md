var contentType=ke.response.headers["content-type"];
console.log("响应ContentType:"+contentType)
var code = ke.response.data.code;

//判断,如果服务端响应code是200才执行操作
if( code == 200 ){
    // 获取token
    var token = ke.response.data.data.access_token;

    //1、如过需要设置的参数是Header，则设置全局Header
    ke.global.setAllHeader("Authorization", "Bearer "+token);
}