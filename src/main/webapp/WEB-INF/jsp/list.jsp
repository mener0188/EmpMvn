<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/resource/css/css.css">
<script type="text/javascript" src="<%=request.getContextPath() %>/resource/js/jquery-1.8.2.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/resource/js/axios.min.js"></script>

<script type="text/javascript">
$(document).ready(function(){
// 	alert(123);
});

function add(){
	location="toAdd";
}

function del(empid){
// 	alert(empid);
	//{}-->json
	$.ajax({
		url: "del",
		data: {"empid": empid},
		success: function(res){
// 			alert(res);
			if(res=="success"){
				location="list";
			}
		}
	});
}

//å¨é
function qx() {
	$("[name='ck']").prop("checked",true);
}
//å¨ä¸é
function qbx() {
	$("[name='ck']").prop("checked",false);
}
//åé
function fx() {
	$("[name='ck']").each(function(){
		this.checked = !this.checked;
	})
}

// function plsc(){
// 	//jquery dom [checkbox]
// 	//[] æ°ç»
// 	var ids=[];//
// 	//<input type="checkbox" name="ck" value="${m.empid }" />
// 	$("input[type='checkbox']:checked").each(function(i,dom){//æé¡µé¢éä¸­çåç´ çidæ¾å°æ°ç»ä¸­
// 		//alert($(dom).val());
// 		ids.push($(dom).val());
// 	});
// 	//alert(ids);
	
// 	$.ajax({
// 		url: "plsc?ids="+ids,
// 		data: "",
// 		success: function(res){
// 			//alert(res);
// 			if(res=="success"){
// 				location="list";
// 			}
// 		}
// 	});
// }

//plsc
function plsc(){
	var ids=[];
	//<input type="checkbox" name="ck" value="${m.empid }" />
	$("input[type='checkbox']:checked").each(function(i,dom){
		//alert($(dom).val());
		ids.push($(dom).val());
	});
	$.ajax({
		url: "plsc?ids="+ids,
		data: "",
		success: function(res){
// 			alert(res);
			if(res=="success"){
				location="list";
			}
		}
	});//axios
}

function update(empid){
	location="toUpdate?empid="+empid;
}

</script>
</head>
<body>
<h1>
注意:本案例含有两种常用的关联查询方式
</h1>
<form action="list" method="post">
电影名称,empname: <input type="text" name="empname" value="${empname }">
<input type="submit" value="search">
</form>
<br>
<table>
<tr>
   <td></td>
   <td>empid</td>
    <td>empname</td>
    <td>empdesc</td>
    <td>departid</td>
    <td>jobid</td>
<!--     <td>shengid</td> -->
<!--     <td>shiid</td> -->
<!--     <td>xianid</td> -->
    <td>age</td>
    <td>sex</td>
    <td>birth</td>
  <td>
     <input type="button" value="add" onclick="add()">
  </td>
</tr>

<c:forEach items="${empList }" var="m">
<tr>
	<td>
		<input type="checkbox" name="ck" value="${m.empid }" />
	</td>
	<td>${m.empid }</td>
	<td>${m.empname }</td>
	<td>${m.empdesc }</td>
	<td>${m.departid }</td>
	<td>${m.departname }</td>
	<td>${m.departname2 }</td>
	<td>${m.jobid }</td>
	<td>${m.age }</td>
	<td>${m.sex }</td>
	<td>${m.birth }</td>
	<td><input type="button" value="del"  onclick="del(${m.empid})" /> </td>
	<td><input type="button" value="update"  onclick="update(${m.empid})" /> </td>
</tr>
</c:forEach>
<tr>
<td colspan="13"> ${fenye } </td>
</tr>
<tr>
<td colspan="13">
	<input type="button" value="qx" onclick="qx()" />
	<input type="button" value="fx" onclick="fx()" />
	<input type="button" value="qbx" onclick="qbx()" />
	
	<input type="button" value="plsc" onclick="plsc()" />
	
</td>
</tr>
</table>

</body>
</html>