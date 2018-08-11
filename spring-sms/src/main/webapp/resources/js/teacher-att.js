$(function() {
	
	$(".clsSelTeacher").change(function(){
		$("#csId").val($(this).val());
		var csCourseId = $('option:selected', '.clsSelTeacher').attr('course_id');
		var csSubjectId = $('option:selected', '.clsSelTeacher').attr('subject_id');
		var csSubjectName = $('option:selected', '.clsSelTeacher').attr('subject_name');
		var csTeacherId = $('option:selected', '.clsSelTeacher').attr('teacher_id');
		var csDayOfWeek = $('option:selected', '.clsSelTeacher').attr('dayOfWeek');
		var csStudyTime = $('option:selected', '.clsSelTeacher').attr('studyTime');
		var csStartTime = $('option:selected', '.clsSelTeacher').attr('startTime');
		var csEndTime = $('option:selected', '.clsSelTeacher').attr('endTime');
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
		$("#lblDisplay").text("មុខវិជ្ជា: " + csSubjectName + " ថ្ងៃបង្រៀន: " + dayOfWeekText);
	});
	
	$("select[name='month']").change(function(){
		var month = $(this).val();
		var year = $("select[name='year']").val();
		var currentHref = $("#cmdSearch").attr("href");
		var varHref = currentHref.split("&",1);
		$("#cmdSearch").attr("href", varHref + "&month=" + month + "&year="+year);
	});
	
	$("select[name='year']").change(function(){
		var year = $(this).val();
		var month = $("select[name='month']").val();
		var currentHref = $("#cmdSearch").attr("href");
		var varHref = currentHref.split("&",1);
		$("#cmdSearch").attr("href", varHref + "&month=" + month + "&year="+year);
	});
});