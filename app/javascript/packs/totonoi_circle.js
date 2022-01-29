document.addEventListener('turbolinks:load', () => {
    const TotonoiData = gon.Totonoi_data
var ctx = document.getElementById('myChart').getContext('2d');
    var myChart = new Chart(ctx, {
        type: 'doughnut',
        data: {
            labels: ['サウナ', '水風呂', '外気浴'],
            datasets: [{
                label: '# of Votes',
                data: TotonoiData,
                backgroundColor: [
                    'rgba(255, 99, 132, 0.2)',
                    'rgba(54, 162, 235, 0.2)',
                    'rgba(97,195,89, 0.2)'
                ],
                borderColor: [
                    'rgba(255, 99, 132, 1)',
                    'rgba(54, 162, 235, 1)',
                    'rgba(97,195,89, 1)'
                ],
                borderWidth: 1
            }]
        },
        options: {
            responsive: true,
            maintainAspectRatio: false,
            scales: {
                yAxes: [{
                    ticks: {
                        beginAtZero: true
                    }
                }]
            },
            plugins: {
              labels: [
                    {
                    render: 'label',
                    position: 'outside'
                    },
                    {
                    render: 'percentage'
                    }
                ]
            },
        }
    });
    draw_graph();
})