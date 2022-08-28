<cfcomponent >

 <cffunction name="isadmin"   returntype="any" output="yes">
 <cfargument name="whoareyou"   type="string" required="yes" >
  


</cffunction>



 <cffunction name="isinwmaster"   returntype="any" output="yes">
 <cfargument name="thecall"   type="string" required="yes" >
 	 <cfquery name="iswarfa" datasource="wclubdb" result="isncs">
	
 	
	
    select * from wmaster where callsign = 
	<cfqueryparam    cfsqltype="cf_sql_varchar"value="#thecall#">
	</cfquery>
    
    
    <cfreturn  #iswarfa#>
    
   
    


	
</cffunction>



<cffunction name="putcheckins" output="true" returnType="any">

	<cfargument name="netdate" type="date" required="true"  />
    <cfargument name="ncscallsign" type="string" required="true"  />
    <cfargument name="cicallsign" type="string" required="true"  />
 
 <cfoutput>   
  <cfquery name="doput" datasource="wclubdb" result="resx">
  
 INSERT INTO [dbo].[checkinsNew]
           (
           [netdate],
            [ncscallsign],
            [cicallsign]
           )
     VALUES
           (
            '#form.netdate#', 
            '#form.ncscallsign#', 
            '#form.xcicallsign#'
         
          ) 
</cfquery>

<cfdump var="#resx#">
   
    </cfoutput>
    
    </cffunction>


<cffunction name="getqrzdata"  returntype="any" output="yes">
 <cfargument name="thecall"   type="string" required="yes" >



<cfset xmlObject = XmlParse("http://xmldata.qrz.com/xml/current/?username=w6ckc;password=6fdpio","yes")>

<cfset qrzkey = #xmlobject["QRZDatabase"] ["Session"] ["Key"] ["XmlText"]# >

<cfset xmlObject2 = XmlParse("http://xmldata.qrz.com/xml/current/?s=#qrzkey#;callsign='#arguments.thecall#'")>
<cfset qrz.callsign = "#xmlobject2["QRZDatabase"] ["Callsign"] ["call"] ["XmlText"]#">
<cfset qrz.fname = "#xmlobject2["QRZDatabase"] ["Callsign"] ["fname"] ["XmlText"]#">
<cfset qrz.lname = "#xmlobject2["QRZDatabase"] ["Callsign"] ["name"] ["XmlText"]#">
<cfset qrz.address = "#xmlobject2["QRZDatabase"] ["Callsign"] ["addr1"] ["XmlText"]#">
<cfset qrz.city = "#xmlobject2["QRZDatabase"] ["Callsign"] ["addr2"] ["XmlText"]#">
<cfset qrz.state = "#xmlobject2["QRZDatabase"] ["Callsign"] ["state"] ["XmlText"]#">
<cfset qrz.zip = "#xmlobject2["QRZDatabase"] ["Callsign"] ["zip"] ["XmlText"]#">

<cfset qrz.licexp = "#xmlobject2["QRZDatabase"] ["Callsign"] ["expdate"] ["XmlText"]#"><br />
<cfset qrz.licclass = "#xmlobject2["QRZDatabase"] ["Callsign"] ["class"] ["XmlText"]#"><br />
<!---<cfset qrz.born = "#xmlobject2["QRZDatabase"] ["Callsign"] ["born"] ["XmlText"]#"><br />--->




<cfset session.qrzdata.callsign = #ucase(qrz.callsign)#>

<cfset session.qrzdata.fname = #setccap(qrz.fname)#>
<cfset session.qrzdata.lname = #setccap(qrz.lname)#>
<cfset session.qrzdata.address = #qrz.address#>
<cfset session.qrzdata.city = #setccap(qrz.city)#>
<cfset session.qrzdata.state = #setccap(qrz.state)#>
<cfset session.qrzdata.zip = #qrz.zip#>
<cfset session.qrzdata.isadmin = '0'>
<cfset session.qrzdata.memstatus  = '1'>
<cfset session.qrzdata.isncs = '0'>
<cfset session.qrzdata.isalastupdate  = '0'>

 <cfset curdate =now()>
  <cfset   theyear = DatePart("yyyy",curdate)>
   <cfset   themonth = DatePart("m",curdate)>
    <cfset   theday = DatePart("d",curdate)>
    
    
<cfset session.qrzdata.isalastupdate  =  DateFormat(curdate,"yyyy-m-dd")>





<!---<cfdump var="#(session)#">--->

<!--- <cfreturn #session#>--->
 
  </cffunction>
  
  
  
  <cffunction name="setccap" returntype="string"  output="yes"> 
<cfargument name="str"   type="string" required="No" >

<cfset str = lcase(str)>
<cfset fp= ucase(left(str,1))>
<cfset rc = mid(str,2,len(str)-1)>
<cfset fs = fp&rc>

<cfreturn #fs#>

</cffunction>
  
  <cffunction  name="insertQrzdata" output="yes" returntype="any">
  
 

 
 
<cfset  curdate = now()>
 
 <cfset    dbdate= DateFormat(curdate,"yyyy-mm-dd")>
 
  
  
  <cfquery name="putqrz" datasource="wclubdb" result="putthem">
	INSERT INTO [wmaster]
           ([callsign],
            [fname],
             [lname],
              [address],
               [city],
                [state],
                 [zip],
                  [aclass],
                   [licexp],
                  
                  [isAdmin],
      				[memstatus],
              	 	[isncs],
    				[lastupdate])
     VALUES
           (
           '#session.qrzdata.callsign#',
           '#fname#',
            '#lname#',
              '#address#',
               '#city#',
                '#state#',
                 '#zip#',
                  '#licclass#',
                   '#licexp#',
                  
                  
                   '0' , 
                   '1',
                   '0',
                   '#dbdate#'
                   
          
           
           )

</cfquery>

<cfdump  var="#putthem#">

</cffunction>

   
<!--- *****   ####FUNCTION NAME: memcall####: Function NAME:  Function to call ONE member by callsign  !!!!  Return: memquery*****  --->
<cffunction name="memcall" returntype="query"  output="yes"> 
<cfargument name="callsignx"   type="string" required="yes" >
<cfquery

name="memquery" datasource="ladb" > 
SELECT *
FROM [jess101].[wmembers] 
where callsign = 
<cfqueryparam    cfsqltype="cf_sql_varchar"value="#arguments.callsignx#">
</cfquery> 
<cfreturn   memquery>  
</cffunction> 

<!--- ***** ####FUNCTION NAME: pencall####:	Function to call ONE PENDING  member by callsign, !!!! Return: penquery  *****  --->
<cffunction name="pencall" returntype="query"  output="yes"> 
<cfargument name="callsignx"   type="string" required="yes" >
<cfquery

name="penquery" datasource="ladb" > 
SELECT *
FROM [jess101].[wpending] 
where callsign = 
<cfqueryparam    cfsqltype="cf_sql_varchar"value="#arguments.callsignx#">
</cfquery> 
<cfreturn   penquery>  
</cffunction> 


<!--- ***** ####FUNCTION NAME: allcall####Function to call ALL members , !!!! Return: allquery  *****  --->
<cffunction name="allcall" returntype="query"  output="yes"> 
<cfquery

name="allquery" datasource="ladb" > 
SELECT *
FROM [jess101].[wmembers] 
Order by lname
</cfquery> 
<cfreturn   allquery>  
</cffunction> 


<!--- ***** ####FUNCTION NAME: penall####Function to call ALL PENDING members, !!!! Return: penallquery  *****  --->
<cffunction name="penall" returntype="query"  output="yes"> 
<cfquery

name="penallquery" datasource="ladb" > 
SELECT *
FROM [jess101].[wpending] 
Order by lname

</cfquery> 
<cfreturn   penallquery>  
</cffunction> 






<!--- ***** ####FUNCTION NAME: coordquery###Function to call ALL members who are not roster coord, !!!! Return: coordquery  *****  --->
<cffunction name="newcoor" returntyp e="query"  output="yes"> 
<cfquery

name="coordquery" datasource="ladb" > 
SELECT *

FROM [covedb1].[jess101].[wmembers]
  where rostcoor = 0
Order by lname

</cfquery> 
<cfreturn   coordquery>  
</cffunction> 

<!--- ***** ####FUNCTION NAME: setclass ####Function to set the  ALL PENDING members, !!!! Return: penallquery  *****  --->
<cffunction name="setclass" returntype="string"  output="yes"> 
<cfargument name="aclass"   type="string" required="No" >

<cfswitch expression="#aclass#">

<cfcase value="E">
<cfset aclass = "Extra">
</cfcase>

<cfcase value="G">
<cfset aclass = "General">
</cfcase>

<cfcase value="T">
<cfset aclass = "Tech">
</cfcase>

<cfcase value="A">
<cfset aclass = "Advanced">
</cfcase>


<cfdefaultcase> 
<cfset aclass = "">
</cfdefaultcase> 

</cfswitch>
<cfreturn #aclass#>

</cffunction>


<cffunction name="wdata" returntype="string"  output="yes"> 
<cfargument name="rdata"    type="string" required="No" >

<cfswitch expression="#rdata#">
<cfcase value="T">
<cfset senddata =" Western Amateur Radio Friendship Association">
</cfcase>
</cfswitch>
<cfreturn #senddata#>
</cffunction>


<cffunction name="pagehead"  returntype="any"  output="yes"> 

<div class="apptitle">
<img src="http://warfa.net/images/LOGOWARFA.gif" width="150" height="85" hspace=".25" vspace=".25" border=".25" align="top"  />
<span class="warfatitalformat">Western Amateur Radio
 Friendship Association</span> 
</div>


<cfreturn >

</cffunction>


<!--- ***** ####FUNCTION NAME: innetdb###Function A call see if a checkin is in the wnetdb members , !!!! Return: innetdb  *****  --->
<cffunction name="innetdb" returntype ="query"  output="yes"> 
<cfargument name="callsignx"   type="string" required="yes" >
<cfquery

name="innetdb" datasource="ladb" > 
SELECT *

FROM [covedb1].[jess101].[wnetdb]
where callsign = 
<cfqueryparam    cfsqltype="cf_sql_varchar"value="#arguments.callsignx#">
 


</cfquery> 
<cfreturn   innetdb>  
</cffunction> 





</cfcomponent>




