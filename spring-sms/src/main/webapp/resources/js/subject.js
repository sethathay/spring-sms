$(function() {
	function updateIndexOfTechers(){
		var countRow = 0;
		$('.tbTechersList tbody tr').each(function (i, val) {
			$(this).find('th').text(countRow + 1);
			$(this).find('input[type=hidden]').each( function (n, nval) {
				$(this).attr('name','teachers[' + countRow + '].id');
			});
			countRow++;
		});
	}
	
	$(document).on('click', '.cmdDeleteRowTeacher' , function(){
		$(this).closest('tr').remove();
		updateIndexOfTechers();
	});
	
	$(".btnAddTeacher").click(function(){
		//Add teacher to list in module subject
		var ind = $('select[name="selectteacher"]').val();
		var text = $('option:selected', 'select[name="selectteacher"]').attr('text');
		var gender = $('option:selected', 'select[name="selectteacher"]').attr('gender');
		var phone = $('option:selected', 'select[name="selectteacher"]').attr('phone');
		var email = $('option:selected', 'select[name="selectteacher"]').attr('email');
		//Check teacher id that already exist in the table
		var isExist = false;
		$('.tbTechersList tbody tr').each(function (i, val) {
			$(this).find('input[type=hidden]').each( function (n, nval) {
				if($(this).val() === ind) isExist = true;
			});
		});
		if(!isExist){
			var countRow = $('.tbTechersList tbody tr').length;
			var row = "<tr>" +
						"<input type='hidden' name='teachers["+ countRow + "].id' value='"+ ind + "'>" +
						"<th scope='row'>" +
							( countRow + 1) +
						"</th>" +
						"<td>" +
							text +
						"</td>" +
						"<td>" +
							gender +
						"</td>" +
						"<td>" +
							phone +
						"</td>" +
						"<td>" +
							email +
						"</td>" +
						"<td>" +
							"<a href='#' class='cmdDeleteRowTeacher'><i class='fa fa-trash-o' style='color:red'></i></a>" +
						"</td>" +
					  "</tr>";
			$('.tbTechersList tbody').append(row);
		}
	});
	
});