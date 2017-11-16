<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>在线用户查看</title>
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
            <div class="col-md-12">
                        <h2 class="text-center">
                            在线用户查看
                        </h2>
                    </div>

            <div class="col-md-12 table-area pre-scrollable">


                    <form action="/ManageSystem/online/select" method="POST" >
                      <div class="col-md-2">
                        <label for="sumform" >选择状态</label>
                            <select class="form-control" name = "status"  >
                                <option value = "在线">在线</option>
                                <option value = "离线">离线</option>
                            </select>
                            </div>
                            <div class="col-md-2" style="padding-top:25px">
                                <input class="btn btn-primary"  type="submit" value="确认" />
                             </div>
                   </form>
                        <table class="table table-hover table-striped">
							<thead>
                                <tr>
                                    <th>用户工号</th>
                                    <th>用户姓名</th>
                                    <th>用户状态</th>
                                </tr>
                           </thead>
                           <tbody>
                                <c:forEach items="${users}" var="a">
                                <tr>
                                    <td><input type = "text"   class = "form-control"  readonly="readonly" value= "${ a.userNumber}" /></td>
                                    <td><input type = "text"   class = "form-control"  readonly="readonly" value= "${ a.userName}" /></td>
                                    <td><input type = "text"   class = "form-control"  readonly="readonly" value= "${ a.userStatus}" /></td>
                                </tr>
								</c:forEach>
						</tbody>
                        </table>

                
            </div>   
            </div>
 			</div>
        </div>
		<%@ include file="/WEB-INF/views/common/right.jsp"%> 
	</div>

</div>

</body>
</html>
