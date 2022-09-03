<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Stat Cap Demo</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.css">
    <link rel="stylesheet" href="css/testonly.css"

 <!--- <cfquery  name="hams" datasource="wclubdb">
    select callsign  from wmaster
  </cfquery>  

<!---  <cfdump var=#hams# > --->

  <cfoutput >
  <cfset jdata = serializeJSON(hams)>   
   
  
<cfd --->ump var="#jdata#"  metainfo="no"  output="browser" showudfs="yes" hide="all">



<cfquery name="hams" datasource="wclubdb">

SELECT upper(SUBSTRING(callsign,1,1)) as callfirst,
 callsign, 
      
     [fname],
     
      [lname]
     
        FROM [wclub].[dbo].[wmaster]
	group by callsign,fname,lname	

</cfquery>

<cfoutput>

 <cfdump var="#serializeJSON(hams, 'row' )#" />
<cfdump var="#hams#">




</cfoutput>





</head>
<body>

<div class="container" >
<input type="test" placeholder="What is the callsign"  onkeypress="searchfor()"   id="whatkey" >

<p id="abc">
sssssssssssssssssssssssss
</p>

</div>



    <form>


    </form>
    <script  src="jsLib/testonly.js">

    </script>  
</body>
</html>