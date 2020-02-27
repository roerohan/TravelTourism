var seats = [];

function randomize(a) {
    for (let i = 0; i < 105; i++) {
        a.push('vacant');
    }
    for (let i = 0; i < 20; i++) {
        const num = Math.floor(Math.random() * 105);
        if (!(num > 0 && num < 10)) {
            a[num] = 'occupied';
        }
    }
}

randomize(seats);

const mappings = {
    '669279913306': 5,
    '862102530736': 9,
}

module.exports = {
    seats,
    mappings,
    randomize,
}
