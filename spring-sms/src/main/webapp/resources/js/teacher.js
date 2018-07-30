$(function() {
	function updateIndexOfSubjects(){
		var countRow = 0;
		$('.tblSubjectList tbody tr').each(function (i, val) {
			$(this).find('th').text(countRow + 1);
			$(this).find('input[type=hidden]').each( function (n, nval) {
				$(this).attr('name','subjects[' + countRow + '].id');
			});
			countRow++;
		});
	}
	
	$(document).on('click', '.cmdDeleteRowSubject' , function(){
		$(this).closest('tr').remove();
		updateIndexOfSubjects();
	});
	
	$(".btnAddSubject").click(function(){
		//Add teacher to list in module subject
		var ind = $('select[name="selectsubject"]').val();
		var abbr = $('option:selected', 'select[name="selectsubject"]').attr('abbr');
		var name = $('option:selected', 'select[name="selectsubject"]').attr('name');
		var description = $('option:selected', 'select[name="selectsubject"]').attr('description');
		//Check teacher id that already exist in the table
		var isExist = false;
		$('.tblSubjectList tbody tr').each(function (i, val) {
			$(this).find('input[type=hidden]').each( function (n, nval) {
				if($(this).val() === ind) isExist = true;
			});
		});
		if(!isExist){
			var countRow = $('.tblSubjectList tbody tr').length;
			var row = "<tr>" +
						"<input type='hidden' name='subjects["+ countRow + "].id' value='"+ ind + "'>" +
						"<th scope='row'>" +
							( countRow + 1) +
						"</th>" +
						"<td>" +
							abbr +
						"</td>" +
						"<td>" +
							name +
						"</td>" +
						"<td>" +
							description +
						"</td>" +
						"<td>" +
							"<a href='#' class='cmdDeleteRowSubject'><i class='fa fa-trash-o' style='color:red'></i></a>" +
						"</td>" +
					  "</tr>";
			$('.tblSubjectList tbody').append(row);
		}
	});
	
});