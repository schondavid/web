// 9x28
let TEXT = [
  [
    "                            ",
    "                            ",
    "                            ",
    "                            ",
    "                            ",
    "                            ",
    "                            ",
    "                            ",
    "                            ",
  ],
  [
    "XXXXXXXX  XXXXXXXX  XXXXXXXX",
    "XXXXXXXX  XXXXXXXX  XXXXXXXX",
    "XXX          XX     XXX     ",
    "XXX          XX     XXXXXXXX",
    "XXX          XX     XXXXXXXX",
    "XXX          XX     XXX     ",
    "XXX          XX     XXX     ",
    "XXXXXXXX     XX     XXX     ",
    "XXXXXXXX     XX     XXX     ",
  ],
  [
    "                            ",
    "                            ",
    "                            ",
    "                            ",
    "                            ",
    "                            ",
    "                            ",
    "                            ",
    "                            ",
  ],
  [
    "XXXXXXXX     xx     XX    XX",
    "XXXXXXXX    xxxx    XX    XX",
    "XXX        xx  xx   XX    XX",
    "XXXXXXXX  xx    xx  XX    XX",
    "XXXXXXXX  xxxxxxxx  XX    XX",
    "XXX       xxxxxxxx  XX    XX",
    "XXX       xx    xx  XX    XX",
    "XXX       xx    xx  XXXXXXXX",
    "XXX       xx    xx  XXXXXXXX",
  ],
];

const CHARS = '0123456789ABCDEF';

const PERIOD_MS = 6000;
const PEAK_MS = PERIOD_MS / 2;
const START = Date.now() + PEAK_MS;

function randomizeChars(){
    for (let i = 0; i< TEXT.length; i++){
        TEXT[i] = TEXT[i].join("").split("").map((c) => c == " " ? " " : randomChar()).join("").match(/.{1,28}/g)
    }
}

function blip(t) {
  return Math.exp(-(((t - PEAK_MS) / 800) ** 2)) ** 2;
}

function randomChar() {
  return CHARS[Math.floor(Math.random() * CHARS.length)];
}

function refresh() {
  const t = Date.now() - START;
  const scale = blip((t + PEAK_MS) % PERIOD_MS);
  const word = TEXT[Math.floor(((t / PERIOD_MS+1) % (TEXT.length)))];
  const nodes = document.getElementsByClassName("row");

  for (let i = 0; i < word.length; i++) {
    const node = nodes[i];
    const row = word[i].split("");
    for (let c = 0; c < row.length; c++) {
      const offset = (node.innerText[c] === " ") + (row[c] === " ");
      if (Math.random() < scale - offset / 5) {
        row[c] = randomChar();
      }
    }

    node.innerText = row.join("");
  }
}

function main() {
    randomizeChars();
    setInterval(refresh, 50);
}

main();
