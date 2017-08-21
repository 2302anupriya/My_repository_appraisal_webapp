

function myFunction() {
    var table = document.getElementById("myTable");
    var row = table.insertRow();
    var cell1 = row.insertCell();
    var cell2 = row.insertCell();
    var cell3 = row.insertCell();
    var cell4 = row.insertCell();
    var cell5 = row.insertCell();
    var cell6 = row.insertCell();
    var cell7 = row.insertCell();
    var cell8 = row.insertCell();
    var cell9 = row.insertCell();
    var cell10 = row.insertCell();
    var cell11 = row.insertCell();
    
    cell1.innerHTML = document.getElementById("no").innerHTML; 
    cell2.innerHTML = document.getElementById("cat").innerHTML;
    cell3.innerHTML = document.getElementById("obj").innerHTML;
    cell4.innerHTML = document.getElementById("rem").innerHTML;
    cell5.innerHTML = document.getElementById("weightage").innerHTML;
    cell6.innerHTML = document.getElementById("training").innerHTML;
    cell7.innerHTML = document.getElementById("achievement").innerHTML;
    cell8.innerHTML = document.getElementById("mgrasses").innerHTML;
    cell9.innerHTML = document.getElementById("mgrcomment").innerHTML;
    cell10.innerHTML = document.getElementById("performancerating").innerHTML;
    cell11.innerHTML = document.getElementById("finalasses").innerHTML;

}


function changeFunction() {
	debugger;
window.document.location.href=this.options[this.selectedIndex].value;

}