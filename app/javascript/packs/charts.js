var Highcharts = require('highcharts');  
// Load module after Highcharts is loaded
require('highcharts/modules/exporting')(Highcharts);  

const makeCharts = () => {
  const containerAnalyses = document.querySelector("#container-analyses");
  const miniValues = containerAnalyses.dataset.minValue.split(', ');
  const maxiValues = containerAnalyses.dataset.maxValue.split(', ');
  const datesXAxis = containerAnalyses.dataset.dates.split(', ');
  const values = containerAnalyses.dataset.values.split(', ');
  const unit = containerAnalyses.dataset.unit;

  console.log(values);

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
      name: "Valeurs usuelles minimales",
      data: minValues
    }, {
      name: "Valeurs usuelles maximales",
      data: maxValues
    }]
  });
};

export { makeCharts };