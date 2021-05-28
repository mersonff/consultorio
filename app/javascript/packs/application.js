// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//= require jquery3
//= require popper
//= require select2.full.min
//= require bootstrap

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import "packs/bootstrap"
import $ from 'jquery';
window.jQuery = $;
window.$ = $;
import select2 from 'select2';
import 'select2/dist/css/select2.css';

require('datatables.net-bs4')

Rails.start()
Turbolinks.start()
ActiveStorage.start()

$(document).ready(function() {
    $('.custom-select').select2();
});
