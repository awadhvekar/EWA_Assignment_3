google.charts.load('current', {packages: ['corechart', 'bar']});
$.ajax({
    url: "AvailableProductsAPI",
    type: "POST",
    data: "{}",
    contentType: "application/json; charset=utf-8",
    dataType: "json",
    success: function (msg) {
        formatJsonAccordingToGoogleChart(msg)            
    },
    error: function(){
        console.log("error occurred while making ajax call;")
    }
});


//This method will parse json data and build datatable required by google api to plot the bar chart.
function formatJsonAccordingToGoogleChart(jsonData)
{
    //var parsedData = $.parseJSON(jsonData);
    
    var parsedData = JSON.stringify(jsonData);
    //alert(parsedData);
    var data = new Array();
    var productNameArr = new Array();
    var productQuantityArr = new Array();

    var innerJsonArray = new Array();
    innerJsonArray.push("Product Name");
    innerJsonArray.push("Number of available products");
    innerJsonArrayParsed = JSON.stringify(innerJsonArray);
    innerJsonArray = "['Product Name', 'Number of available products']";
    var outerJsonArray = new Array();
    outerJsonArray.push(innerJsonArrayParsed);

    var productName = parsedData[1]["productName"];
    alert(typeof(productName));

    for(var i = 0; i < parsedData.length; i++)
    {
        var innerForJsonArray = new Array();
        var productName = parsedData[i]["productName"];
        var productQuantity = parseInt(parsedData[i]["numberOfAvailableProducts"]);

        innerForJsonArray.push(productName);
        innerForJsonArray.push(productQuantity);

        var parsedArray = JSON.stringify(innerForJsonArray);
        outerJsonArray.push(parsedArray);

    }
    //alert(outerJsonArray);

/*
    //Create an array of product name and an array of zipcodes
    for(var i=0; i<parsedData.length; i++)
    {
        var innerForJsonArray = new Array();
        var productName = parsedData[i]["productName"];
        var productQuantity = parseInt(parsedData[i]["numberOfAvailableProducts"]);
        //alert(productQuantity);

        //innerJsonArray = "['"+productName+"', "+ parseInt(productQuantity) +"]";
        innerForJsonArray.push(productName);
        innerForJsonArray.push(productQuantity);

        var parsedArray = JSON.stringify(innerForJsonArray);

        outerJsonArray.push(parsedArray);
        //alert(outerJsonArray);
        
        
    }
*/
    
    //alert(outerJsonArray);

    /*
    //Create header array for google api
    var headingArray = new Array(productNameArr.length+1);
    headingArray[0] = "Product Names";
    var j=0;

    for(var i=1; i<=productNameArr.length; i++)
    {
        headingArray[i] = productNameArr[j]; 
        j++;
    }

    data[0] = headingArray;
    var m =1;
    
     //Loop through jsondata and create an array of arrays to plot the chart;
    for(var i=0; i<productQuantityArr.length; i++)
    {
        var dataArr = new Array(headingArray.length);
        dataArr[0] = productQuantityArr[i];
        for(var j=0; j<productNameArr.length; j++)
        {
            for(k=0; k<parsedData.length; k++)
            {
                if(parsedData[k]["retailerpin"] === productQuantityArr[i] && parsedData[k]["productName"] === productNameArr[j])
                {                    
                    dataArr[j+1] = parseInt(parsedData[k]["reviewRating"]);                   
                }                 
            }
        }
        
        //Set empty cell elements to zero;
        for(var n=1; n<headingArray.length; n++)
        {
            if(!(dataArr[n] > 0))
            {
                dataArr[n] = 0;
            }
        }
        data[m] = (dataArr);
        m++;
        
    }
    */
    drawChart(outerJsonArray);
}

//Plot the chart using 2d array and product names as subtitles;
function drawChart(data) {
    //alert(data);
    var newData = new Array();
    //newData = "["+data+"]";
    newData.push(data);
    //var newData = new Array();
    //newData.push(data);
    //var newDataParsed = JSON.stringify(newData);
    //var newDataParsed = JSON.parse(newData);
    alert(Array.isArray(newData));
    //newData = JSON.parse(newData);
    alert(newData);
    //Invoke google's built in method to get data table object required by google.
    var chartData = google.visualization.arrayToDataTable(newData);
    //alert(chartData);

    /*
    [
            ["Product Name", "Number of available products"],
            ["Basic Plan",9],
            ["LG FitnessWatch",10],
            ["LG Headphone",10],
            ["LG Laptop",10],
            ["LG Phone",10],
            ["LG SmartWatch",10],
            ["LG SoundSystem",10],
            ["LG Television",10],
            ["LG VoiceAssistant",10],
            ["Microsoft FitnessWatch",10],
            ["Microsoft Headphone",10],
            ["Microsoft Laptop",10],
            ["Microsoft Phone",10],
            ["Microsoft SmartWatch",10],
            ["Microsoft SoundSystem",10],
            ["Microsoft Television",9],
            ["Microsoft VoiceAssistant",10],
            ["Onida FitnessWatch",10],
            ["Onida Headphone",10],
            ["Onida Laptop",10],
            ["Onida Phone",10],
            ["Onida SmartWatch",10],
            ["Onida SoundSystem",10],
            ["Onida Television",10],
            ["Onida VoiceAssistant",10],
            ["Premium Plan",10],
            ["Samsung FitnessWatch",10],
            ["Samsung Headphone ",10],
            ["Samsung Laptop",10],
            ["Samsung Phone",10],
            ["Samsung SmartWatch",10],
            ["Samsung SoundSystem",10],
            ["Samsung Television",10],
            ["Samsung VoiceAssistant",10],
            ["Sony FitnessWatch",10],
            ["Sony Headphone",10],
            ["Sony Laptop",10],
            ["Sony Phone",10],
            ["Sony SmartWatch",10],
            ["Sony SoundSystem",10],
            ["Sony Television",10],
            ["Sony VoiceAssistant",10],
            ["Ultimate Plan",10]
        ]
    */

     var options = {
        'width':600,
        'height':650,
          chart: {
            title: 'Count of available products',
            //subtitle: productNames,
          },
          bars: 'horizontal' // Required for Material Bar Charts.
        };

    var chart = new google.visualization.BarChart(document.getElementById('chartDivNumberOfAvailableProducts'));
    chart.draw(chartData, options);
}





/*
google.charts.load('current', {packages: ['corechart', 'bar']});
//google.charts.load('current', {'packages':['bar']});
//google.charts.setOnLoadCallback(drawChart);

$.ajax({
    url: "AvailableProductsAPI",
    type: "POST",
    data: "{}",
    success: function (msg)
    {
        //alert(msg);
        formatJsonAccordingToGoogleChart(msg)            
    },
    error: function()
    {
        console.log("error occurred while making ajax call;")
    }
});

function formatJsonAccordingToGoogleChart(jsonData)
{
    var parsedData = $.parseJSON(jsonData);
    var data = new Array();
    var productNameArr = new Array();
    var productQuantityArr = new Array();

    //Create an array of product name and an array of productQuantity
    for(var i=0; i<parsedData.length; i++)
    {
        var productName = parsedData[i]["productName"];
        var productQuantity = parsedData[i]["numberOfAvailableProducts"];
        
        if(!productNameArr.includes(productName))
        {
            productNameArr.push(productName);
        }
        if(!productQuantityArr.includes(productQuantity))
        {
            productQuantityArr.push(parseInt(productQuantity));
        }
    }

    //Create header array for google api
    var headingProductNameArr = new Array(productNameArr.length+1);
    var headingProductQuantityArr = new Array(productQuantityArr.length+1);

    headingProductNameArr[0] = "Product Names";
    headingProductQuantityArr[0] = "Number of available products";

    var j=0;
    for(var i=1; i<=productNameArr.length; i++)
    {
        headingProductNameArr[i] = productNameArr[j];
        headingProductQuantityArr[i] = productQuantityArr[j];
        j++;
    }

    data[0] = headingProductNameArr;
    data[1] = headingProductQuantityArr;

    //alert(data);

    drawChart(data, productNameArr);
}

//Plot the chart using 2d array and product names as subtitles;
function drawChart(data, productNameArr) {
    var productNames = "";
    for(var i=0; i<productNameArr.length; i++) {
        productNames += productNameArr[i] + ",";
    }


    //Invoke google's built in method to get data table object required by google.
     var chartData = google.visualization.arrayToDataTable(data);

     var options = {
        'width':600,
        'height':650,
          chart: {
            title: 'Trending Products Chart',
            subtitle: productNames,
          },
          bars: 'horizontal' // Required for Material Bar Charts.
        };

    var chart = new google.visualization.BarChart(document.getElementById('chartDivNumberOfAvailableProducts'));
    chart.draw(chartData, options);
}
*/
/*
function drawChart()
{
    var data = google.visualization.arrayToDataTable([
        ['Product Name', 'Number of available products'],
        ['2014', 10],
        ['2015', 12],
        ['2016', 7],
        ['2017', 15]
    ]);

    var options = {
        chart: {
            title: 'Number of available products',
            //subtitle: 'Sales, Expenses, and Profit: 2014-2017',
        },
        bars: 'horizontal' // Required for Material Bar Charts.
    };

    var chart = new google.charts.Bar(document.getElementById('chartDivNumberOfAvailableProducts'));

    chart.draw(data, google.charts.Bar.convertOptions(options));
}
*/