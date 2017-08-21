	function doPrintYearList() {
		
		/*var data = $("#SelectedProject option:selected").text();
		$.ajax({
			type : "GET",
			url : "getTaskListById/" + data,
			success : function(data) {
				console.log(data);
				$('#displayRegisterForm').html(data);
			},

		});*/
		 var id = $("#assId option:selected").text();
	/*	var id = $('#assId').val();*/
		        $.ajax({
		        	type : 'GET',
		        	 dataType: 'json',
		        	url : 'getCycleYearsForAssociate/' + id,
		            success:function(response){
		            	  var len = response.length;
		            	  var i;
		            	  var yearList = response;
		            	  $('#associateYearlist').empty();
		            	 
		                 for( i = 0; i<len; i++){
		                     //var id = response[i]['id'];
		                     var year = yearList[i];
		                     
		                     $('#associateYearlist').append("<option value='"+year+"'>"+year+"</option>");
		            	
		            	/*iterating over the data which is an year list*/
		            /*	 $('#associateYearlist').empty();
		                     $.each(data, function(index, value) {
		                         $('#associateYearlist').append($('<option>').text(value).val(index));
		                     });*/

		              }
		            }
		      /*  });*/
		 
	});
	}


$(document).ready(function(){
	
	$("#cycleYear").on('change',function(){
		   if($(this).val()=="2017-2018")
		       $("#addAppraisal").prop('disabled',false).css('opacity',1);
		   else
		       $("#addAppraisal").prop('disabled',true).css('opacity',0.5);
		});
	
	
	
	$("#associateYearlist").on('change',function(){
		   if($(this).val()=="2017-2018")
		       $("#addAppraisal").prop('disabled',false).css('opacity',1);
		   else
		       $("#addAppraisal").prop('disabled',true).css('opacity',0.5);
		});
	
/* $("#addAppraisal").click(function (e) {
	 e.stopPropagation();
     var year = $("#cycleYear");
     if (year.val()!="2017") {
         //If the "Please Select" option is selected display error.
         alert("Please select current year");
         return false;
     }
	
	
     else
    	 $("#dashform").submit();
 });
 */
	
/*	$("#viewAppraisal, #addAppraisal").click(function (e) {
		  if($(this).val()=="2017-2018")
			  {
				 e.stopPropagation();
	    $("#dashform").submit();
			  }
		  else
			  alert("Please select current year");
		      return false;
		  
			  
	 });*/
$("#viewAppraisal, #addAppraisal").click(function (e) {
	 e.stopPropagation();
    $("#dashform").submit();
 });
	

 $('#myappraisalForm').validate({ // initialize the plugin
// Specify validation rules
rules: {
  // The key name on the left side is the name attribute
  // of an input field. Validation rules are defined
  // on the right side
category: "required",
objective: {
	required: true,
	lettersonly: true
},
/*remark: "required",*/
remark: {
	required: true,
    minlength: 5,
    lettersonly: true
},
weightage:{
	required : true,
	digits: true
},
training: "required",
achievement: "required",
mgrasses: "required",
mgrcomment: "required",
performancerating: "required",
finalasses: "required"
  },
// Specify validation error messages
messages: {
category: {
	required:"Enter your category",
	lettersonly: true
},
objective:{
	required: "Enter your objective",
	lettersonly: "Enter alphabets only"
},
remark:{
	required: "Enter remark",
	minlength: "please enter atleast 5 characters",
	lettersonly: "enter alphabets only"
},
weightage:{
	required :"Enter weightage",
	digits: "enter numbers only"
},
training: "Enter training needs",
achievement: "Enter self assesment",
mgrasses: "Enter manager assesment",
mgrcomment: "Enter manager comment",
performancerating: "Enter rating",
finalasses: "Enter final assesment",
},
// Make sure the form is submitted to the destination defined
// in the "action" attribute of the form when valid
/*    submitHandler: function(form) {
      form.submit();
    }*/
  });
 
 
 $("#add_obj").off('click').on('click', function(){
 	 var rows = $('.objective-row').length; //1
 	 var rowTemplate = $('#objectiveRowTemplate').text();
 	 rowTemplate = rowTemplate.replace('@@Serial_No@@', rows+1);
 	 $('#goalSettingBox').append(rowTemplate);
 });

	 
 });


function validateform(){ 
	var numbers = /^[0-9]+$/;  
	var obj=document.myform.objective.value; 
	var remark=document.myform.remark.value;
	var weightage=document.myform.weightage.value; 
	var training=document.myform.training.value; 
	var achievement=document.myform.achievement.value; 
	var mgrasses=document.myform.mgrasses.value;
	var mgrcomment=document.myform.mgrcomment.value; 
	var performrating=document.myform.performancerating.value; 
	var finalasses=document.myform.finalasses.value;
	if(obj==null || obj=="" || remark==null || remark==""){  
		  alert("fields can't be blank");  
		  return false;  
		  }
	if (!/^[a-zA-Z]*$/g.test(obj) || !/^[a-zA-Z]*$/g.test(remark)) {
        alert("enter alphabets only for objective and remark");
        document.myForm.objective.focus();
        return false;
	}
}

function validateYear()
{
	 var year = document.dashboardForm.cycleyear.value;
     var year = e.options[e.selectedIndex].value;

     if(!year==2017)
     {
         alert("Please select current year");
     }
     else
     	{
     	document.forms["dashboardForm"].submit();
     	}
	}
	


























