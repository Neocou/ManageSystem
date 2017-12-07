<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户查询</title>
	<%@ include file="/WEB-INF/views/common/js.jsp"%> 
</head>
<body>
<div class="container">
	<%@ include file="/WEB-INF/views/common/moren.jsp"%> 
    <div class="row clearfix">
		<%@ include file="/WEB-INF/views/common/left.jsp"%> 
    	<div class="col-md-8 column" id="main-page">
    		<div class="container-fluid">
			<%@ include file="/WEB-INF/views/common/top.jsp"%> 
				<div class="row">
		            <div class="col-md-12" id="main-content">
		                   <div class="col-md-12">
							<h2 class="text-center">用户查询</h2>
							</div>
		
						<div >
		                    <div class="col-md-12">
		                        <div class="input-group col-md-12"> 
		                        <!-- <form action="select" method="post"> -->
									 <input class="form-control" type="search" placeholder="输入用户编号" name="userNumber" id=userNumber>
									  <input class="form-control" type="search" placeholder="输入用户姓名" name="userName" id="userName">
									   <input class="form-control" type="search" placeholder="输入部门" name="departmentName" id="departmentName">
										<input class="form-control" type="search" placeholder="输入岗位" name="postName" id="postName">
		                            <div>
		                            <span class="input-group-btn">
								        <Button  type="button" name="serach" id="testBtn" class="btn btn-info">搜索</Button>
		                             </span>
		                             </div>
		                         <!--     </form> -->
		                           
		                        </div>
		
		                    </div>
		                    <div class="col-md-12 table-area pre-scrollable">
		                            <table id="DepartmentTable" class="table table-responsive table-bordered table-hover table-condensed">
		                               <thead>
		                                <tr>
		                                	<th>用户编号</th>
		                                    <th>用户姓名</th>
		                                    <th>部门</th>
		                                    <th>岗位</th>
		                                    <th>详细</th>
		                                </tr>
		                            </thead>
		                            <tbody>
	<%-- 	                            <c:forEach items="${users}" var="a">
		                                <tr>
		                                    <td><input type = "text" class = "form-control"  readonly="readonly" value = ${ a.userNumber } /></td>
		                                    <td><input type = "text" class = "form-control"  readonly="readonly" value = ${ a.userName} /></td>
		                                    <td><input type = "text" class = "form-control"   readonly="readonly" value = ${ a.departmentName } /></td>
		                                    <td><input type = "text" class = "form-control"  readonly="readonly" value = ${ a.postName } /></td>
		                                    <td><Button type="submit"    class="btn btn-success" onclick="window.location.href='http://localhost:8080/ManageSystem/users/select/${ a.userNumber }'">详情</Button></td>
		                                </tr>
		                             </c:forEach>
		                             --%>
		                            </tbody> 
		                            </table>
		                    </div>
					</div>
		            </div>   
		            </div>
			</div>
        </div>
		<%@ include file="/WEB-INF/views/common/right.jsp"%> 
	</div>

</div>
<script type="text/javascript">
$('#testBtn').click(function () { 
	 var userNumber=$("#userNumber").val();
	 var userName=$("#userName").val();
	 var departmentName=$("#departmentName").val();
	 var postName=$("#postName").val();
	  $.ajax({  
           type: "post",  
           dataType:"json",
           data: {	 
        	  "userNumber":userNumber,
	      	  "userName":userName,
	    	  "departmentName":departmentName,
	    	  "postName":postName
    	 },  
           url: "select",  
        
            success: function (data) {  
            	$('#DepartmentTable tbody').html("");
            	var str = "";
				$.each(data,function(index,item){
					str ="<tr>"
					+"<td>"+item.userNumber+"</td>"
					+"<td>"+item.userName+"</td>"
					+"<td>"+item.departmentName+"</td>"
					+"<td>"+item.postName+"</td>"
					+"<td><Button type='button'   class='btn btn-success' onclick=\"window.location.href='http://localhost:8080/ManageSystem/users/select/"+item.userNumber+"'\">详情</Button></td>"+
					"</tr>";
					$('#DepartmentTable tbody').append(str);
				});
           },   
           error: function () {  
               alert("查询失败")  
           }  
       });  
 });  
</script>
</body>
</html>