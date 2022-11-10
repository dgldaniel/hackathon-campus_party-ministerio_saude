import 'jquery-validation';
const { validateCns } = require('validateCns');

$(document).on('ready page:load turbolinks:load', function() {
  $('#individual_calls').on('cocoon:after-insert', function(e) {
    require('datepicker/date-picker/datepicker')
    require('datepicker/date-picker/datepicker.pt-BR')

    const cnsInputs = $('input[id$="cns"]');

    cnsInputs.each((index, item) => {
      item.addEventListener('blur', (event) => validateCns(event, item))
    })

    const sexoInput = $('input[name$="[sexo]"]');

    sexoInput.each((index, item) => {
      item.addEventListener('change', (event) => {
        const radioButtonValue = event.target.value;

        const [number] = event.target.id.match(/(\d+)/)

        const idadeGestacionalInput = $(`input[id$="${number}_idadeGestacional"]`);
        const stGravidezPlanejadaInput = $(`input[id$="${number}_stGravidezPlanejada"]`);
        const nuGestasPreviasInput = $(`input[id$="${number}_nuGestasPrevias"]`);
        const nuPartosInput = $(`input[id$="${number}_nuPartos"]`);

        if (radioButtonValue === '0') {
          idadeGestacionalInput.attr('value', '')
          stGravidezPlanejadaInput.attr('value', '')
          nuGestasPreviasInput.attr('value', '')
          nuPartosInput.attr('value', '')
        }

        idadeGestacionalInput.attr('disabled', radioButtonValue === '0')
        stGravidezPlanejadaInput.attr('disabled', radioButtonValue === '0')
        nuGestasPreviasInput.attr('disabled', radioButtonValue === '0')
        nuPartosInput.attr('disabled', radioButtonValue === '0')
        }
      )
    })
  });
});
