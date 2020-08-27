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

const allAnalysesContainer = document.querySelectorAll('.container')


const makeCharts = () => {
  const containerAnalyses = document.querySelector("#container-analyses")
  const miniValues = containerAnalyses.dataset.minValue.split(', ');
  const maxiValues = containerAnalyses.dataset.maxValue.split(', ');
  const datesXAxis = containerAnalyses.dataset.dates.split(', ');
  const values = containerAnalyses.dataset.values.split(', ');
  const unit = containerAnalyses.dataset.unit;

  let minValues = [];
  miniValues.forEach(value => {
    minValues.push(parseFloat(value));
  });

  let maxValues = [];
  maxiValues.forEach(value => {
    maxValues.push(parseFloat(value));
  });

  let finalData = [];
  values.forEach(value => {
    finalData.push(parseFloat(value));
  });


  Highcharts.chart('container-analyses', {
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
      name: "Vos valeurs",
      data: finalData
    }, {
      name: "Valeurs usuelles minimum",
      data: minValues
    }, {
      name: "Valeurs usuelles maximum",
      data: maxValues
    }]
  });
};


document.addEventListener('turbolinks:load', () => {
  makeCharts();
});
