$(function() {
	
	var localhost = "http://localhost:8080";
	
	$("select[name='selectsubject']").change(function(){
		var subjectId = $(this).val();
		$.ajax({
	        url: localhost + "/api/subject/teacher?id=" + subjectId,
	        type: "GET",
	        beforeSend: function(xhr) {
	            xhr.setRequestHeader("Accept", "application/json");
	            xhr.setRequestHeader("Content-Type", "application/json");
	        },
	        success: function(dataResponse) {
	            var respContent = "";
	            $.each(dataResponse, function(ind, data){
	            	respContent += "<option value='" + data.id + "' tname='" + data.name + "'>";
		            respContent += data.name;
		            respContent += "</option>";
	            }); 
	             
	            $("select[name='selectteacher']").html(respContent);         
	        }
	    });
	});
	
	function updateIndexOfCourseSubjects(){
		var countRow = 0;
		$('.tbCoursesList tbody tr').each(function (i, val) {
			$(this).find('th').text(countRow + 1);
			var iterator = 1;
			$(this).find('input[type=hidden]').each( function (n, nval) {
				if(iterator % 9 == 1) $(this).attr('name','courseSubjects[' + countRow + '].id');
				if(iterator % 9 == 2) $(this).attr('name','courseSubjects[' + countRow + '].course.id');
				if(iterator % 9 == 3) $(this).attr('name','courseSubjects[' + countRow + '].subject.id');
				if(iterator % 9 == 4) $(this).attr('name','courseSubjects[' + countRow + '].teacher.id');
				if(iterator % 9 == 5) $(this).attr('name','courseSubjects[' + countRow + '].dayOfWeek');
				if(iterator % 9 == 6) $(this).attr('name','courseSubjects[' + countRow + '].studyTime');
				if(iterator % 9 == 7) $(this).attr('name','courseSubjects[' + countRow + '].startTime');
				if(iterator % 9 == 8) $(this).attr('name','courseSubjects[' + countRow + '].endTime');
				iterator++;
			});
			countRow++;
		});
	}
	
	
	$(document).on('click', '.cmdDeleteRowCourseSubject' , function(){
		$(this).closest('tr').remove();
		updateIndexOfCourseSubjects();
	});
	
	$(document).on('click', '.cmdEditRowCourseSubject' , function(){
		var iterator = 1;
		clearRowSelection();
		$(this).closest('tr').addClass('active-row');
		$(this).closest('tr').find('input[type=hidden]').each(function (n, nval) {
			var value = $(this).val();
			if(iterator % 9 == 1) $('.clsEditId').val(value);
			if(iterator % 9 == 3) {
				$('select[name="selectsubject"]').val(value);
				$('select[name="selectsubject"]').trigger('change');
			}			
			if(iterator % 9 == 4) {
				setTimeout(function(){
					$('select[name="selectteacher"]').val(value);
				}, 500);
			}
			if(iterator % 9 == 5) $('select[name="dayofweek"]').val(value);
			if(iterator % 9 == 6) $('input[name="studytime"]').val(value);
			if(iterator % 9 == 7) $('input[name="starttime"]').val(value);
			if(iterator % 9 == 8) $('input[name="endtime"]').val(value);
			iterator++;
		});
	});
	
	function clearRowSelection(){
		$('.tbCoursesList tbody tr').each(function(n,val){
			$(this).removeClass('active-row');
		});
	}
	
	function clearScheduleData(){
		$('input[name="studytime"]').val("");
		$('input[name="starttime"]').val("");
		$('input[name="endtime"]').val("");
		$('.clsEditId').val("");
	}
	
	function getTimeDisplay(studyTime){
		return studyTime + "H";
	}
	
	function getDayofWeekDisplay(dayOfWeek){
		return 	dayOfWeek == 1 ? 'ច័ន្ទ' :
      	 		dayOfWeek == 2 ? 'អង្គារ':
		      	dayOfWeek == 3 ? 'ពុធ':
		      	dayOfWeek == 4 ? 'ព្រហស្បតិ៍':
		      	dayOfWeek == 5 ? 'សុក្រ':
		      	dayOfWeek == 6 ? 'សៅរ៍':'អាទិត្យ';
	}
	
	function getRowData(abbr, subName, tName, dayOfWeekDisplay, timeDisplay, startTime, endTime){
		return "<td>" +
					abbr +
				"</td>" +
				"<td>" +
					subName +
				"</td>" +
				"<td>" +
					tName +
				"</td>" +
				"<td>" +
					dayOfWeekDisplay +
				"</td>" +
				"<td>" +
					timeDisplay +
				"</td>" +
				"<td>" +
					startTime +
				"</td>" +
				"<td>" +
					endTime +
				"</td>" +
				"<td>" +
					"<a href='#' class='cmdEditRowCourseSubject'><i class='fa fa-pencil' style='color:green'></i></a>" +
				"</td>" +
				"<td>" +
					"<a href='#' class='cmdDeleteRowCourseSubject'><i class='fa fa-trash-o' style='color:red'></i></a>" +
				"</td>";
	}
	
	$(".btnAddCourseSubject").click(function(){
		//Add subject to list in module list
		var indSubject = $('select[name="selectsubject"]').val();
		var abbr = $('option:selected', 'select[name="selectsubject"]').attr('abbr');
		var subName = $('option:selected', 'select[name="selectsubject"]').attr('subjectName');
		//Add teacher to list in module list
		var indTeacher = $('select[name="selectteacher"]').val();
		var tName = $('option:selected', 'select[name="selectteacher"]').attr('tname');
		var dayOfWeek = $('select[name="dayofweek"]').val();
		var studyTime = $('input[name="studytime"]').val();
		var startTime = $('input[name="starttime"]').val();
		var endTime = $('input[name="endtime"]').val();
		//Check subject id that already exist in the table
		var isExist = false;
		var ind;
		$('.tbCoursesList tbody tr').each(function (i, val) {
			var iterator = 1;
			$(this).find('input[type=hidden]').each( function (n, nval) {
				//console.log($(this).val());
				if((iterator % 9 == 3 && $(this).val() === indSubject) ||
				   ($('.clsEditId').val() != "" && iterator % 9 == 1 && $(this).val() === $('.clsEditId').val())){
					isExist = true;
					ind = i;
				}
				iterator++;
			});
		});
		//Add new schedule to list
		if(!isExist){
			var countRow = $('.tbCoursesList tbody tr').length;
			var timeDisplay = getTimeDisplay(studyTime);
			var dayOfWeekDisplay = getDayofWeekDisplay(dayOfWeek);
			var row = "<tr>" +
						"<input type='hidden' name='courseSubjects["+ countRow + "].id'>" +
						"<input type='hidden' name='courseSubjects["+ countRow + "].course.id' value='"+ $('.clsCourseId').val() + "'>" +
						"<input type='hidden' name='courseSubjects["+ countRow + "].subject.id' value='"+ indSubject + "'>" +
						"<input type='hidden' name='courseSubjects["+ countRow + "].teacher.id' value='"+ indTeacher + "'>" +
						"<input type='hidden' name='courseSubjects["+ countRow + "].dayOfWeek' value='"+ dayOfWeek + "'>" +
						"<input type='hidden' name='courseSubjects["+ countRow + "].studyTime' value='"+ studyTime + "'>" +
						"<input type='hidden' name='courseSubjects["+ countRow + "].startTime' value='"+ startTime + "'>" +
						"<input type='hidden' name='courseSubjects["+ countRow + "].endTime' value='"+ endTime + "'>" +
						"<th scope='row'>" +
							( countRow + 1) +
						"</th>" +
						getRowData(abbr, subName, tName, dayOfWeekDisplay, timeDisplay, startTime, endTime) +
					  "</tr>";
			$('.tbCoursesList tbody').append(row);
			clearScheduleData();
		}
		//Update edited schedule to list
		else{
			var timeDisplay = getTimeDisplay(studyTime);
			var dayOfWeekDisplay = getDayofWeekDisplay(dayOfWeek);
			var row = "<tr>" +
						"<input type='hidden' name='courseSubjects["+ ind + "].id' value='"+ $('.clsEditId').val() + "'>" +
						"<input type='hidden' name='courseSubjects["+ ind + "].course.id' value='"+ $('.clsCourseId').val() + "'>" +
						"<input type='hidden' name='courseSubjects["+ ind + "].subject.id' value='"+ indSubject + "'>" +
						"<input type='hidden' name='courseSubjects["+ ind + "].teacher.id' value='"+ indTeacher + "'>" +
						"<input type='hidden' name='courseSubjects["+ ind + "].dayOfWeek' value='"+ dayOfWeek + "'>" +
						"<input type='hidden' name='courseSubjects["+ ind + "].studyTime' value='"+ studyTime + "'>" +
						"<input type='hidden' name='courseSubjects["+ ind + "].startTime' value='"+ startTime + "'>" +
						"<input type='hidden' name='courseSubjects["+ ind + "].endTime' value='"+ endTime + "'>" +
						"<th scope='row'>" +
							( ind + 1) +
						"</th>" +
						getRowData(abbr, subName, tName, dayOfWeekDisplay, timeDisplay, startTime, endTime) +
					  "</tr>";
			$('.tbCoursesList tbody tr').eq(ind).replaceWith(row);
			clearScheduleData();
			clearRowSelection();
		}
	});
	
});