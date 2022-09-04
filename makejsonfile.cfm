<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

    
</head>
<body>

<p id="gotback">
This is the paragraph
</p>
    <cfoutput>

    <cfquery name="wmembers" datasource="wclubdb">

    select * from wmaster
     order by callsign
            
        </cfquery>

    <cfset wjson = SerializeJSON(wmembers, "struct")>
    <!---    <cfdump var="#wmembers#" > --->

        #isJSON(wjson)#

<cfset Form.UpdateTitle = "Jess Craig Title">
<cfset Form.Content = "Jess Craig content">

Form.Content
        <cffile action = "write" 
file = "D:\ColdFusion2021\cfusion\wwwroot\rollcall\jsonfiles\wmembers.json"
output = "#wjson#">
    </cfoutput>
            
        
<script>

updateElement = document.getElementById('gotback').innerHTML;

theurl = "http://api.open-notify.org/astros.json";

allCallSigns = [] ;

    fetch(theurl)
    .then(response =>      response.json())
    .then(thisdata  =>    {  allCallSigns = thisdata;
                        //console.log(json);
                       // console.log(allCallSigns)
                        document.getElementById('gotback').innerHTML = allCallSigns.people[2].name;
console.log(`This is the info from the fetch ${allCallSigns.people[1].craft}`);
                        });

                      
    
    


    
  

    
    


</script>   
</body>
</html>