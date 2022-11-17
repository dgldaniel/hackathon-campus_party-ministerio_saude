import 'jquery-validation';

const { validateCns } = require('validateCns');

document.addEventListener('turbolinks:load', () => {
  const $cnsInput = document.getElementById('user_doctor_attributes_profissionalCNS');

  $cnsInput.addEventListener('blur', (event) => validateCns(event, $cnsInput))

  $.validator.addClassRules('required', {
    required: true,
  });

  jQuery.validator.addMethod("validDate", function(value) {
    return moment(value, 'DD-MM-YYYY', true).isValid();
  }, "must be valid date");

  $.validator.setDefaults({
    onkeyup: false,
    highlight: function (element) {
        jQuery(element).closest('.form-control').addClass('is-invalid');
    },
    unhighlight: function (element) {
        jQuery(element).closest('.form-control').removeClass('is-invalid');
    },
    errorElement: 'div',
    errorClass: 'invalid-feedback',
    errorPlacement: function (error, element) {
      if (element.prop("type") === "radio" || element.prop("type") === "checkbox" ) {
        error.appendTo(element.closest('.mb-3'));

        return;
      }

      if (element.prop("tagName") === 'SELECT') {
        error.appendTo(element.closest('.mb-3'));

        return;
      }

      if (element.parent('.input-group-prepend').length) {
          $(element).siblings(".invalid-feedback").append(error);
          //error.insertAfter(element.parent());
        } else {
            error.insertAfter(element);
        }
      },
  });

  $("#doctor_form").validate({
    rules: {
      'user[doctor_attributes][profissionalCNS]':  {
        required: true,
      },
      'user[doctor_attributes][cboCodigo_2002]': {
        required: true
      },
      'user[doctor_attributes][cnes]': {
        required: true
      },
      'user[doctor_attributes][ine]': {
        required: true
      },
      'user[doctor_attributes][codigoIbgeMunicipio]': {
        required: true
      },
      'user[email]': {
        required: true
      },
      'user[password]': {
        required: true
      },
      'user[password_confirmation]': {
        required: true
      }
    }
  });
});
