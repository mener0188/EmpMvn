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
	alert("add");
	//初始化下拉框
	$.ajax({
		url: "getDepartList",
		data: "",
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
		success: function(res){
			$.each(res,function(i,bean){
				$("select[name='jobid']").append("<option value='"+bean.jobid+"'>"+bean.jobname+"</option>");
			});
		}
	});
	
	
});

function add(){
	;
	
	$.ajax({
		url: "add",
		data: $("form").serialize(),
		success: function(res){
// 			alert(res);
			if(res=="success"){
				//BOM
				location="list";
			}
		}
	});
}
</script>
</head>
<body>

<form>
<table>

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