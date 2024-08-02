var Earned = 0;
var Generated = {};
var Result = false;

window.addEventListener("message", (event) => {
    switch(event.data.action) {
        case 'START_GAME':
            StartGame();
            break;
    }
})

const StartGame = (() => {
    $('.Minigame').css('display', 'flex');
    $('.Minigame').fadeIn(100);
    $('.Bar').animate({
        width: '0%'
    }, 3000, () => {
        $('.Items').html('');
        $('.Bar').css('width', '85%');
        for (let i = 0; i < 10; i++) {
            let random = Math.floor(Math.random() * 5);
            let posY = Math.floor(Math.random() * 90);
            let posX = Math.floor(Math.random() * 90);
            if (random == 5) {
                let newItem = $(`<div style="top: ${posY}%; left: ${posX}%; background: center / contain no-repeat url('img/bag.png')" class="item"></div>`)
                $('.Items').append(newItem);
                Generated[i] = true;
                newItem.on('click', () => {
                    newItem.remove();
                    Earned = Earned + 50;
                    delete Generated[i];
                    if (Object.keys(Generated).length < 1) {
                        $('.Minigame').fadeOut(200);
                        Result = true;
                        ResetGame();
                        $.post('https://goat_pockets/EndGame', JSON.stringify({ money: Earned }));
                    }
                })
            } else if (random == 3 || random == 4) {
                let newItem = $(`<div style="top: ${posY}%; left: ${posX}%; background: center / contain no-repeat url('img/cash.png')" class="item"></div>`)
                $('.Items').append(newItem);
                Generated[i] = true;
                newItem.on('click', () => {
                    newItem.remove();
                    Earned = Earned + 60;
                    delete Generated[i];
                    if (Object.keys(Generated).length < 1) {
                        $('.Minigame').fadeOut(200);
                        Result = true;
                        ResetGame();
                        $.post('https://goat_pockets/EndGame', JSON.stringify({ money: Earned }));
                    }
                })
            } else {
                let newItem = $(`<div style="top: ${posY}%; left: ${posX}%; background: center / contain no-repeat url('img/coin.png')" class="item"></div>`)
                $('.Items').append(newItem);
                Generated[i] = true;
                newItem.on('click', () => {
                    newItem.remove();
                    Earned = Earned + 100;
                    delete Generated[i];
                    if (Object.keys(Generated).length < 1) {
                        $('.Minigame').fadeOut(200);
                        Result = true;
                        ResetGame();
                        $.post('https://goat_pockets/EndGame', JSON.stringify({ money: Earned }));
                    }
                })
            }
        }
        $('.Loading').hide();
        $('.Main').fadeIn(150);
        $('.Bar').animate({
            width: '0%'
        }, 3500, () => {
            if (!Result) {
                $('.Minigame').fadeOut(200);
                Result = true;
                ResetGame();
                $.post('https://goat_pockets/EndGame', JSON.stringify({ money: Earned }));
            }
        })
    })
})

const ResetGame = (() => {
    setTimeout(() => {
        Result = false;
        Earned = 0;
        Generated = {};
        $('.Loading').show();
        $('.Main').hide();
        $('.Bar').stop();
        $('.Bar').css('width', '85%');
        $('.Items').html('');
    }, 200);
})