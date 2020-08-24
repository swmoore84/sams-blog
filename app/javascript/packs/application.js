require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

import "bootstrap";
import "../plugins/flatpickr";
import { initFlatPicker } from '../plugins/flatpickr';

document.addEventListener('turbolinks:load', () => {
  // Call your functions here, e.g:
  // initSelect2();
  initFlatPicker();
});
