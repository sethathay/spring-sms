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
	
	/*var date = new Date();
	var firstDay = new Date(date.getFullYear(), date.getMonth(), 1);
	var lastDay = new Date(date.getFullYear(), date.getMonth() + 1, 0);
	var dayNotation = firstDay.getDay();
	var lastDateNotation = lastDay.getDate();
	var strDateNotation = "";
	for(var i=1; i<=lastDateNotation; i++){
		var strDayNotation = "";
		if(dayNotation == 6){ 
			strDayNotation = "ស";
			dayNotation = 0;
		}
		else {
			strDayNotation = dayNotation % 6 == 0 ? 'ទ' :
							 dayNotation % 6 == 1 ? 'ច' :
							 dayNotation % 6 == 2 ? 'អ':
							 dayNotation % 6 == 3 ? 'ព':
							 dayNotation % 6 == 4 ? 'ព្រ':
							 dayNotation % 6 == 5 ? 'សុ': '';
			dayNotation++;
		}
		strDateNotation += "<th>" + "(" + strDayNotation + ") <br>" + i + "</th>";
	}
	//Header of attendance table
	var attHeader = "<tr>" +
						"<th>" +
							"ឈ្មោះគ្រូបង្រៀន" +
						"</th>" +
						strDateNotation +
					"</tr>";
	$(".tblAttendance thead").html(attHeader);
	*/
});