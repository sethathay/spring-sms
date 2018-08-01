$(function() {
	function updateIndexOfCourses(){
		var countRow = 0;
		$('.tblCoursesList tbody tr').each(function (i, val) {
			$(this).find('th').text(countRow + 1);
			$(this).find('input[type=hidden]').each( function (n, nval) {
				$(this).attr('name','courses[' + countRow + '].id');
			});
			countRow++;
		});
	}
	
	$(document).on('click', '.cmdDeleteRowCourse' , function(){
		$(this).closest('tr').remove();
		updateIndexOfCourses();
	});
	
	$(".btnAddCourse").click(function(){
		//Add course to list
		var ind = $('select[name="selectcourse"]').val();
		var name = $('option:selected', 'select[name="selectcourse"]').attr('name');
		var duration = $('option:selected', 'select[name="selectcourse"]').attr('duration');
		var startDate = $('option:selected', 'select[name="selectcourse"]').attr('startDate');
		var endDate = $('option:selected', 'select[name="selectcourse"]').attr('endDate');
		//Check course id that already exist in the table
		var isExist = false;
		$('.tblCoursesList tbody tr').each(function (i, val) {
			$(this).find('input[type=hidden]').each( function (n, nval) {
				if($(this).val() === ind) isExist = true;
			});
		});
		if(!isExist){
			var countRow = $('.tblCoursesList tbody tr').length;
			var row = "<tr>" +
						"<input type='hidden' name='courses["+ countRow + "].id' value='"+ ind + "'>" +
						"<th scope='row'>" +
							( countRow + 1) +
						"</th>" +
						"<td>" +
							name +
						"</td>" +
						"<td>" +
							duration +
						"</td>" +
						"<td>" +
							startDate +
						"</td>" +
						"<td>" +
							endDate +
						"</td>" +
						"<td>" +
							"<a href='#' class='cmdDeleteRowCourse'><i class='fa fa-trash-o' style='color:red'></i></a>" +
						"</td>" +
					  "</tr>";
			$('.tblCoursesList tbody').append(row);
		}
	});
	
});