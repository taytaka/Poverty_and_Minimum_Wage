fetch("/trends")
.then(function(resp) {
    console.log("This is response from /data END POINT", resp)
    return resp.json();
})
.then(function(data) {
    console.log("This is data", data);
    
    var selectState = document.querySelector('select#states');
    console.log("ss",selectState)
    var states = data.states;
    states = states.sort();
    var options = "";
    for(var i = 0; i < states.length; i++){
        var state = states[i];
        options+= `<option value="${state}"> ${state}</option>`;
    }
    selectState.innerHTML = options;
    // var chartArea = document.querySelector("#chartArea");
    // var html = `<h1>Data: </h1><span style="color: red;">${data.data}</span>`;
    // chartArea.innerHTML = html;
    var selectYear = document.querySelector('select#years');
    console.log("yr", selectYear)
    var years = data.years;
    years = years.sort((a, b ) => a - b);
    var options = "";
    for(var i = 0; i < years.length; i++){
        var year = years[i];
        options += `<option value= "${year}"> ${state} </option>`;
    }
})
.catch(function(err) {
    console.log("There was an error")
})

function onSelect() {
  console.log("this", this)
}

var s = document
.querySelector("select#states");
console.log(s);
s.addEventListener('change', function(e) {
    console.log("Event", e.target.value);
    var endPoint = `/state?state=${e.target.value}&year=${year}`;
    console.log("REQ: ", endPoint)
    fetch(endPoint)
    .then(function(resp) {
        return resp.json();
    })
    .then(function(data){
        console.log("Data: ", data);
    })
    .catch(function(err){
        console.log("err", err);
    })
})