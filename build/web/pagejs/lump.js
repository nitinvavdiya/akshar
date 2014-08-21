// JavaScript Document
var clientinfo;
var colourinfo;
var chartinfo;
$(document).ready(function(){
    $( "#checkindate" ).datepicker({
        changeMonth: true,
        changeYear: true,
        dateFormat: 'dd-mm-yy'
    });
    $( "#checkoutdate" ).datepicker({
        changeMonth: true,
        changeYear: true,
        dateFormat: 'dd-mm-yy'
    });
    $.ajax({ 
        url:'../GetStockData', 
        type:'GET', 
        dataType: 'json', 
        success: function(info) {
            //alert(JSON.stringify(info));
            clientinfo = info.clientinfo;
            colourinfo=info.colourinfo;
            chartinfo=info.chartinfo;
            $("#client_name").empty();
            $.each(clientinfo, function (key, value) {
                $("#client_name").append($('<option></option>').val(value.client_id).html(value.name));
            // alert($(this).val());
            });
        },
        error: function(e) {
            alert(e.status);
        }
    });
});

count = 0;
countCuts = 0;
function findCuts(i){
    var length = $('#total_length_'+i).val();
    var pieceLength = $('#piece_length_'+i).val();
    if(length>0 && pieceLength>0){
        cuts = Math.floor(length/pieceLength);
        waste = length - (cuts*pieceLength);
        $('#cuts_'+i).val(cuts);
        $('#waste_'+i).val(waste);
    }
}
function restrict(i){
    var vl = document.getElementById('total_length_'+i);
    var vl1 = document.getElementById('piece_length_'+i);
    var check = new RegExp;
    check = /[^0-9 . ]/gi;
    vl.value = vl.value.replace(check,"");
    vl1.value = vl1.value.replace(check,"");
}

function addPiece(){
    count++;
    $('#lumpsHeader').show();
    $('#totalLumpsDiv').show();
    $('#newPiece').append('<div class="container"><table class="col-md-12"><tr><td class="col-md-2"><select class="form-control" id="chart_'+count+'" name="chart_'+count+'"><option>Red</option><option>blue</option><option>White</option></select></td><td class="col-md-2"><select class="form-control" id="color_'+count+'" name="color_'+count+'"><option>Red</option><option>blue</option><option>White</option></select></td><td class="col-md-2"><input type="text" id="total_length_'+count+'" name="total_length_'+count+'" onblur="findCuts('+count+')" onkeyup="restrict('+count+')" class="form-control"/></td><td class="col-md-2"><input type="text" id="piece_length_'+count+'" name="piece_length_'+count+'" onblur="findCuts('+count+')" onkeyup="restrict('+count+')" class="form-control" /></td><td class="col-md-2"><input type="text" id="cuts_'+count+'" name="cuts_'+count+'" class="form-control" disabled/></td><td class="col-md-2"><input type="text" id="waste_'+count+'" name="waste_'+count+'" class="form-control" disabled/></td></tr></table></div>');
    $("#chart_"+count).empty();
    $.each(chartinfo, function (key, value) {
        $("#chart_"+count).append($('<option></option>').val(value.chart_id).html(value.name));
    // alert($(this).val());
    });
      
    $("#color_"+count).empty();
    $.each(colourinfo, function (key, value) {
        $("#color_"+count).append($('<option></option>').val(value.color_id).html(value.name));
    // alert($(this).val());
    });
}

function addCut(){
    countCuts++;
    $('#cutsHeader').show();
    $('#totalCutsDiv').show();
    $('#newCuts').append('<div class="container"><table class="table-responsive col-md-6"><tr><td class="col-md-2"><select name="cuts_chart_'+countCuts+'" id="cuts_chart_'+countCuts+'" class="form-control"></select></td><td class="col-md-2"><select name="cuts_color_'+countCuts+'" id="cuts_color_'+countCuts+'" class="form-control"><option>Color</option></select></td><td class="col-md-2"><input type="text" name="cuts_cuts_'+countCuts+'" id="cuts_cuts_'+countCuts+'" class="form-control"/></td></tr></table></div>');
	
    // alert();
    $("#cuts_chart_"+countCuts).empty();
    $.each(chartinfo, function (key, value) {
        $("#cuts_chart_"+countCuts).append($('<option></option>').val(value.chart_id).html(value.name));
    // alert($(this).val());
    });
      
    $("#cuts_color_"+countCuts).empty();
    $.each(colourinfo, function (key, value) {
        $("#cuts_color_"+countCuts).append($('<option></option>').val(value.color_id).html(value.name));
    // alert($(this).val());
    });
}

function countTotal(){
    totalLength = 0;
    piecesLength=0;
    totalCuts=0;
    totalWaste=0;
    for(i=1; i<=count; i++){
        length = $('#total_length_'+i).val();
        pieceLength = $('#piece_length_'+i).val();
        cuts = $('#cuts_'+i).val();
        waste = $('#waste_'+i).val();
        totalLength = Number(totalLength) + Number(length);
        piecesLength = Number(piecesLength) + Number(pieceLength);
        totalCuts = Number(totalCuts) + Number(cuts);
        totalWaste = Number(totalWaste)+ Number(waste);
    }
    $('#total_length').val(totalLength);
    $('#pieces_length').val(piecesLength);
    $('#total_cuts').val(totalCuts);
    $('#total_waste').val(totalWaste);
}
function cuts_countTotal(){
    cutsTotal=0;
    for(i=1; i<=countCuts; i++){
        cuts = $('#cuts_cuts_'+i).val();
        cutsTotal = Number(cutsTotal) + Number(cuts);
    }
    $('#cuts_total').val(cutsTotal);
}


function generateJson(){
    if(count>0){
        countTotal();
    }
    if(countCuts>0){
        cuts_countTotal();
    }
    var clintinfo="{";
    clintinfo +='"client_name":"'+$('#client_name').val()+'","receipt_no":"'+$('#receipt_no').val()+'","checkindate":"'+$('#checkindate').val()+'","checkoutdate":"'+$('#checkoutdate').val()+'"}';
    //alert(cclintinfo);
    //
    //if(count>0){
    var lumpinfo='{"lumps":[';
    for(var i=1;i<=count;i++){
        if(Number($('#total_length_'+i).val())>0){
            // alert(lumpinfo);
            lumpinfo+='{"chart":"'+$('#chart_'+i).val()+'","color":"'+$('#color_'+i).val()+'","lumplength":"'+$('#total_length_'+i).val()+'","piecelength":"'+$('#piece_length_'+i).val()+'","cuts":"'+$('#cuts_'+i).val()+'","waste":"'+$('#waste_'+i).val()+'"}';
            if(i!=(count)){
                lumpinfo+=','; 
            }
        }
    }
    lumpinfo+=']}';
    // alert(lumpinfo);
    var lumpsummery="{";
    lumpsummery+='"total_length":"'+$('#total_length').val()+'","pieces_length":"'+$('#pieces_length').val()+'","total_cuts":"'+$('#total_cuts').val()+'","total_waste":"'+$('#total_waste').val()+'"}';
    //alert(lumpsummery);
    // }
   
    var cutsinfo='{"cuts":[';
    //var temp=countCuts;
    for(var i=1;i<=countCuts;i++){
        if(Number($('#cuts_cuts_'+i).val())>0){
            //alert("test---"+i);
            cutsinfo+='{"chart":"'+$('#cuts_chart_'+i).val()+'","color":"'+$('#cuts_color_'+i).val()+'","cuts":"'+$('#cuts_cuts_'+i).val()+'"}';
            if(i!=(countCuts)){
                cutsinfo+=','; 
            }
        }
    }
    cutsinfo+=']}';
    // alert(cutsinfo);
    var cutssummmery="{";
    cutssummmery+='"totalcuts":"'+$('#cuts_total').val()+'"}';
    //alert(cutssummmery);
   
    var json='{"lumpinfo":"'+lumpinfo+'","lumpsummery":"'+lumpsummery+'","cutsinfo":"'+cutsinfo+'","cutssummmery":"'+cutssummmery+'"}';
    //alert(json);
    var data = new Object();
    data.clintinfo=clintinfo;
    data.lumpinfo=lumpinfo;
    data.lumpsummery=lumpsummery;
    data.cutsinfo=cutsinfo;
    data.cutssummmery=cutssummmery;
    //alert(JSON.stringify(data))
    /// $('#json').val()=JSON.stringify(data);
    if(validateInput()){
        //ajax call
        // alert('validation true');
        callAjax(JSON.stringify(data));
    }else{
        alert('form data not valid');
    }
}

function validateInput(){
    if($('#receipt_no').val()=="" || $('#receipt_no').val()==undefined ){
        alert('Enter receipt number');
        return false;
    }
    if($('#checkindate').val()=="" || $('#checkindate').val()==undefined ){
        alert('Enter check in date number');
        return false;
    }
    if($('#checkoutdate').val()=="" || $('#checkoutdate').val()==undefined ){
        alert('Enter check in date number');
        return false;
    }
    return true;
}
function callAjax(jsondata){
    //alert('ajax called');
    
    $.ajax({ 
        url:'../add_stock?jsondata='+jsondata, 
        type:'GET', 
        dataType: 'json',
       
        success: function(info) {
            //alert(JSON.stringify(info));
            if(info.status==200){
                $('#status').css({'color':'green','font-size': '25px'});
               // alert('Stock has been added');
                $('#status').html('Stock has been added');
                
                $("#status").fadeOut(3000);
                setTimeout(function (){location.reload(true)},1000);
               // location.reload("/jsp/add_stock.jsp?msg=test").delay(6000);
            }else if(info.status==500){
                  $('#status').css({'color':'red','font-size': '25px'});
                $('#status').html('Stock could not be added');
                $("#status").fadeOut(3000);
                setTimeout(function (){location.reload(true)},1000);
            }else if(info.status==300){
                 $('#status').css({'color':'orange','font-size': '25px'});
                $('#status').html('Their is not data found in request');
                $("#status").fadeOut(3000);
                setTimeout(function (){location.reload(true)},1000);
            }
            
        },
        error: function(e) {
            alert(e.status);
        }
    });
}