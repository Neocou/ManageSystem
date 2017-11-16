<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


    <div class="row clearfix" id="header">
        <div class="col-md-2"></div>
        <div class="col-md-6 column">
            <div class="page-header">
                <h1 class="text-center" >
                    <font size="20">管理系统</font>
                </h1>
            </div>
        </div>
        <div class="col-md-4 column">
            <ul class="nav nav-pills pull-right">
                <li><form action="/ManageSystem/personinfo" method="get"><button class="btn btn-primary">个人信息</button></form></li>
                <li><form action="/ManageSystem/logout" method="get"><button class="btn btn-danger">注销</button></form></li>
            </ul>
        </div>
    </div>
