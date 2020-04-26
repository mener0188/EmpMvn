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
<script type="text/javascript" src="<%=request.getContextPath() %>/resource/My97DatePicker/WdatePicker.js"></script>

<script type="text/javascript">
$(document).ready(function(){
// 	alert("add");
	//初始化下拉框
	$.ajax({
		url: "getDepartList",
		data: "",
		async: false,
		success: function(res){
			//for
			$.each(res,function(i,bean){
				$("select[name='departid']").append("<option value='"+bean.departid+"'>"+bean.departname+"</option>");
			});
		}
	});
	
	
	$.ajax({
		url: "getJobList",
		data: "",
		async: false,
		success: function(res){
			$.each(res,function(i,bean){
				$("select[name='jobid']").append("<option value='"+bean.jobid+"'>"+bean.jobname+"</option>");
			});
		}
	});
	
	//ajax 同步和异步
	var empid=$("input[name='empid']").val()
	$.ajax({
		url: "getEmpById?empid="+empid,
		data: "",
		success: function(res){
// 			alert(res);
			//地段区分大小写
			$("input[name='empname']").val(res.empname);
			$("input[name='empdesc']").val(res.empdesc);
			$("input[name='birth']").val(res.birth);
			//下卡捐给复制
			$("select[name='departid']").val(res.departid);
			$("select[name='jobid']").val(res.jobid);
		}
		
	});
	
	
});


</script>
</head>
<body>

<form>
<table>
<tr><td>empid: </td><td><input type="text" name="empid" value="${param.empid }" readonly="readonly"/></td></tr>
<tr><td>empname: </td><td><input type="text" name="empname" /></td></tr>
<tr><td>empdesc: </td><td><input type="text" name="empdesc" /></td></tr>
<tr><td>birth: </td><td><input type="text" name="birth" onclick="WdatePicker()"/></td></tr>
<tr><td>depart: </td>
<td><select name="departid">
	<option value="">空</option>  
</select></td></tr>
<tr><td>job: </td><td>
<select name="jobid">
	<option value="">空</option>  
</select>
</td></tr>
<tr><td><input type="button" value="add" onclick="add()" /></td></tr>
</table>


</form>

</body>
</html>