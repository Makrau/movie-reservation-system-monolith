import consumer from "./consumer"

consumer.subscriptions.create("MoviesChannel", {
  connected() {
    console.log("Conectado ao canal MoviesChannel!");
    console.debug("Debug: Conectado ao canal MoviesChannel");
  },

  disconnected() {
    console.log("Desconectado do canal MoviesChannel");
    console.debug("Debug: Desconectado do canal MoviesChannel");
  },

  received(data) {
    console.log("Dados recebidos no MoviesChannel:", data);
    console.debug("Debug: Dados recebidos no MoviesChannel:", data);
  }
});
