var features = [
  "state",
  "year",
  "population_million",
  "education_million",
  "welfare_million",
  "crime_rate",
  "unemployment_rate",
  "divorce_rate_per_1000_people",
  "homeownership_rate",
  "minimum_wage_effective",
  "CPI_Average",
  "inflation_rate",
  "avg_wage_index",
  "poverty_rate",
];
var stateChoices = [
  "Alabama",
  "Alaska",
  "Arizona",
  "Arkansas",
  "California",
  "Colorado",
  "Connecticut",
  "Delaware",
  "Florida",
  "Georgia",
  "Hawaii",
  "Idaho",
  "Illinois",
  "Indiana",
  "Iowa",
  "Kansas",
  "Kentucky",
  "Louisiana",
  "Maine",
  "Maryland",
  "Massachusetts",
  "Michigan",
  "Minnesota",
  "Mississippi",
  "Missouri",
  "Montana",
  "National",
  "Nebraska",
  "Nevada",
  "New Hampshire",
  "New Jersey",
  "New Mexico",
  "New York",
  "North Carolina",
  "North Dakota",
  "Ohio",
  "Oklahoma",
  "Oregon",
  "Pennsylvania",
  "Rhode Island",
  "South Carolina",
  "South Dakota",
  "Tennessee",
  "Texas",
  "Utah",
  "Vermont",
  "Virginia",
  "Washington",
  "West Virginia",
  "Wisconsin",
  "Wyoming",
];

var jsondata = "static/js/data.json";

var stateSelectTag = document.querySelector("#stateChoice");
var options = "";
for (var i = 0; i < stateChoices.length; i++) {
  var choice = stateChoices[i];
  var option = `<option value="${choice}">${choice}</option>`;
  options += option;
}
stateSelectTag.innerHTML = options;
stateSelectTag.addEventListener("change", function (e) {
  var value = e.target.value;
  d3.select("body table").remove();
  document.querySelector("#spinner").style.display = "flex";
  // document.querySelector("#jsondata");
  d3.json(jsondata, function (error, data) {
    filterByState(value, data);
  });
});

function initalFetch() {
  d3.select("body table").remove();
  document.querySelector("#spinner").style.display = "flex";
  d3.json(jsondata, function (error, data) {
    console.log("error", error);
    console.log("Data", data);
    // render the table(s)
    //filterByState("California", data)

    tabulate(data, features); // 2 column table
  });
}

initalFetch();

function filterByState(state, data) {
  console.log("COmparing: ", state);
  var data = data.filter(function (row) {
    return row.state == state;
  });
  tabulate(data, features);
}
function tabulate(data, columns) {
  console.log("data", data);
  document.querySelector("#spinner").style.display = "none";
  var table = d3.select("#table").append("table").attr("class", "table table-striped table-responsive");
  var thead = table.append("thead");
  var tbody = table.append("tbody");

  // append the header row
  thead
    .append("tr")
    .selectAll("th")
    .data(columns)
    .enter()
    .append("th")
    .text(function (column) {
      return column;
    });

  // create a row for each object in the data
  var rows = tbody.selectAll("tr").data(data).enter().append("tr");

  // create a cell in each row for each column
  var cells = rows
    .selectAll("td")
    .data(function (row) {
      return columns.map(function (column) {
        return { column: column, value: row[column] };
      });
    })
    .enter()
    .append("td")
    .text(function (d) {
      return d.value;
    });

  return table;
}
