/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
var clientinfo
$(document).ready(function(){
    $( "#checkindate" ).datepicker({
        changeMonth: true,
        changeYear: true,
        dateFormat: 'yy-mm-dd'
    });
    $.ajax({ 
        url:'../GetStockData', 
        type:'GET', 
        dataType: 'json', 
        success: function(info) {
            //alert(JSON.stringify(info));
            clientinfo = info.clientinfo;
            $("#clientname").empty();
            $("#clientname").append($('<option></option>').val('0').html('All'));
            $.each(clientinfo, function (key, value) {
                $("#clientname").append($('<option></option>').val(value.client_id).html(value.name));
            // alert($(this).val());
            });
        },
        error: function(e) {
            alert(e.status);
        }
    });
});
jQuery(function(){
$("#receiptno").autocomplete("../jsp/get_receipt_list.jsp");
});

function getFilteredStock(){
    var receiptno='all';
    var clientname='all';
    var checkindate='all';
    //alert();
    if($('#receiptno').val()!=""){
        receiptno=$('#receiptno').val();
    }
    if($('#clientname').val()!=0){
        clientname=$('#clientname').val();
    }
    if($('#checkindate').val()!=""){
        checkindate=$('#checkindate').val();
    }
   // alert(receiptno);
    //alert(clientname);
    //alert(checkindate);
    $("#stock").load('get_stock_data.jsp?receiptno='+receiptno+'&clientname='+clientname+'&checkindate='+checkindate+'');
}
function getAllStock(){
    //$('#clientname').sele=0;
    document.getElementById("clientname").value=0;
     document.getElementById("checkindate").value="All";
      document.getElementById("receiptno").value="All";
    var receiptno='all';
    var clientname='all';
    var checkindate='all';
    $("#stock").load('get_stock_data.jsp?receiptno='+receiptno+'&clientname='+clientname+'&checkindate='+checkindate+'');
}
