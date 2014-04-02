//检验密码
function checkPassword(value){
	//数字、字母 加字符  验证
	//if(!/[0-9]+/.test(value)||!/[a-zA-Z]+/.test(value)||!/[^0-9a-zA-Z]/.test(value)) {
	
	//数字、字母   验证
	if(!/[0-9]+/.test(value)||!/[a-zA-Z]+/.test(value)) {
		return true;
	}
	return false;
}

//检验手机串码
function checkImeiCode(value){
	var reg = /^\d{15}$/;//十五个数字
	if(reg.test(value)) {
		return true;
	}
	return false;
}

//检验联通手机号码
function checkLTmun(value){
	var reg = /^1(3[0-2]|5[56]|8[56])\d{8}$/;
	if(reg.test(value)) {
		return true;
	}
	return false;
}

//检查字符串的长度
function checkStrLength(str){
	if(str.length == 0){
		return 0;
	}else{
		//先检查，把所有的汉字替换为任意两个字节的字母
		var rulerReplace = /[\u4e00-\u9fa5]/;
		for(var i=0;i<str.length;i++){
			str = str.replace(rulerReplace,"**");
		}
		return str.length;
	}
}

//校验是否是合法的数字
function isValidateNumber(num){
	var rule1 = /^(\d+)$/; //没有小数的正整数，不限制位数
	var rule2 = /^(\d+)[.](\d+)$/; //有小数的数字
	
	//如果是数字或者是含小数的数字，且大于0
	if((rule1.test(num) || rule2.test(num)) && parseFloat(num)>=0){
		return true;
	}
	else{
		return false;
	}
}

//校验是否是合法的数字(整数)
function isValIntegerNumber(num){
	var rule1 = /^(\d+)$/; //没有小数的正整数，不限制位数
	
	//如果是数字或者是含小数的数字，且大于0
	if(rule1.test(num) && parseFloat(num)>=0){
		return true;
	}
	else{
		return false;
	}
}

//对数字四舍五入
function roundNumber(number,decimals) {  
	//alert("roundNumber") ;
    var newString;// The new rounded number  
    decimals = Number(decimals);  
    if (decimals < 1) {  
        newString = (Math.round(number)).toString();  
    } else {  
        var numString = number.toString();  
        if (numString.lastIndexOf(".") == -1) {// If there is no decimal point  
            numString += ".";// give it one at the end  
        }  
        var cutoff = numString.lastIndexOf(".") + decimals;// The point at which to truncate the number  
        var d1 = Number(numString.substring(cutoff,cutoff+1));// The value of the last decimal place that we'll end up with  
        var d2 = Number(numString.substring(cutoff+1,cutoff+2));// The next decimal, after the last one we want  
        if (d2 >= 5) {// Do we need to round up at all? If not, the string will just be truncated  
            /*if (d1 == 9 && cutoff > 0) {// If the last digit is 9, find a new cutoff point  
                while (cutoff > 0 && (d1 == 9 || isNaN(d1))) {  
                    if (d1 != ".") {  
                        cutoff -= 1;  
                        d1 = Number(numString.substring(cutoff,cutoff+1));  
                    } else {  
                        cutoff -= 1;  
                    }  
                }  
            }  */
            d1 += 1;  
        }   
        if (d1 == 10) {  
            numString = numString.substring(0, numString.lastIndexOf("."));  
            var roundedNum = Number(numString) + 1;  
            newString = roundedNum.toString() + '.';  
        } else {  
        	if(d1.toString()=="0"){
        		newString = numString.substring(0,cutoff); 
        	}
        	else{
        		newString = numString.substring(0,cutoff) + d1.toString(); 
        	}
        }  
    }  
    if (newString.lastIndexOf(".") == -1) {// Do this again, to the new string  
        newString += ".";  
    }  

    var decs = (newString.substring(newString.lastIndexOf(".")+1)).length; 
    if(decs==0){
    	newString = newString.substring(0,newString.length-1);
    }
     
    for(var i=0;i<decimals-decs;i++) newString += "";
    //var newNumber = Number(newString);// make it a number if you like  
    return newString; // Output the result to the form field (change for your purposes)  
}

//浮点数加法运算
function FloatAdd(arg1,arg2){
    var r1,r2,m;
    try{r1=arg1.toString().split(".")[1].length}catch(e){r1=0}
    try{r2=arg2.toString().split(".")[1].length}catch(e){r2=0}
    m=Math.pow(10,Math.max(r1,r2))
    return (arg1*m+arg2*m)/m
}

//浮点数减法运算
function FloatSub(arg1,arg2){
	var r1,r2,m,n;
	try{r1=arg1.toString().split(".")[1].length}catch(e){r1=0}
	try{r2=arg2.toString().split(".")[1].length}catch(e){r2=0}
	m=Math.pow(10,Math.max(r1,r2));
	//动态控制精度长度
	n=(r1>=r2)?r1:r2;
	return ((arg1*m-arg2*m)/m).toFixed(n);
}
  
//浮点数乘法运算
function FloatMul(arg1,arg2) { 
   var m=0,s1=arg1.toString(),s2=arg2.toString(); 
   try{m+=s1.split(".")[1].length}catch(e){} 
   try{m+=s2.split(".")[1].length}catch(e){} 
   return Number(s1.replace(".",""))*Number(s2.replace(".",""))/Math.pow(10,m) 
} 


 //浮点数除法运算
 function FloatDiv(arg1,arg2){ 
	var t1=0,t2=0,r1,r2; 
	try{t1=arg1.toString().split(".")[1].length}catch(e){} 
	try{t2=arg2.toString().split(".")[1].length}catch(e){} 
	with(Math){ 
	    r1=Number(arg1.toString().replace(".","")) 
	    r2=Number(arg2.toString().replace(".","")) 
	    return (r1/r2)*pow(10,t2-t1); 
	} 
 } 

//鼠标显示手势
function mouseoverOccur(obj) {
	$(obj).css("cursor", "pointer");
}

//验证手机号码合法性
function validateMobile(value) {
	var reg1 = /^13\d{9}$/;
	var reg2 = /^15[0-35-9]\d{8}$/;
	var reg3 = /^18[05-9]\d{8}$/;
	if(reg1.test(value) || reg2.test(value) || reg3.test(value)) {
		return true;
	}
	return false;
}

//验证邮箱合法性
function validateMail(value) {
	var reg = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
	if(reg.test(value)) {
		return true;
	}
	return false;
}

//验证固话合法性
function validateTel(value) {
	var reg = /^[+]{0,1}(\d){1,3}[ ]?([-]?((\d)|[ ]){1,12})+$/;
	if(reg.test(value)) {
		return true;
	}
	return false;
}

//验证邮编合法性
function validatePostal(value) {
	var reg = /^[a-zA-Z0-9 ]{3,12}$/;
	if(reg.test(value)) {
		return true;
	}
	return false;
}

/**html获取网站根目录**/
function getRootPath(){ 
	var strFullPath=window.document.location.href; 
	var strPath=window.document.location.pathname; 
	var pos=strFullPath.indexOf(strPath); 
	var prePath=strFullPath.substring(0,pos); 
	var postPath=strPath.substring(0,strPath.substr(1).indexOf('/')+1); 
	return(prePath+postPath); 
} 

/**
 * 锁屏
 */
loadingDialog = function(flag) {
	if (flag == 1) {
		jQuery("#loading").dialog( {
			modal : true,
			width : 250,
			height : 100
		});
		$(".ui-dialog-titlebar").hide();
	} else {
		jQuery("#loading").dialog("close");
		$(".ui-dialog-titlebar").show();
	}
};