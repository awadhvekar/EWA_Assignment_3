$.ajax({
    url: "TotalProductSalesAPI",
    type: "POST",
    data: "{}",
    contentType: "application/json; charset=utf-8",
    dataType: "json",
    success: function (msg) {
        alert(msg);
        //formatJsonAccordingToGoogleChart(msg)            
    },
    error: function(){
        console.log("error occurred while making ajax call;")
    }
});