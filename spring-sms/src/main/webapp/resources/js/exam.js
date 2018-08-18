$(function() {
	
	$(".examSelSubject").change(function(){
		$("#csId").val($(this).val());
		var csCourseId = $('option:selected', '.examSelSubject').attr('course_id');
		var csSubjectId = $('option:selected', '.examSelSubject').attr('subject_id');
		var csSubjectName = $('option:selected', '.examSelSubject').attr('subject_name');
		var csTeacherId = $('option:selected', '.examSelSubject').attr('teacher_id');
		var csDayOfWeek = $('option:selected', '.examSelSubject').attr('dayOfWeek');
		var csStudyTime = $('option:selected', '.examSelSubject').attr('studyTime');
		var csStartTime = $('option:selected', '.examSelSubject').attr('startTime');
		var csEndTime = $('option:selected', '.examSelSubject').attr('endTime');
		$("#csCourseId").val(csCourseId);
		$("#csSubjectId").val(csSubjectId);
		$("#csTeacherId").val(csTeacherId);
		$("#csDayOfWeek").val(csDayOfWeek);
		$("#csStudyTime").val(csStudyTime);
		$("#csStartTime").val(csStartTime);
		$("#csEndTime").val(csEndTime);
	});
	$("#btnSubmit").click(function(){
		var url = $(".saveexam").val();
		$("#frmSubmit").attr('action',url);
	});
});