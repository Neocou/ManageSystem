<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>问题查看</title>
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
                            问题查看
                        </h2>
                    </div>
						<div >
		                    <div class="col-md-12">
		                        <div class="input-group col-md-12"> 
		                        <form action="view" method="POST">
		                             <input class="form-control" type="text" placeholder="输入问题编号" name="quesLId" />
									 <input class="form-control" type="text" placeholder="输入问题内容" name="quesLName" />
									  <input class="form-control" type="text" placeholder="输入答案内容" name="answer" />
		                            <span class="input-group-btn">
								        <Button  type="submit" name="serach" id="serachBtn" class="btn btn-info">搜索</Button>
		                             </span>
		                        </form>
		                           
		                        </div>
		
		                    </div>
		                    <div class="col-md-12 table-area pre-scrollable">
		                            <table class="table table-responsive table-bordered table-hover table-condensed">
		                                <thead>
		                                <tr>
		                                	<th>问题编号</th>
		                                    <th>问题内容</th>
		                                    <th>问题答案</th>
		                                    <th>详情查看</th>
		                                </tr>
		                            </thead>
		                            <tbody>
		                            <c:forEach items="${result}" var="a">
		                                <tr>
		                                    <td><input type = "text"  class = "form-control"  readonly="readonly" value = ${ a.quesLId } /></td>
		                                    <td><input type = "text"  class = "form-control"  readonly="readonly" value = ${ a.quesLName} /></td>
		                                    <td><input type = "text" class = "form-control"    readonly="readonly" value = ${ a.answer } /></td>
		                                    <td><Button type="submit"    class="btn btn-success" onclick="window.location.href='http://localhost:8080/ManageSystem/question/view/${ a.quesLId }'">详情</Button></td>
		                                </tr>
		                             </c:forEach>
		                            </tbody>
		                            </table>
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
