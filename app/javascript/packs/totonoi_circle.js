document.addEventListener('turbolinks:load', () => {
    var TotonoiData = gon.Totonoi_data
    var ctx = document.getElementById('myChart').getContext('2d');
    var dataLabelPlugin = {
        afterDatasetsDraw: function (chart, easing) {
            var ctx = chart.ctx;
            chart.data.datasets.forEach(function (dataset, i) {
                var meta = chart.getDatasetMeta(i);
                if (!meta.hidden) {
                    meta.data.forEach(function (element, index) {
                        ctx.fillStyle = '#333';

                        var fontSize = 14;
                        var fontStyle = 'bold';
                        var fontFamily = 'Helvetica Neue';
                        ctx.font = Chart.helpers.fontString(fontSize, fontStyle, fontFamily);
    
                        var dataString = chart.data.labels[index]+`\r\n`+dataset.data[index].toString()+'分';
    
                        ctx.textAlign = 'center';
                        ctx.textBaseline = 'middle';
                        var position = element.tooltipPosition();
                        ctx.fillText(dataString, position.x, position.y - (fontSize / 2) );
                    })
                }
            })
        }
    }
    var myChart = new Chart(ctx, {
        type: 'pie',
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
        title: {
            display: true,
            text: '温泉割合'
        }
        },
        plugins: [dataLabelPlugin]
    });
    draw_graph();
})