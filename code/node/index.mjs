import sendSimpleMessage from "./send.mjs";
import sendSimpleMessageTemplate from "./templates.mjs";

(() => {
  try {
    sendSimpleMessage();
    sendSimpleMessageTemplate();
  } catch (error) {
    console.error(error);
  }
})();
