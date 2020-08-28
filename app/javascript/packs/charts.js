var Highcharts = require('highcharts');  
// Load module after Highcharts is loaded
require('highcharts/modules/exporting')(Highcharts);  

const makeCharts = () => {
  const containerAnalyses = document.querySelectorAll(".container-analyses");

  containerAnalyses.forEach((analyse) => {
    const miniValues = analyse.dataset.minValue.split(', ');
    const maxiValues = analyse.dataset.maxValue.split(', ');
    const datesXAxis = analyse.dataset.dates.split(', ');
    const values = analyse.dataset.values.split(', ');
    const unit = analyse.dataset.unit;

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


  Highcharts.chart(analyse.id, {
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
});
};

export { makeCharts };