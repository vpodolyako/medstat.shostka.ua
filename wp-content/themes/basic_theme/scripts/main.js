jQuery( document ).ready(function() {

    var levelCanvas = document.getElementById("levelChart");
    var levelCanvas2 = document.getElementById("levelChart1"); 
    var levelCanvas3 = document.getElementById("levelChart2"); 


    Chart.defaults.global.defaultFontFamily = "Lato";
    Chart.defaults.global.defaultFontSize = 16;
    
    var levelData = {
      label: 'СТРУКТУРА СЕРЦЕВО-СУДИННИХ ХВОРОБ ЗА 2019 РІК',
      data: [3090, 871, 15, 913, 37],
      backgroundColor: [
        'rgba(0, 99, 132, 0.6)',
        'rgba(30, 99, 132, 0.6)',
        'rgba(60, 99, 132, 0.6)',
        'rgba(90, 99, 132, 0.6)',
        'rgba(120, 99, 132, 0.6)',
        'rgba(150, 99, 132, 0.6)',
        'rgba(180, 99, 132, 0.6)',
        'rgba(210, 99, 132, 0.6)',
        'rgba(240, 99, 132, 0.6)'
      ],
      borderColor: [
        'rgba(0, 99, 132, 1)',
        'rgba(30, 99, 132, 1)',
        'rgba(60, 99, 132, 1)',
        'rgba(90, 99, 132, 1)',
        'rgba(120, 99, 132, 1)',
        'rgba(150, 99, 132, 1)',
        'rgba(180, 99, 132, 1)',
        'rgba(210, 99, 132, 1)',
        'rgba(240, 99, 132, 1)'
      ],
      borderWidth: 1.5,
      hoverBorderWidth: 0
    };
    
    var chartOptions = {
      scales: {
        yAxes: [{
          barPercentage: 0.5
        }]
      },
      elements: {
        rectangle: {
          borderSkipped: 'left',
        }
      }
    };

    var barChart = new Chart(levelCanvas2, {
      type: 'bar',
      data: {
        labels: ["Ішемічна хвороба серця", "Стенокардія", "Інфаркт міокарда", "Гіпертонічна хвороба", "Інсульт"],
        datasets: [levelData],
      },
      options: chartOptions
    });



    var levelData = {
      label: 'РІВЕНЬ ЗАХВОРЮВАНОСТІ ЗА 2019 РІК',
      data: [2815.7, 1519.4, 998.8, 653.5, 387.8, 595.0, 393.1],
      backgroundColor: [
        'rgba(0, 99, 132, 0.6)',
        'rgba(30, 99, 132, 0.6)',
        'rgba(60, 99, 132, 0.6)',
        'rgba(90, 99, 132, 0.6)',
        'rgba(120, 99, 132, 0.6)',
        'rgba(150, 99, 132, 0.6)',
        'rgba(180, 99, 132, 0.6)',
        'rgba(210, 99, 132, 0.6)',
        'rgba(240, 99, 132, 0.6)'
      ],
      borderColor: [
        'rgba(0, 99, 132, 1)',
        'rgba(30, 99, 132, 1)',
        'rgba(60, 99, 132, 1)',
        'rgba(90, 99, 132, 1)',
        'rgba(120, 99, 132, 1)',
        'rgba(150, 99, 132, 1)',
        'rgba(180, 99, 132, 1)',
        'rgba(210, 99, 132, 1)',
        'rgba(240, 99, 132, 1)'
      ],
      borderWidth: 1.5,
      hoverBorderWidth: 0
    };
    
    var chartOptions = {
      scales: {
        yAxes: [{
          barPercentage: 0.5
        }]
      },
      elements: {
        rectangle: {
          borderSkipped: 'left',
        }
      }
    };
    
    var barChart2 = new Chart(levelCanvas, {
      type: 'horizontalBar',
      data: {
        labels: ["Хв. системи кровообігу", "Хв. сечостатевої системи", "Хв.органів травлення", "Хв. кістково-м'язової с-ми", "Новоутворення", "Хв. шкіри", "Хв. ендокринної с-ми"],
        datasets: [levelData],
      },
      options: chartOptions
    });

    jQuery(".owl-carousel").owlCarousel({
      items:1,
      loop:true,
      autoplay:true
    });
    
});
