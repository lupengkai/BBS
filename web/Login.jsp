<%@ page import="jdk.nashorn.internal.ir.RuntimeNode" %>
<%@ page contentType="text/html;charset=GBK" language="java" %>

<%
	out.println("123456");
	String username = request.getParameter("username");
	String password = request.getParameter("password");
	String action = request.getParameter("action");

	if (action != null) {
		if (username !=null && username.equals("13130120135") ) {
			if (password != null && password.equals("284812")) {
				out.println("Welcome, ³����");
                session.setAttribute("login","true");
                response.sendRedirect("ShowArticleTree.jsp");
			} else {
				out.println(" error password");
			}
		} else {


			out.println("error username");
		}
		return ;
	}

%>

<html><head>
<meta http-equiv="content-type" content="text/html; charset=GBK"><script src="images/showXnxq.html" type="text/javascript"></script><script src="images/jquery_002.js" type="text/javascript"></script><link href="images/validationengine.css" media="screen" type="text/css" rel="stylesheet"><script src="images/validationengine.js" type="text/javascript"></script></head><body><div id="main">










<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<title>�������ӿƼ���ѧͳһ�����֤ƽ̨</title>
<script type="text/javascript" src="images/jquery.js"></script>
<script type="text/javascript" src="images/easyloader.js"></script>
<script type="text/javascript" src="images/cas-wisedu-redirect.js"></script>

	
	
		<link type="text/css" rel="stylesheet" href="images/lovey.css">
		<link rel="stylesheet" type="text/css" href="images/custom.css">
	



	
		
		
			<div class="ui_container_fluid">
				<div class="header">
					<span><a href="http://www.xidian.edu.cn/" target="_blank">�������ӿƼ���ѧ</a> | <a href="http://www.xidian.edu.cn/index/wzdt.htm" target="_blank">��������</a></span>
				</div>
			</div>
		
	

<script type="text/javascript" src="images/jquery_003.js"></script>
<link type="text/css" rel="stylesheet" media="screen" href="images/onScreenKeyboard.css">
<link type="text/css" rel="stylesheet" media="screen" href="images/style.css">

    

 <div class="banner-bg">
	<div class="right-area">
		<div class="form-title"></div>
		<div class="form-area">
			<ul>
			 <form id="casLoginForm" class="fm-v clearfix" action="Login.jsp" method="post">
			 		<input name="action" value="post" type="hidden">
				 <li><img src="images/arr.gif"> �û�����
				 <input id="username" name="username" class="input_medium validate[required] osk-trigger" tabindex="1" placeholder="ѧ�Ż򹤺�" data-osk-options="disableReturn"  size="25" autocomplete="false" type="text">
				</li>
				  <li> <img src="images/arr.gif"> ��<span></span>�룺
					<input id="password" name="password" class="input_medium validate[required] osk-trigger" tabindex="2" data-osk-options="disableReturn"  autocomplete="off" type="password">
				  </li>
				 <input type="SUBMIT" name="submit" value="�ύ">
          <li>
            <p><a href="#">
				<input class="subbut" tabindex="4" value="" accesskey="l" name="submit" type="submit">
				</a><a href="http://ids.xidian.edu.cn/authserver/getBackPasswordMainPage.do"><img src="images/cz.asc" height="26" width="68"></a></p>
          </li>
		 
          <h3><img src="images/dotline.asc"></h3>
          <h4><div style="float:right"><img src="images/arrb.asc"><span><a href="http://my.xidian.edu.cn/login/login_explain.html" target="_blank">��¼��ϸ˵��</a></span></div>
		  </h4><br><br>
		   <h4><img src="images/arrb.asc"><span>�û�������ʦ���ʺţ�ѧ��ѧ�ţ�����Ĭ�Ͼ�Ϊ���֤����λ����ĸ���ִ�Сд����<br>����ʾ���˺š������롱��������д�˺š��������绰�����֤�š����ʼ������䡣<br>��Ϣ�����䣺xdxxc@mail.xidian.edu.cn <br>��Ϣ���绰��029-88201650  88201250 
</span></h4>


		   </form>
        </ul>
		</div>
	</div>
 </div>
 <script type="text/javascript">
    $(document).ready(function(){
        using("validationengine",function(){
            $("#casLoginForm").validationEngine({
            	hideFormError:false,
                allRules:{
                    "required":{
                        "alertText" : "* ����Ϊ��."
                    }
                }
            });//Ĭ���޲ε����
        });

        var osk = GetQueryString("osk");
        if (osk == 'true' || osk == 'on') {
            $(function () {
                $('.osk-trigger').onScreenKeyboard({
                    rewireReturn : 'submit',
                    rewireTab : true
                });
            });
        }

        function GetQueryString(name){
            var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
            var r = window.location.search.substr(1).match(reg);
            if (r!=null) return unescape(r[2]); return null;
        }
		getHtmlDataByGet('http://my.xidian.edu.cn/xidian/showXnxq.jsp',showXnxq);
    });
	function fsubmit(){
		$("#casLoginForm").submit();
	}
	function fclear(){
		$("#username").val("");
		$("#password").val("");
		
	}
	function showXnxq(data){
		$('xnxq').html(data);
	}
	function getHtmlDataByGet(url, onLoadSuccess) {
		var type = "GET";
		var async = true;
		var dataType = "html";
		var timeout = 100000;
		var data="";
		
		$.ajax({
			type : type,
			url : url,
			async : async,
			dataType : dataType,
			timeout : timeout,
			data : data,
			success : function(data, statu) {
				onLoadSuccess(data);
			},
			error : function(XMLHttpRequest, textStatus, errorThrown) {
				
			}
		});
}
</script>
<style>

.callback_err_login {
	 position: relative;
}

.input_medium {
    background: none repeat scroll 0 0 #D8D8D8;
    border: 1px solid #B2B2B2;
    height: 28px;
    line-height: 28px;
    width: 150px;
}

.form-area h4 span {
    width: auto;
}
.subbut{
	margin-right: 10px; 
	padding-top: 12px; 
	width: 70px; 
	background: url('/authserver/css/login/images/dl.png') no-repeat scroll center top transparent; 
	height: 26px;
}
</style>

<div class="footer">

    <p><span style="padding-left:300px;padding-left:0px\9;">��Ȩ����  �������ӿƼ���ѧ
</span></p>
<p><span style="padding-left:260px;padding-left:0px\9;">
��У����ַ������ʡ����������·��¡��266��   �ʱ�710126   ��У����ַ:����ʡ������̫����·2�� 
</span></p>
  </div>
      <script type="text/javascript">

        var result = null;
        window.onload = function () {
            var script = document.createElement("script");
            script.type = "text/javascript";
            script.src = "http://my.xidian.edu.cn/xidian/showXnxq.jsp";

            var head = document.getElementsByTagName("head")[0];
            head.insertBefore(script, head.firstChild);

        };

        function showXnXq(data) {
			
            document.getElementById('xnxq').innerHTML=data;
        }

        
    </script>
  <script type="text/javascript" src="images/cas-wisedu.js"></script>


</div></body></html>