jQuery( document ).ready(function() {

    var levelCanvas = document.getElementById("levelChart");
    var levelCanvas2 = document.getElementById("levelChart1"); 
    var levelCanvas3 = document.getElementById("levelChart2"); 


    Chart.defaults.global.defaultFontFamily = "Lato";
    Chart.defaults.global.defaultFontSize = 16;
    
    var levelData = {
      label: 'РІВЕНЬ ЗАХВОРЮВАНОСТІ ЗА 2019 РІК',
      data: [5427, 5243, 5514, 3933, 1326, 687, 1271],
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
      type: 'horizontalBar',
      data: {
        labels: ["Хв. системи кровообігу", "Хв. сечостатевої системи", "Хв.органів травлення", "Хв. кістково-м'язової с-ми", "Новоутворення", "Хв. шкіри", "Хв. ендокринної с-ми"],
        datasets: [levelData],
      },
      options: chartOptions
    });

    var barChart2 = new Chart(levelCanvas3, {
      type: 'horizontalBar',
      data: {
        labels: ["Хв. системи кровообігу", "Хв. сечостатевої системи", "Хв.органів травлення", "Хв. кістково-м'язової с-ми", "Новоутворення", "Хв. шкіри", "Хв. ендокринної с-ми"],
        datasets: [levelData],
      },
      options: chartOptions
    });

    var barChart3 = new Chart(levelCanvas, {
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
