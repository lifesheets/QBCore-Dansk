const { ref } = Vue

// Customize language for dialog menus and carousels here

const load = Vue.createApp({
  setup () {
    return {
      CarouselText1: 'Hvis du har brug for hjælp eller har et spørgsmål, kan du lave en ticket på vores Discord.',
//      CarouselSubText1: 'Photo captured by: Markyoo#8068',
      CarouselText2: 'Hvis du har et forslag til serveren, kan du sende det i \nserver-forslag kanalen på vores Discord.',
//      CarouselSubText2: 'Photo captured by: ihyajb#9723',
      CarouselText3: 'Hvis du finder en fejl, skal du skrive til Magnus#4917.',
//      CarouselSubText3: 'Photo captured by: FLAPZ[INACTIV]#9925',
//      CarouselText4: 'For additional support please join our community at discord.gg/qbcore',
//      CarouselSubText4: 'Photo captured by: Robinerino#1312',

        DownloadTitle: 'Indlæser...',
        DownloadDesc: "Du er nu på vej ind på DarkRP.\nHusk at læse reglerne.\nHav en god dag.",

      SettingsTitle: 'Indstillinger',
      AudioTrackDesc1: 'Når deaktiveret vil musikken være slået fra.',
      AutoPlayDesc2: 'Når deaktiveret vil den ikke skifte billeder, og vil blive på det sidste billed vist.',
      PlayVideoDesc3: 'Når den er deaktiveret, stopper videoafspilningen og forbliver sat på pause.',

      KeybindTitle: 'Standard Keybinds',
      Keybind1: 'Åben Inventory',
      Keybind2: 'Tale Rækkevidde',
      Keybind3: 'Åben Telefon',
      Keybind4: 'Tag sele på/af',
      Keybind5: 'Åben Target Menu',
      Keybind6: 'Radial Menu',
      Keybind7: 'Åben Hud Menu',
      Keybind8: 'Tal Over Radio',
      Keybind9: 'Åben Scoreboard',
      Keybind10: 'Lås Køretøj',
      Keybind11: 'Slå Motor Til/Fra',
      Keybind12: 'Peg Emote',
      Keybind13: 'Keybind Slots',
      Keybind14: 'Tag Hænder Op',
      Keybind15: 'Brug Item Slots',
      Keybind16: 'Fartpilot',

      firstap: ref(true),
      secondap: ref(true),
      thirdap: ref(true),
      firstslide: ref(1),
      secondslide: ref('1'),
      thirdslide: ref('5'),
      audioplay: ref(true),
      playvideo: ref(true),
      download: ref(true),
      settings: ref(false),
    }
  }
})

load.use(Quasar, { config: {} })
load.mount('#loading-main')

var audio = document.getElementById("audio");
audio.volume = 0.05;

function audiotoggle() {
    var audio = document.getElementById("audio");
    if (audio.paused) {
        audio.play();
    } else {
        audio.pause();
    }
}

function videotoggle() {
    var x = document.getElementById("video");
    if (video.paused) {
        x.play();
    } else {
        x.pause();
    }
}

let count = 0;
let thisCount = 0;

const handlers = {
    startInitFunctionOrder(data) {
        count = data.count;
    },

    initFunctionInvoking(data) {
        document.querySelector(".thingy").style.left = "0%";
        document.querySelector(".thingy").style.width = (data.idx / count) * 100 + "%";
    },

    startDataFileEntries(data) {
        count = data.count;
    },

    performMapLoadFunction(data) {
        ++thisCount;

        document.querySelector(".thingy").style.left = "0%";
        document.querySelector(".thingy").style.width = (thisCount / count) * 100 + "%";
    },
};

window.addEventListener("message", function (e) {
    (handlers[e.data.eventName] || function () {})(e.data);
});
