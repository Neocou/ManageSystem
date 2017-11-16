<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="description" content="">
    <meta name="keywords" content="">
    <link rel="stylesheet" href="http://localhost:8080/ManageSystem/assets/css/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="http://localhost:8080/ManageSystem/assets/css/bootstrap/css/bootstrap-datepicker3.css">
    <link rel="stylesheet" href="http://localhost:8080/ManageSystem/assets/css/bootstrap/css/index.css">
    <script src="http://localhost:8080/ManageSystem/assets/css/bootstrap/js/jquery-3.2.1.min.js" ></script>
    <script src="http://localhost:8080/ManageSystem/assets/css/bootstrap/js/bootstrap.min.js" ></script>
    <script src="http://localhost:8080/ManageSystem/assets/css/bootstrap/js/bootstrap-datepicker.js" ></script>
     <script src="http://localhost:8080/ManageSystem/assets/css/bootstrap/js/time.js" ></script>
    <script src="http://localhost:8080/ManageSystem/assets/css/bootstrap/js/bootstrap-datepicker.zh-CN.min.js" ></script>
<script>
    $(document).ready(function(){
        $(document).off('click.bs.dropdown.data-api');
        dropdownOpen();
    });

    function dropdownOpen() {

        var $dropdownLi = $('li.dropdown');

        $dropdownLi.mouseover(function() {
            $(this).addClass('open');
        }).mouseout(function() {
            $(this).removeClass('open');
        });
    }
</script>
