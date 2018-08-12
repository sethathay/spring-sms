$(function() {
	
	$(".clsSelSubject").change(function(){
		$("#csId").val($(this).val());
		var csCourseId = $('option:selected', '.clsSelSubject').attr('course_id');
		var csSubjectId = $('option:selected', '.clsSelSubject').attr('subject_id');
		var csSubjectName = $('option:selected', '.clsSelSubject').attr('subject_name');
		var csTeacherId = $('option:selected', '.clsSelSubject').attr('teacher_id');
		var csDayOfWeek = $('option:selected', '.clsSelSubject').attr('dayOfWeek');
		var csStudyTime = $('option:selected', '.clsSelSubject').attr('studyTime');
		var csStartTime = $('option:selected', '.clsSelSubject').attr('startTime');
		var csEndTime = $('option:selected', '.clsSelSubject').attr('endTime');
		$("#csCourseId").val(csCourseId);
		$("#csSubjectId").val(csSubjectId);
		$("#csTeacherId").val(csTeacherId);
		$("#csDayOfWeek").val(csDayOfWeek);
		$("#csStudyTime").val(csStudyTime);
		$("#csStartTime").val(csStartTime);
		$("#csEndTime").val(csEndTime);
		var dayOfWeekText = csDayOfWeek == 1? "ច័ន្ទ":
			csDayOfWeek == 2? "អង្គារ":
			csDayOfWeek == 3? "ពុធ":
			csDayOfWeek == 4? "ព្រហស្បតិ៍":
			csDayOfWeek == 5? "សុក្រ":
			csDayOfWeek == 6? "សៅរ៍": "អាទិត្យ";
		$("#lblDisplay").text("មុខវិជ្ជា: " + csSubjectName + " ថ្ងៃសិក្សា: " + dayOfWeekText);
	});
	$(".selectSubject").change(function(){
		console.log("Hello");
		var subject_id=$('option:selected', '.selectSubject').val();
		var course_id=$('option:selected','.selectSubject').attr('course_id');
		url="http://localhost:8080/liststudentatt?id="+course_id+"&subID="+subject_id;
		window.location = url;
	});
	$("select[name='subjectmonth']").change(function(){
		var month = $(this).val();
		var year = $("select[name='subjectyear']").val();
		var currentHref = $("#cmdSubSearch").attr("href");
		var varHref = currentHref.split("&",2);
		console.info("currentHref",currentHref);
		console.info("varHref",varHref);
		varHref = varHref.join("&");
		console.info("varHref",varHref);
		
		$("#cmdSubSearch").attr("href", varHref + "&month=" + month + "&year="+year);
		console.info("Haha",$("#cmdSubSearch").attr("href"));
	});
	$("select[name='subjectyear']").change(function(){
		var year = $(this).val();
		var month = $("select[name='subjectmonth']").val();
		var currentHref = $("#cmdSubSearch").attr("href");
		var varHref = currentHref.split("&",2);
		varHref = varHref.join("&");
		$("#cmdSubSearch").attr("href", varHref + "&month=" + month + "&year="+year);
	});
});