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
	            	respContent += "<option value='" + data.id + "' tname='" + data.name + "' phone='" + data.phone + "' email='" + data.email + "'>";
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
				if(iterator % 5 == 1) $(this).attr('name','courseSubjects[' + countRow + '].id');
				if(iterator % 5 == 2) $(this).attr('name','courseSubjects[' + countRow + '].course.id');
				if(iterator % 5 == 3) $(this).attr('name','courseSubjects[' + countRow + '].subject.id');
				if(iterator % 5 == 4) $(this).attr('name','courseSubjects[' + countRow + '].teacher.id');
				iterator++;
			});
			countRow++;
		});
	}
	
	
	$(document).on('click', '.cmdDeleteRowCourseSubject' , function(){
		$(this).closest('tr').remove();
		updateIndexOfCourseSubjects();
	});
	
	$(".btnAddCourseSubject").click(function(){
		//Add subject to list in module list
		var indSubject = $('select[name="selectsubject"]').val();
		var abbr = $('option:selected', 'select[name="selectsubject"]').attr('abbr');
		var subName = $('option:selected', 'select[name="selectsubject"]').attr('subjectName');
		//Add teacher to list in module list
		var indTeacher = $('select[name="selectteacher"]').val();
		var tName = $('option:selected', 'select[name="selectteacher"]').attr('tname');
		var phone = $('option:selected', 'select[name="selectteacher"]').attr('phone');
		var email = $('option:selected', 'select[name="selectteacher"]').attr('email');
		//Check subject id that already exist in the table
		var isExist = false;
		$('.tbCoursesList tbody tr').each(function (i, val) {
			var iterator = 1;
			$(this).find('input[type=hidden]').each( function (n, nval) {
				if(iterator % 5 == 3 && $(this).val() === indSubject) isExist = true;
				iterator++;
			});
		});
		if(!isExist){
			var countRow = $('.tbCoursesList tbody tr').length;
			var row = "<tr>" +
						"<input type='hidden' name='courseSubjects["+ countRow + "].id'>" +
						"<input type='hidden' name='courseSubjects["+ countRow + "].course.id' value='"+ $('.clsCourseId').val() + "'>" +
						"<input type='hidden' name='courseSubjects["+ countRow + "].subject.id' value='"+ indSubject + "'>" +
						"<input type='hidden' name='courseSubjects["+ countRow + "].teacher.id' value='"+ indTeacher + "'>" +
						"<th scope='row'>" +
							( countRow + 1) +
						"</th>" +
						"<td>" +
							abbr +
						"</td>" +
						"<td>" +
							subName +
						"</td>" +
						"<td>" +
							tName +
						"</td>" +
						"<td>" +
							phone +
						"</td>" +
						"<td>" +
							email +
						"</td>" +
						"<td>" +
							"<a href='#' class='cmdDeleteRowCourseSubject'><i class='fa fa-trash-o' style='color:red'></i></a>" +
						"</td>" +
					  "</tr>";
			$('.tbCoursesList tbody').append(row);
		}
	});
	
});