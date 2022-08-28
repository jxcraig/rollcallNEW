// deno-lint-ignore-file
let currentHour = new Date().getHours();

if (currentHour >= 6 && currentHour < 12) {
    console.log('Good Morning');

}

else if (currentHour >= 12 && currentHour < 18) {
    console.log('Good Afternoon');
}

else if (currentHour >= 18) {
    console.log('Good Evening');

}


