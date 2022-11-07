// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

require('sidebar-menu')
require('config')
require('bootstrap/bootstrap.min')
// require('datatable/datatables/jquery.dataTables.min')
// require('datatable/datatables/datatable.custom')
// require('datepicker/date-time-picker/moment.min')
require('datepicker/date-picker/datepicker')
require('datepicker/date-picker/datepicker.pt-BR')
require('datepicker/date-picker/datepicker.custom')
// require('form-wizard/form-wizard')
// require('form-wizard/jquery.backstretch.min')
require('select2/select2.full.min')
require('select2/select2-custom')
// require('tooltip-init')
require('script')

import "cocoon-js-vanilla";

window.onload = () => {
  const feather = require('feather-icons')

  feather.replace();
}
