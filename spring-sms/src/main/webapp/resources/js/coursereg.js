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
		var stuID=$("#id").val();
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
						"<input type='hidden' name='studentCourses["+ countRow + "].id'>" +
						"<input type='hidden' name='studentCourses["+ countRow + "].course.id' value='"+ ind + "'>" +
						"<input type='hidden' name='studentCourses["+ countRow + "].student.id' value='"+ stuID + "'>" +
						"<input type='hidden' name='studentCourses["+ countRow + "].regDate' value='"+ new Date().toISOString().slice(0,10) + "'>" +
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
	
	$(".selectStu").change(function(){
		var id = $('.selectStu').val();
		var name = $('option:selected', '.selectStu').attr('name');
		var gender = $('option:selected', '.selectStu').attr('gender');
		var dob = $('option:selected', '.selectStu').attr('dob');
		var pob = $('option:selected', '.selectStu').attr('pob');
		var address = $('option:selected', '.selectStu').attr('address');
		var fstatus = $('option:selected', '.selectStu').attr('fstatus');
		var phone = $('option:selected', '.selectStu').attr('phone');
		var email = $('option:selected', '.selectStu').attr('email');
		var caddress = $('option:selected', '.selectStu').attr('caddress');
		
		console.info("Name",name+","+gender+","+dob+",pob"+pob+",address"+address+","+fstatus+","+phone+","+email+",caddress"+caddress);
		$("#id")[0].value=id;
		$("#name")[0].value=name;
		$("#gender")[0].value=gender;
		$("#dob")[0].value=dob;
		$("#pob")[0].value=pob;
		$("#address")[0].value=address;
		$("#caddress")[0].value=caddress;
		$("#fstatus")[0].value=fstatus;
		$("#phone")[0].value=phone;
		$("#email")[0].value=email;
	});
});