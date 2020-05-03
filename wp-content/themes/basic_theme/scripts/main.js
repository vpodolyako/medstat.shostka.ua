jQuery( document ).ready(function() {
    var ctx = document.getElementById('myChart').getContext('2d');

    // var myPieChart = new Chart(ctx, {
    //     type: 'pie',
    //     data: data,
    //     options: options,
    //     data = {
    //         datasets: [{
    //             data: [10, 20, 30]
    //         }],
        
    //         // These labels appear in the legend and in the tooltips when hovering different arcs
    //         labels: [
    //             'Red',
    //             'Yellow',
    //             'Blue'
    //         ]
    //     },
    // });

    var chart = new Chart(ctx, {
        type: 'pie',
        options: {
            title: {
                display: true,
                text: 'Графік захворювання на COVID-19'
            }
        },
        data : {
            datasets: [{
                data: [8100, 4000, 1000],
                fill: true,
                backgroundColor: [
                    '#EE3030',
                    '#30EE7A',
                    '#4A4759'],
            }],
            // These labels appear in the legend and in the tooltips when hovering different arcs
            labels: [
                'Захворіли',
                'Одужали',
                'Померли'
            ]
        },
    });
  });


