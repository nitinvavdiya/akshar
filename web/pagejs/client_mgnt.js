$(document).ready(function() {
                            
    oTable = $('#chart_table').dataTable({
        "bJQueryUI": true,
        "sPaginationType": "full_numbers"
    });
} );

function updateClient(client_id){
  // alert(client_id);
    $.ajax({ 
        url:'../ClientMgnt?action=4&client_id='+client_id, 
        type:'GET', 
        dataType: 'json', 
        success: function(info) {
            //alert(JSON.stringify(info));
            // alert(info.color_id);
            //alert(info.name);
            $('#client_update').show();
            //alert(client_id);
            document.getElementById('client_id').value=info.client_id;
           // alert(document.getElementById('client_id').value);
            document.getElementById('update_name').value=info.name;
            document.getElementById('update_mobile').value=info.mobile;
            document.getElementById('update_address').value=info.address;
            document.getElementById('update_name').focus();
        },
        error: function(e) {
            alert(e.status);
        }
    });
}
function isNumberKey(evt)
{
    var charCode = (evt.which) ? evt.which : event.keyCode
    if (charCode > 31 && (charCode < 48 || charCode > 57))
        return false;

    return true;
}
function validateInput(no){
   // alert(no);
    if(no.length==10){
        return true;
    }else{
        //document.getElementById("mobile").focus();
        alert("Enter valid Mobile No.")
       
        return false;
    }
}



(function($,W,D)
{
    
    var JQUERY4U = {};
    var max=10;
    JQUERY4U.UTIL =
    {
        setupFormValidation: function()
        {
            //form validation rules
            $("#create_new_donor_form").validate({
                rules: {
                    name: "required",
                    lastname: "required",
                    address: "required",
                    mobile:{
                        required:true,
                        maxlength:10,
                        minlength:10,
                        number:true
                    }
                },
                messages: {
                    name:"Enter Client Name",
                    email: "Please enter a valid email address",
                    mobile:"enter valid mobile number",
                    address:"enter Address"
					
                },
                submitHandler: function(form) {
                    form.submit();
                }
            });
        }
    }

    //when the dom has loaded setup form validation rules
    $(D).ready(function($) {
        JQUERY4U.UTIL.setupFormValidation();
    });

})(jQuery, window, document);