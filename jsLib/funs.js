// deno-lint-ignore-file


function doJson() {

	console.log(arguments);
	alert(arguments[0]);
	alert(arguments[1]);
	alert(arguments[2]);


}



function addToDestTable() {


	//alert(`the sent callsign is: ${arguments[0]}`);

	var csinDestTable = false;



	var destTable = document.getElementById('destTable');

	for (i = 1; i < destTable.rows.length; i++) {

		var CallsigninDestTable = destTable.rows.item(i).cells[0].innerHTML;

		if (arguments[0] === CallsigninDestTable) {
			csinDestTable = true;
			alert(`the  callsign in the dest Table is: ${CallsigninDestTable} AND 
			//the callsign being netered is ${arguments[0]} is  record number : ${i}`);

		}
	}

	if (csinDestTable) {

		arguments[3].bgColor = "pink";

	}
	else {



		var table = document.getElementById("destTable");
		var row = table.insertRow(-1);
		var cell1 = row.insertCell(0);
		var cell2 = row.insertCell(1);

		cell1.innerHTML = arguments[0];
		cell2.innerHTML = arguments[1];
		arguments[3].bgColor = "green";
		arguments[3].style.color = "white";

		var destTableRows = document.getElementById('destTable').rows.length - 1;
		document.getElementById('totcheckins').innerHTML = ` Total Checkins: ${destTableRows}`;

		setRollcallRecord(arguments[2]);

	}

}

function setRollcallRecord(wid) {

	//alert(wid);
	//     // Create an input element for Full Name
	var FN = document.createElement("input");
	FN.setAttribute("type", "hidden");
	FN.setAttribute("name", "wid");
	FN.setAttribute("placeholder", "Full Name");
	FN.setAttribute("value", wid);

	formRollcall.appendChild(FN);



}


function removefromDestTable() {

	//console.log(arguments);

	var destTable = document.getElementById('destTable');

	for (i = 1; i < destTable.rows.length; i++) {

		var CallsigninDestTable = destTable.rows.item(i).cells[0].innerHTML;

		if (arguments[0] === CallsigninDestTable) {
			alert(` the current matching record is: ${i}`)
			destTable.deleteRow(i);

			//arguments[1].blur();
			arguments[1].bgColor = 'white';
			arguments[1].style.color = 'black';
			var destTableRows = document.getElementById('destTable').rows.length - 1;
			document.getElementById('totcheckins').innerHTML = ` Total Checkins: ${destTableRows}`;



		}
	}
}

function testit(thecallsign) {

	//alert(`the sent callsign is: ${ thecallsign }`);
	var destTable = document.getElementById('destTable');
	for (i = 1; i < destTable.rows.length; i++) {

		var inTableCallsign = destTable.rows.item(i).cells[0].innerHTML;
		alert(inTableCallsign === thecallsign);



	}
}

function showTableData() {

	document.getElementById('info').innerHTML = "";
	var myTab = document.getElementById('destTable');



	// LOOP THROUGH EACH ROW OF THE TABLE AFTER HEADER.
	for (i = 1; i < myTab.rows.length; i++) {

		// GET THE CELLS COLLECTION OF THE CURRENT ROW.
		var objCells = myTab.rows.item(i).cells;

		//alert(`Total cells pre row : ${ objCells.length }`);

		// LOOP THROUGH EACH CELL OF THE CURENT ROW TO READ CELL VALUES.
		//for (var j = 0; j < objCells.length; j++) {
		info.innerHTML = info.innerHTML + ' ' + objCells.item(0).innerHTML;
		alert(`a cell value = ${objCells.item(0).innerHTML} `);

		alert('N6BPA' === objCells.item(0).innerHTML)
		//}
		info.innerHTML = info.innerHTML + '<br />';     // ADD A BREAK (TAG).
	}
}


function capFirst(str) {
	return str.charAt(0).toUpperCase() + str.slice(1);

}


// JavaScript Document


function isdup(who, ckdate) {
	alert(ckdate);
	const xhttp = new XMLHttpRequest();
	xhttp.onload = function () {
		document.getElementById("isdupans").innerHTML = this.responseText;
	}
	xhttp.open("GET", "/serwarfa/checkDups.cfm?" + who + "&" + 999999 + '"', true);
	xhttp.send();
}




function setcase(x) {

	alert("xxxxxxxxxxx");

	flet = x.charAt(0);
	llets = x.slice(1);
	llets = llets.toLowerCase();
	//	alert("this is the first of it   " + flet); 


	// alert("this is the rest of it   " +flet + llets  ); 

	//str2 = x.charAt(0).toUpperCase() + x.slice(1).toLowerCase();

	// document.getElementById("myAnchor").id = "str2;";
	document.getElementById("demo").innerHTML = flet + llets;
}

