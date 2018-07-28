$(function() {
	
	$(".btnAddTeacher").click(function(){
		//Add teacher to list in module subject
		var ind = $('select[name="selectteacher"]').val();
		var text = $('option:selected', 'select[name="selectteacher"]').attr('text');
		var gender = $('option:selected', 'select[name="selectteacher"]').attr('gender');
		var phone = $('option:selected', 'select[name="selectteacher"]').attr('phone');
		var email = $('option:selected', 'select[name="selectteacher"]').attr('email');
		var countRow = $('.tbTechersList tbody tr').length;
		var row = "<tr>" +
					"<th scope='row'>" +
						"<input type='hidden' name='teachers["+ countRow + "].id' value='"+ ind + "'>" + ( countRow + 1) +
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
						"<a href='#' class='cmdDeleteRowTeacher' onclick='$(this).closest(\"tr\").remove();'><i class='fa fa-trash-o' style='color:red'></i></a>" +
					"</td>" +
				  "</tr>";
		$('.tbTechersList tbody').append(row);
	});
	
});