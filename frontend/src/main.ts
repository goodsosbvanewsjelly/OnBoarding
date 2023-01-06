import { createApp } from "vue";
import router from "./router";
import App from "./App.vue";
// GA
import VueGtag from "vue-gtag-next";

import "./assets/css/style.css";
import "./assets/css/modern-normalize.min.css";

const app = createApp(App);

app
  .use(VueGtag, {
    property: { id: "G-Y0ED7GGKGN" },
  })
  .use(router)
  .mount("#app");
