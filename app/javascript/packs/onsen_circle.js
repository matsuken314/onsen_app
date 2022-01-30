document.addEventListener('turbolinks:load', () => {
    const Onsen_TotonoiData = gon.Onsen_TotonoiData
var ctx = document.getElementById('onsenChart').getContext('2d');
    var onsenChart = new Chart(ctx, {
        type: 'pie',
        data: {
            labels: ['サウナ', '水風呂', '外気浴'],
            datasets: [{
                label: '# of Votes',
                data: Onsen_TotonoiData,
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
      title: {
        display: true,
        text: '温泉 割合'
      }
    }
    });
    draw_graph();
})