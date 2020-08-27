// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)


// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "bootstrap";
var Highcharts = require('highcharts');  
// Load module after Highcharts is loaded
require('highcharts/modules/exporting')(Highcharts);  

// Internal imports, e.g:
// import { initSelect2 } from '../components/init_select2';

const allAnalysesContainer = document.querySelectorAll('#all-analyses');
const allCharts = () => {allAnalysesContainer.foreach(item => {
  makeCharts();
})}; 

const makeCharts = () => {
  const datesXAxis = document.querySelector("#container").dataset.dates.split(', ');
  const values = document.querySelector("#container").dataset.values.split(', ');
  const unit = document.querySelector("#container").dataset.unit;
  let finalData = [];
  values.forEach(element => {
    finalData.push(parseFloat(element));
  });

  Highcharts.chart('container', {
    chart: {
      type: 'line'
    },
    title: {
      text: ""
    },
    xAxis: {
      categories: datesXAxis
    },
    yAxis: {
      title: {
        text: unit
      }
    },
    plotOptions: {
      line: {
        dataLabels: {
          enabled: true
        },
        enableMouseTracking: false
      }
    },
    series: [{
      name: "",
      data: finalData
    }]
  });
};

document.addEventListener('turbolinks:load', () => {
  allCharts();
});
