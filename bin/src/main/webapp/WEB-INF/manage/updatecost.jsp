<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="${rootPath }js/jquery-min.js" type="text/javascript"></script>
	<script src="${rootPath }js/jquery.carouFredSel-6.0.4-packed.js" type="text/javascript"></script>		
	<link rel="stylesheet" type="text/css" href="${rootPath }css/updatemyself.css">
</head>
<body>
<div class="edit">
<%-- 	<br/><p>${updateUserMsg }</p> --%>
	<form action="${rootPath}manage/IncomeManager_updateIncome" method="post">
   			 <table class="box2"> 		 
	<div id="wrapper">
			<div class="first">
			<br>
				<dl id="ticker-1">
				  <dd>温馨提醒：只有带*的可以修改</dd>
				  <dd>温馨提醒：只有带*的可以修改</dd>
				  <dd>温馨提醒：只有带*的可以修改</dd>
	 			</dl>
			</div>			 
	    </div><br><br>
	    		<tr>
	    			<td><input type="hidden" name="cost.co_id" value="${updateCost.co_id}"></td>
	    		</tr>
   			 	<tr class="text2"> 
					<td><span>支出时间</span></td>
   			 		<td><input type="text" name="cost.co_time" value="${updateCost.co_time}" class="sang_Calender" required id="inp"></td>
   			 		<script type="text/javascript" src="${rootPath }js/datetime.js"></script>
   			 		<td class="td">*</td>
   			 	</tr>
   			 	<tr class="text2"> 
					<td><span>支出条目</span></td>
   			 		<td><select name="cost.co_entry" class="sel2">
			              	<option value="${updateCost.co_entry }">${updateCost.co_entry }</option>
			              	<c:forEach items = "${allEntry.data}" var="entry">
							<c:if test="${entry.en_type eq '支出条目'}"><option value="${entry.en_name}">${entry.en_name}</option></c:if>
							</c:forEach></select></td>
   			 		<td>*</td>
   			 	</tr>
   			 	<tr class="text2"> 
					<td><span>金额</span></td>
   			 		<td><input type="text" name="cost.co_money" value="${updateCost.co_money}" required class="inp"></td>
   			 		<td>*</td>
   			 	</tr>
   			 	<tr class="text2"> 
					<td><span>操作人姓名</span></td>
   			 		<td><input type="text" name="cost.co_operator" value="${updateCost.co_operator}" required class="inp"></td>
   			 		<td>*</td>
   			 	</tr>
   			 	<tr class="text2"> 
   			 		<td><span>操作工会</span></td>
   			 		<td><select name="cost.co_union" class="sel2">
			              	<option value="${updateCost.co_union }">${updateCost.co_union }</option>
			              	<c:forEach items = "${allLabour.data}" var="union">
							<option value="${union.un_name }">${union.un_name }</option></c:forEach>
              			</select></td>
   			 		<td>*</td>
   			 	</tr>
   			 	<tr class="text2"> 
					<td><span>备注</span></td>
   			 		<td>
   			 		<textarea rows="5" cols="20" name="cost.co_remark" style="margin-left:20px;border-radius:5px">${updateCost.co_remark }</textarea>
   			 		<td>*</td>
   			 	</tr>
   			 	<tr class="text2"> 
		 			<td>
		 				<input type="submit" value="提交" class="sub subm">
		 				<input type="button" value="返回" class="subm" onclick="window.history.go(-1)">
		 			</td>
   			 	</tr>
			</table>
</form>
</div><!-- 添加用户 -->
<script type="text/javascript">
			$(function() {
				var _scroll = {
					delay: 1000,
					easing: 'linear',
					items: 1,
					duration: 0.07,
					timeoutDuration: 0,
					pauseOnHover: 'immediate'
				};
				$('#ticker-1').carouFredSel({
					width: 1000,
					align: false,
					items: {
						width: 'variable',
						height: 35,
						visible: 1
					},
					scroll: _scroll
				});	 
			});
		</script>

</body>
</html>