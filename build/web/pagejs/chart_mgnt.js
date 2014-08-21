$(document).ready(function() {
                            
    oTable = $('#chart_table').dataTable({
        "bJQueryUI": true,
        "sPaginationType": "full_numbers"
    });
} );

function UpadteChart(chart_id){
    // alert(color_id);
    $.ajax({ 
        url:'../ChartMgnt?action=4&chart_id='+chart_id, 
        type:'GET', 
        dataType: 'json', 
        success: function(info) {
            //alert(JSON.stringify(info));
           // alert(info.color_id);
            //alert(info.name);
            $('#chart_update').show();
            document.getElementById('chart_id').value=info.chart_id;
            document.getElementById('update_chartname').value=info.name;
             document.getElementById('update_chartname').focus();
        },
        error: function(e) {
            alert(e.status);
        }
    });
}