$(document).ready(function() {
                            
    oTable = $('#color_table').dataTable({
        "bJQueryUI": true,
        "sPaginationType": "full_numbers"
    });
} );

function UpadteColor(color_id){
  // alert(color_id);
    $.ajax({ 
        url:'../ColorMgnt?action=4&color_id='+color_id, 
        type:'GET', 
        dataType: 'json', 
        success: function(info) {
            //alert(JSON.stringify(info));
           // alert(info.color_id);
            //alert(info.name);
            $('#color_update').show();
            document.getElementById('color_id').value=info.color_id;
            document.getElementById('update_colorname').value=info.name;
             document.getElementById('update_colorname').focus();
        },
        error: function(e) {
            alert(e.status);
        }
    });
}