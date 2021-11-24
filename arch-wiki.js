"use strict";
const $ = (query) => document.querySelector(query);

const $li = () => document.createElement("li");
const $button = () => document.createElement("button");

const lang = "en";

const t = {
  en: {
    dark: "Dark",
    light: "Light",
  },
  es: {
    dark: "Oscuro",
    light: "Claro",
  },
};

const State = () => {
  let theme = false;

  const setTheme = (value) => (theme = value);

  return () => ({
    theme,
    setTheme,
  });
};

const state = State();

const buttonTheme = $button();

const buildButtonTheme = () => {
  buttonTheme.classList.add("toggle-theme");

  if (state().theme) buttonTheme.innerText = t[lang].dark;
  else buttonTheme.innerText = t[lang].light;
};

buildButtonTheme();

const liTheme = $li();

const buildLiTheme = () => {
  liTheme.classList.add("pt-theme");

  liTheme.appendChild(buttonTheme);
};

buildLiTheme();

const menuListEl = $(".vector-menu-content-list");

menuListEl.appendChild(liTheme);
