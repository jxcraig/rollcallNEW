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

    <cfoutput>

        <cfquery datasource="wclubdb" name="rollcallMembers">
            select * from wmaster
            where isrollcall > 0
        </cfquery>
    </cfoutput>

    <button name="wer" onclick="showTableData()">Ge Row Count</button>

    <div class="thetotal" id="totcheckins">
        <cfoutput>
            ccccccccccccccccccccccccccccccccccccccccccccccc
        </cfoutput>
    </div>

    <div class="sourceTable">
        <cfoutput>


            <table border="1" id="stid">
                <tr>
                    <td>
                        Callsign
                    </td>
                    <td>
                        Name
                    </td>
                </tr>

                <cfloop query="rollcallMembers">
                    <cfset w=setccap(#fname#)>
                        <tr>
                            <td onclick="addToDestTable('#callsign#','#setccap(fname)#', #wid#,this)"
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




    <div>



        <table class="destTable" id="destTable">
            <tr>
                <td>
                    Callsign
                </td>
                <td>
                    Name
                </td>
            </tr>

        </table>


    </div>





</body>

</html>