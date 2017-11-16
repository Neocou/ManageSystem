<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>用户管理</title>
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
							<h2 class="text-center">用户管理</h2>
							</div>

                    <div class="col-md-12">
                        <div class="input-group col-md-12">
             

                            <span class="input-group-btn">
						        <Button  type="button" name="serach" id="serachBtn" class="btn btn-primary" onclick="window.location.href='http://localhost:8080/ManageSystem/user/select'"> 搜索</Button>
                             </span>
                            <Button  type="button" name="add" class="btn btn-primary pull-right" onclick="window.location.href='http://localhost:8080/ManageSystem/user/add'">添加新用户</Button>
                        </div>

                    </div>
            </div>

        </div>
 			</div>
        </div>
		<%@ include file="/WEB-INF/views/common/right.jsp"%> 
	</div>

</div>
</body>
</html>
