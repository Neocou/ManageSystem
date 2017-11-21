<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>



        <div class="col-md-2 column" id="info">
            <div class="panel panel-warning" >
            	<div class="panel-heading">
                <h3 class="panel-title"  data-toggle="collapse" data-target="#test">
                        用户信息
                    </h3>
                </div>
                <div class="collapse" id="test">
	                <ul>
	                       	<li>${userinfo.userName},你好</li>
	                       	<li>部门:${userinfo.departmentName}</li>
	                       	<li>岗位:${userinfo.postName}</li>
	                       	<li>账号属于:${userinfo.roles}</li>
	                       	<li>负责区域:${userinfo.grids}</li>
	                       	<li>提醒你:${applicationScope.restMesg}</li>
	                </ul>
                </div>
            </div>
        </div>
