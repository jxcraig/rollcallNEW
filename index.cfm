<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>
        Document
    </title>
    <link href="CSS/menu.css" rel="Stylesheet">
    <script src="jsLib/funs.js">

    </script>

    <cfinclude template="udf.cfc">
</head>

<body>

        ul

    <form name="formRollcall" method="post" action="proccallins.cfm">
        <input type="text" value="ABCD" </form>

        <cfoutput>

            <cfquery datasource="wclubdb" name="rollcallMembers">
                select * from wmaster
                where isrollcall > 0
            </cfquery>
        </cfoutput>

        <button name="wer" onclick="showTableData()">Get Row Count</button>

        <div class="thetotal" id="totcheckins">
            <cfoutput>

            </cfoutput>
        </div>

        <div class="sourceTableLocation">
            <cfoutput>



                <table border="1" id="stid" class="sourceTable">
                    <tr style="background-color:  green; color: white;">
                        <th>
                            Callsign
                        </th>
                        <th>
                            Name
                        </th>
                    </tr>

                    <cfloop query="rollcallMembers">
                        <cfset w=setccap(#fname#)>
                            <tr>
                                <td onclick="addToDestTable('#callsign#','#setccap(fname)#', '#wid#' ,this)"
                                    ondblclick="removefromDestTable('#callsign#',this)"> #Callsign#
                                </td>
                                <td>
                                    #w# 
                                </td>


                            </tr>

                    </cfloop>
                </table>
            </cfoutput>
        </div>


        <div class="destTableLocation" id="destTableLocation">



            <form name='formRollcall' action="procCallIns.cfm" method="post">

                <table class="destTable" border="1" style="width: ;auto" id="destTable">
                    <tr style="background-color: purple;  color: white;">
                        <td>
                            Callsign
                        </td>
                        <td>
                            Name
                        </td>
                    </tr>

                </table>

                <button type="submit">Submit the form</button>
            </form>



        </div>





</body>

</html>