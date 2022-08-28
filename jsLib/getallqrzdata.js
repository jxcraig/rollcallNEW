
function placeqrzdata(cs,thekey) {
// document.getElementById("demo").innerHTML =  thekey;
  
//alert("https://xmldata.qrz.com/xml/current/?s="+thekey+";callsign=k6aii")
 //  document.getElementById("qqq").innerHTML = thekey;
   wwww = new XMLHttpRequest();
  wwww.open('GET', "https://xmldata.qrz.com/xml/current/?s="+thekey+";callsign="+cs+'"');
  wwww.onload = function() {
    if (wwww.status == 200) {
	
	//alert(wwww.status)
	
		parser = new DOMParser();
	xmlDoc = parser.parseFromString(wwww.responseText,"text/xml");
	//alert(wwww.responseText)
	
	   cs =  xmlDoc.getElementsByTagName('call')[0].innerHTML	 ;	   
	   fname =  xmlDoc.getElementsByTagName('fname')[0].innerHTML	 ;
	   lname =  xmlDoc.getElementsByTagName('name')[0].innerHTML	 ;
	   address =  xmlDoc.getElementsByTagName('addr1')[0].innerHTML  ;
	   city =  xmlDoc.getElementsByTagName('addr2')[0].innerHTML  ;
	   state =  xmlDoc.getElementsByTagName('state')[0].innerHTML  ;
	   zip =  xmlDoc.getElementsByTagName('zip')[0].innerHTML  ;
	     email =  xmlDoc.getElementsByTagName('email')[0].innerHTML  ;
		
	
	   
	
		
		 document.getElementById("callsign").innerHTML =cs  ;
		 document.getElementById("fname").innerHTML =fname  ;
		 document.getElementById("lname").innerHTML = lname ;
		 document.getElementById("city").value = city ;
		 document.getElementById("state").value = state ;
		 document.getElementById("zip").value = zip ;
		  document.getElementById("email").value = email ;
		   //  document.getElementById("address").value = address //address ;
			 x =   document.getElementById("address").value
		 
		 
		if (x =="")
		{
		 	   document.getElementById("address").value = address  ;
			   
		}
			   else
			 
		{	   
			   alert("RRRRRRRRRRRRRRRRRRR")
	
		
		
		}

}

  }
    wwww.send();
}




function getkey(cs,placeqrzdata) {
 
   key = new XMLHttpRequest();
  key.open('GET', "https://xmldata.qrz.com/xml/?username=w6ckc;password=6fdpio");
  key.onload = function() {
    if (key.status == 200) {
	
		parser = new DOMParser();
	xmlDoc = parser.parseFromString(key.responseText,"text/xml");
	
	   qrzkey =  xmlDoc.getElementsByTagName('Key')[0].innerHTML

	
	 var  qrzkey =  xmlDoc.getElementsByTagName('Key')[0].innerHTML  ;
      placeqrzdata(cs,qrzkey);
    } 
   
   
  }
  key.send();
}


