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
            
<script type='text/javascript' src="https://cdn.rawgit.com/abdmob/x2js/master/xml2json.js"></script>    

 <script src="https://cdn.jsdelivr.net/npm/lodash@4.17.21/lodash.min.js"></script> 
<!--- <script src= "https://github.com/lodash/lodash.git"></script> --->

<script src="https://code.jquery.com/jquery-3.6.1.js" integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI=" crossorigin="anonymous"></script> 

<script>



updateElement = document.getElementById('gotback').innerHTML;

theurl = "https://xmldata.qrz.com/xml/1.31/?username=w6ckc&password=6fdpio";

//theurl = "http://api.open-notify.org/astros.json";

allCallSigns = [] ;

    fetch(theurl)
    .then((response) => response.text())
    .then(( r)  =>     {
                let parser = new DOMParser();

                console.log(`This is the value of raw r: ${ r.indexOf('Key')}`) ;
                let xmlobj = parser.parseFromString(r, "text/xml");
                  console.log(`This is the xml object after parse  ${typeof xmlobj}`) ;


               // console.log(xmlobj.firstChild.nodeName);
                keyvalue = (xmlobj.querySelector('Key').textContent);
                console.log(`This is the key that was extracted from the Object: ${typeof r}`);
               console.log( jQuery.isXMLDoc( xmlobj) ) ;
              
           

          
            var x2js = new X2JS();

            data = x2js.xml_str2json( xmlobj);
            //data = x2js.xml2json(xmlobj);

         //   var obj = jQuery.parseJSON(data);
          //  console.log( data);


         console.log(jQuery.isXMLDoc( xmlobj ) )
       // var myJSON = JSON.parse(data);
       // console.log(`This is the JSON string ${myJSON.indexOf("Key")}`);
        // console.log(`This is the XML OBJECT  ${myJSON.includes("Key")}`);
        //  console.log(`This is looking for the key  ${myJSON.includes("Session")}`);
        // console.log(Object.keys(data));
       
        //console.log(Object.keys(data));
       //console.log(typeof xmlobj);

          
      });     


          


                      


    
    


    


    
    


</script>   
</body>
</html>