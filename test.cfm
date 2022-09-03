<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
 

 <button    >Click this Button for los of info</button>
  <button   onclick="makeroll()"  >Make a Record</button>

   <button onclick="sendit()">send from</button>

   <form method="post" name="cf" action="proccallins.cfm">
   <button  type="submit"  >Submit Form</button>
   </form>


    <script>

  
         var down = document.getElementById("GFG_DOWN");

         

        // // Create a break line element
        // var br = document.createElement("br");
        // function GFG_Fun() {

        //     // Create a form dynamically

            var checkinForm = document.createElement("form");
            checkinForm.setAttribute("method", "post");
            checkinForm.setAttribute("action", "procCallins.cfm");
            checkinForm.setAttribute("name", "checkinForm");

    function makeroll ()
    {
           // let hid =0 ;

        //     // Create an input element for Full Name
             var FN = document.createElement("input");
             FN.setAttribute("type", "hidden");
             FN.setAttribute("name", "wid");
             FN.setAttribute("placeholder", "Full Name");
             FN.setAttribute("value", ++hid);

              cf.appendChild(FN);

    console.log(cf);
   

 }   

 function sendit()
 {


    const checkinform = document.forms;
    console.log(checkinform);


 var FN = document.createElement("input");
             FN.setAttribute("type", "text");
             FN.setAttribute("name", "FullName");
             FN.setAttribute("placeholder", "Full Name");
checkinForm.appendChild(FN);
checkinform.appendChild(FN);
checkinform.submit() ;
checkinForm.submit() ;



 }    
    </script>

    <table border="2" id="checkinForm">
    <tr>
    <td>Some data</td>
     <td>Some More data</td>

    </tr>

    </table>
</body>
</html>