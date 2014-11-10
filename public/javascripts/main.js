/*
Ref:
https://github.com/mahonnaise/cyclotron
*/

$(document).ready(function($) {
    /*
     * bootstrap-switch init
     */
    $("#week-switcher").bootstrapSwitch({
        size: "large",
        state: 'false',
        onColor: "warning",
        offColor: "success",
        onText: "Week #1",
        offText: "Week #2"
    });
    /*
     * rainyday init
     */
    var engine = new RainyDay({
        image: document.getElementById('background')
    });
    engine.rain([ [1, 2, 8000] ]);
    engine.rain([ [3, 3, 0.88], [5, 5, 0.9], [6, 2, 1] ], 100);
    /*
     * change tabs
     */
    $(".bootstrap-switch").click(function(){
        if ($("#week-switcher")[0].checked) {
            $("#tab1").click()
        }else{
            $("#tab2").click()
        };
    })
});
