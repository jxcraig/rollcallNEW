// deno-lint-ignore-file

function searchfor() {

    let enteredKey = event.key.toUpperCase();

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
            "cs": "KD6DKH",
            "fname": "Fred",
            "lname": "Johnson"
        }

        ]

    // for (const key in theham) {
    //     // if (Object.hasOwnProperty.call(object, key)) {
    //     //  const element = object[key];

    //     //}
    //     console.log(key, theham[key]);
    //     Object.keys(theham);
    // }

    // console.log(hams);
    // console.log(`This is the type of object: ${typeof hams}`)

    //  window.addEventListener('Keydown', (event) => {



    console.log(`${enteredKey}  ${hams[0].cs.toLocaleUpperCase()}`);
    let x = document.getElementById('abc').innerHTML

    selectHam = 'w6ckc';

    alert(hams[2].cs.charAt(0));


    const ham = hams.findIndex((ham) => {
        return ham.cs === selectHam.toUpperCase();
    });
    console.log(ham);
    document.getElementById('abc').innerHTML = `The index of this search is:` + hams[ham].cs;



    const allk = hams.filter(function (value) {
        return value;


    });

    console.log(`this is the return ${hams[1].cs} `);

};

function q() {

    d
}


