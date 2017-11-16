<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>区块管理</title>
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
                            区块管理
                        </h2>
                    </div>
                <form action="grid/add" style="position:absolute;right:15px;">
                <input class="btn btn-info" type="submit" value="指定区块分配人选" ></input>
                </form>
				<Button type="button"  class="btn btn-primary center-block clearfix" data-toggle="collapse" data-target="#street">区块查看</Button>
					<ul id="street" class="collapse">
						<c:forEach items = "${streets}" var = "street">
							<li><Button type="button" class="btn btn-info" data-toggle="collapse" data-target="#community${ street.streetId}">${street.streetName}</Button>	</li>
								<ul id="community${ street.streetId}" class="collapse">
									<c:forEach items = "${street.communitis}" var = "community">
											<li><Button type="button" class="btn btn-success" data-toggle="collapse" data-target="#grid${community.communityId }">${community.commName }</Button></li>
												<ul id="grid${community.communityId }" class="collapse">
													<c:forEach items = "${community.grids}" var = "grid" >
														<li ><a class="btn btn-danger" href="http://localhost:8080/ManageSystem/grid/${grid.gridId}">${grid.gridInformation}</a></li>
													</c:forEach>
												</ul>
									</c:forEach>
								</ul>
						</c:forEach>
					</ul>

            </div>
			</div>
        </div>
		<%@ include file="/WEB-INF/views/common/right.jsp"%> 
	</div>

</div>
      
</body>
</html>
