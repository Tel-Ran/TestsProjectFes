/**
 *    adding page script
 */
$(document).ready(function(){
	$("#inputCategoryField").css("display","none");
	
	$("#addingForm").keyup(function(){
		var $catSelect = $("#catSel").val();
		if($catSelect != "none"){
			$("#inputCategoryField").css("display","none");
			$("#inputCategoryField").val(" ");
		}
		
	 var question_text = document.question_adding_form.questionText.value;	
		if(question_text.length > 3){
			var $catSel = $("#catSel").val();			
			if($catSel.length != 0){// stub  test if category selected				
			var answer = document.question_adding_form.correctAnswer.value;	
			var codeT = document.question_adding_form.codeText.value;
			if(answer.length == 1 || codeT.length != 0){							
				 document.getElementsByName("button_send")[0].disabled = false;
			}else{
				document.getElementsByName("button_send")[0].disabled = true;
			}				
			}else{
				document.getElementsByName("button_send")[0].disabled = true;
			}
		}else{
			 document.getElementsByName("button_send")[0].disabled = true;
		}
	});
	////
	//test_code
	///// AJAX Tast Code Case Request/Response
	$("#test_code").click(function(){							
		var $codeInText = $('#codeText').val();			
		alert($codeInText);
		$.ajax({type: "POST",
			url: "handler-user-code",
			data: "userCode" + $codeInText,					
			success: function(response){
				// we have the response				
				if(response.status == "SUCCESS"){								
					alert(response.result);
													 
				}else if(response.status == "ERROR"){  
					alert("code wrong try again!!!");
				}		
			},
			error: function(e){
				alert('Error: ' + e);			
			}
		}); 
	});
	
	$("#newMetaCategoryCreating").click(function(){
		var $catSelect = $("#mCatSel").val();
		if($catSelect == "none"){
			$("#inputMetaCategoryField").css("display","block");			
		}else{
			$("#inputMetaCategoryField").css("display","none");
			$("#inputMetaCategoryField").val(" ");
		}		
	});
	
	$("#newCategoryCreating").click(function(){
		var $catSelect = $("#catSel").val();
		if($catSelect == "none"){
			$("#inputCategoryField").css("display","block");			
		}else{
			$("#inputCategoryField").css("display","none");
			$("#inputCategoryField").val(" ");
		}		
	});
});