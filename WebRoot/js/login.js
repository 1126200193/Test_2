var error ='<%=request.getParameter("error")%>';
  if(error=='yes'){
   alert("登录失败!");
  }
var code="" ; //在全局 定义验证码
function createCode(){ 
code = "";
var codeLength = 6;//验证码的长度
var checkCode = document.getElementById("checkCode");
checkCode.value = "";
var selectChar = new Array(0,1,2,3,4,5,6,7,8,9,'A','B','C','D','E','F','G','H','J','K','L','M','N','P','Q','R','S','T','U','V','W','X','Y','Z');

for(var i=0;i<codeLength;i++) {
   var charIndex = Math.floor(Math.random()*32);
   code +=selectChar[charIndex];
}
if(code.length != codeLength){
   createCode();
}
document.getElementById("checkCode").innerHTML = code;
}
function checkform(){
      var username=document.login.username.value;
      var password=document.login.password.value;
      var inputCode = document.getElementById("checkNum").value.toUpperCase();
      if(username==''){
           alert("您的账号不能为空！");
           document.login.username.focus();
           return false;
      }
      if(password==''){
      	alert("您的密码不能为空！");
      	document.login.password.focus();
      	return false;
      }
      if(inputCode.length <=0) {
        alert("请输入验证码!");
        return false;
     }
     else if(inputCode != code ){
        alert("验证码输入错误!");
        createCode();
        return false;
     }
 }
  $(document).ready(function(){
     
          var strName = localStorage.getItem('keyName');  
          // 获取指定key本地存储的值
          var strPass = localStorage.getItem('keyPass');
          if(strName){
              $('#user').val(strName);
          }if(strPass){
              $('#pass').val(strPass);
          }
   
      });
       function CheckForm(){
            var strName = $('#user').val();
            var strPass = $('#pass').val();
            localStorage.setItem('keyName',strName);
            // 将value存储到key字段
            if($('#remember').is(':checked')){
                localStorage.setItem('keyPass',strPass);
            }else{
                localStorage.removeItem('keyPass');
            }
       } 