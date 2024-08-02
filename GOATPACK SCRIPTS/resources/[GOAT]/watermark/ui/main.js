const updateDigits = (_value, type) => {
    const length =  type === "speed" ? 3
                    : type === "id" ? 4
                    : 5; // index
    const value = _value.toString().padStart(length, "0");

    for (let i = 0; i < length; i++) {
        $(`#${type}-digit-${i + 1}`).html(value[i]);
    }

    $(`.zero-${type}`).removeClass(`zero-${type}`);

    for (let i = 0; i < length; i++) {
        if (value[i] != 0) {
            break;
        }

        $(`#${type}-digit-${i + 1}`).addClass(`zero-${type}`);
    }
}

function updatePlayerId(playerId, userId) {
    // $('#player-id').html(playerId);
    updateDigits(playerId, "id");
}


window.addEventListener('message', (event) => {
    const data = event.data
    switch (data.action) {


        case "updatePlayerId":
            updatePlayerId(data.id, data.index)
            break;

    }
});

