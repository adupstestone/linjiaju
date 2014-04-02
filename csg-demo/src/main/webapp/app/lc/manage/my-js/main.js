/**
 * @author shenph
 */
		$(function() {
			//返回首页
		    $('#editpass').click(function() {
		        window.location.href = curUrl + '/app/lc/display/jsp/main.jsp';
		    });
		
			//安全退出
		    $('#loginOut').click(function() {
		        $.messager.confirm('系统提示', '您确定要退出本次登录吗?', function(r) {
		            if (r) {
		           	window.location.href = curUrl + '/lc/manage/action/loginAction!logout.action';
		            }
		        });
		    });
		    
		    
		});

	/*
	 var _menus = {
	"menus": [
		{
			"menuid": "0",
			"icon": "fraim_ffffff",
			"menuname": "页面静态化管理",
			"menus": [{
					"menuname": "页面管理",
					"icon": "icon-treefile",
					"url": "static-htmlPage.jsp"
				}
			]
		}
	]};

	*/
	
	var _menus;
	
	function loadMenu() {
		var menusArr = 
			$.ajax({
			url : curUrl + "/lc/manage/action/menu!loadMyMenu.action",
			type : "post",
			async : false
		}).responseText;
		var menus = [];
		if(menusArr != 'null') {
			var menusJson = $.parseJSON(menusArr);
			
			for(var i = 0; i < menusJson.length; i++) {
				var menuJson = menusJson[i];
				
				var _menuname = menuJson.menuName;
				var rownum = menuJson.rowNum;
				var menu = [];
				if(menuJson.menuLevel == '1') {
					var _menuid = menuJson.menuId;
					var _icon = "fraim_ffffff";
					menus[rownum] = {"menuid":_menuid,"menuname":_menuname,"icon":_icon,"menus":menu};
				} else if(menuJson.menuLevel == '2') {
					var _icon = "icon-treefile";
					var _menuurl = menuJson.menuUrl;
					menu = menus[rownum].menus;
					menu.push({"menuname":_menuname,"icon":_icon,"url":curUrl + _menuurl});
					menus[rownum].menus = menu;
				}
			}
		}
		_menus = {"menus":menus};
	}
	
	loadMenu();
	
	