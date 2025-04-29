// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"

console.log("Carregando ActionCable...");

document.addEventListener("turbo:load", () => {
  console.log("Turbo carregado, tentando conectar ao ActionCable...");
});

document.addEventListener("turbo:connect", () => {
  console.log("Turbo conectado ao ActionCable!");
});

document.addEventListener("turbo:disconnect", () => {
  console.log("Turbo desconectado do ActionCable");
});

document.addEventListener("turbo:before-stream-render", (event) => {
  console.log("Antes de renderizar stream:", event);
});

document.addEventListener("turbo:stream-render", (event) => {
  console.log("Stream renderizado:", event);
});
import "./channels"
