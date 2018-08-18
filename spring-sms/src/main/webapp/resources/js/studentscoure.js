$(function() {
	
	$(".clsScoreSelSubject").change(function(){

		var attPoint=$('option:selected', '.clsScoreSelSubject').attr('attScore');
		var examPoint=$('option:selected', '.clsScoreSelSubject').attr('examScore');
		var cosID=$('option:selected', '.clsScoreSelSubject').attr('course_id');
		$("#attScore").text("/"+attPoint);
		$("#examScore").text("/"+examPoint);
		var examID = $('option:selected', '.clsScoreSelSubject').attr('exam_id');
		$("#examID").val(examID);
		$("#courseID").val(cosID);
		
	});
//	$(".selectSubject").change(function(){
//		console.log("Hello");
//		var subject_id=$('option:selected', '.selectSubject').val();
//		var course_id=$('option:selected','.selectSubject').attr('course_id');
//		url="http://localhost:8080/liststudentatt?id="+course_id+"&subID="+subject_id;
//		window.location = url;
//	});
//	$("select[name='subjectmonth']").change(function(){
//		var month = $(this).val();
//		var year = $("select[name='subjectyear']").val();
//		var currentHref = $("#cmdSubSearch").attr("href");
//		var varHref = currentHref.split("&",2);
//		console.info("currentHref",currentHref);
//		console.info("varHref",varHref);
//		varHref = varHref.join("&");
//		console.info("varHref",varHref);
//		
//		$("#cmdSubSearch").attr("href", varHref + "&month=" + month + "&year="+year);
//		console.info("Haha",$("#cmdSubSearch").attr("href"));
//	});
//	$("select[name='subjectyear']").change(function(){
//		var year = $(this).val();
//		var month = $("select[name='subjectmonth']").val();
//		var currentHref = $("#cmdSubSearch").attr("href");
//		var varHref = currentHref.split("&",2);
//		varHref = varHref.join("&");
//		$("#cmdSubSearch").attr("href", varHref + "&month=" + month + "&year="+year);
//	});
});