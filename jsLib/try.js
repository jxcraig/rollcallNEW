// deno-lint-ignore-file
const hams =
    [{

        "cs": "K6AII",
        "fname": "Bob",
        "lname": "Craig"
    },

    {
        "cs": "W6CKC",
        "fname": "Jess",
        "lname": "Craig"
    },
    {
        "cs": "N6BPA",
        "fname": "Roger",
        "lname": "XXXXXXXXX"
    },
    {
        "cs": "N6AAA",
        "fname": "Tim",
        "lname": "XXXXXXXXX"
    },
    {
        "cs": "W6AAA",
        "fname": "Tim",
        "lname": "Joe"
    },

    {
        "cs": "KD6DKH",
        "fname": "Fred",
        "lname": "Johnson"
    }

    ]

const anyhams = hams.filter(h => h.cs.toUpperCase().charAt(0) === 'W')



console.log(anyhams.length);










//console.log(hams[2].cs.charAt(0));