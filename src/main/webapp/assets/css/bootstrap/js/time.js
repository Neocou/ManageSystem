
  $(function() {
	    $( "#from" ).datepicker(
	      {
	        language:  "zh-CN",  
	        autoclose: true,  
	        startView: 0,  
	        format: "yyyy-mm-dd",  
	        todayBtn:"linked",  
	        todayHighlight : true,  
	        startDate:new Date()  
	      }).on('changeDate', function(ev){               
	    	      var startTime = ev.date;  
	    	      $("#to").datepicker('setStartDate',startTime);  
	        })  


	    $( "#to" ).datepicker({
	        language:  "zh-CN",  
	        autoclose: true,  
	        startView:0,  
	        format: "yyyy-mm-dd",  
	        todayBtn:"linked",  
	        todayHighlight : true,  
	        startDate:new Date()  
	    }).on('changeDate', function(ev){    
	    	    var endTime = ev.date;  
	    	    $("#from").datepicker('setEndDate',endTime);  
	    });
	  });
