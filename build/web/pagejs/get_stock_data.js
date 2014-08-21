/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
// When document is ready: this gets fired before body onload <img src='http://blogs.digitss.com/wp-includes/images/smilies/icon_smile.gif' alt=':)' class='wp-smiley' /> 
$(document).ready(function(){
    // Write on keyup event of keyword input element
    $("#semp").keyup(function(){
        // When value of the input is not blank
        if( $(this).val() != "")
        {
            // Show only matching TR, hide rest of them
            $("#aaa tbody>tr").hide();
            $("#aaa td:contains-ci('" + $(this).val() + "')").parent("tr").show();
        }
        else
        {
            // When there is no input or clean again, show everything back
            $("#aaa tbody>tr").show();
        }
    });
});
// jQuery expression for case-insensitive filter
$.extend($.expr[":"], 
{
    "contains-ci": function(elem, i, match, array) 
    {
        return (elem.textContent || elem.innerText || $(elem).text() || "").toLowerCase().indexOf((match[3] || "").toLowerCase()) >= 0;
    }
});
    

