
/**
 * 
 * @param accessmodule 模块 :首页
 * 
 * @param accessmodule 大类模块 :首页
 * 
 * @author SHENPH
 */
function logAnalysis(accessmodule,module){
	$.ajax({
		url : curUrl+"/log/log!addLog.action",
		type : "post",
		data : {
			accessmodule : accessmodule,
			module : module
		},
		success : function(data){
			
		}
	});
}