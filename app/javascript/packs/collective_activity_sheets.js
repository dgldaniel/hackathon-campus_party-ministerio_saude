import "@nathanvda/cocoon";
import 'jquery-validation';

const { validateCns } = require('validateCns');

document.addEventListener('DOMContentLoaded', () => {
  const tipoAtividadeOptions = document.getElementsByName("collective_activity_sheet[atividadeTipo]");
  const temasReuniaoOptions = document.getElementsByName("collective_activity_sheet[temasParaReuniao][]");
  const publicAlvoOptions = document.getElementsByName("collective_activity_sheet[publicoAlvo][]");
  const praticasTemasSaudeOptions = document.getElementsByName("collective_activity_sheet[praticasTemasParaSaude][]");

  const cessouHabitoFumarInput = document.getElementById('collective_activity_sheet_participants_attributes_0_cessouHabitoFumar')
  const abandonouGrupoInput = document.getElementById('collective_activity_sheet_participants_attributes_0_abandonouGrupo')

  tipoAtividadeOptions.forEach(eachInput => {
    eachInput.addEventListener('change', event => {
      if (['1', '2', '3'].includes(event.target.value)) {
        temasReuniaoOptions.forEach(eachInput => {
          eachInput.disabled = false;
        })
      } else {
        temasReuniaoOptions.forEach(eachInput => {
          eachInput.disabled = true;
        })

      }
    });
  });

  tipoAtividadeOptions.forEach(eachInput => {
    eachInput.addEventListener('change', event => {
      if (['4', '5', '6', '7'].includes(event.target.value)) {
        publicAlvoOptions.forEach(eachInput => {
          eachInput.disabled = false;
        })
      } else {
        publicAlvoOptions.forEach(eachInput => {
          eachInput.disabled = true;
        })

      }
    });
  });

  tipoAtividadeOptions.forEach(eachInput => {
    eachInput.addEventListener('change', event => {
      if (['4', '5', '6', '7'].includes(event.target.value)) {
        praticasTemasSaudeOptions.forEach(eachInput => {
          eachInput.disabled = false;
        })
      } else {
        praticasTemasSaudeOptions.forEach(eachInput => {
          eachInput.disabled = true;
        })
      }
    });
  });

  praticasTemasSaudeOptions.forEach(eachInput => {
    eachInput.addEventListener('change', event => {
      if (['25', '26', '27', '28'].includes(event.target.value)) {
        cessouHabitoFumarInput.disabled = true;
        abandonouGrupoInput.disabled = true;
      } else {
        cessouHabitoFumarInput.disabled = false;
        abandonouGrupoInput.disabled = false;
      }
    });
  });

  const inputCnsProfessional = document.getElementById('collective_activity_sheet_professionals_attributes_0_cnsProfissional');

  inputCnsProfessional.onblur = (event) => {
    validateCns(event, inputCnsProfessional)
  }

  const addProfessionaButton = document.getElementById('add-professional-button')

  addProfessionaButton.addEventListener('click', event => {
    // const currentInputs = Array.from(document.querySelectorAll('input[id^="collective_activity_sheet_professionals_attributes"]'));

    // console.log(currentInputs)
  })
});

$(function() {
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
      if (element.prop( "type" ) === "radio" || element.prop( "type" ) === "checkbox" ) {
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

  $.validator.addClassRules('required', {
    required: true,
  });

  $("#collective_activity_sheet_form").validate({
    rules: {
      'collective_activity_sheet[atividadeTipo]': {
        required: true
      },
      'collective_activity_sheet[temasParaReuniao][]': {
        required: {
          depends: function() {
            const radioValue = $("input[name='collective_activity_sheet[atividadeTipo]']:checked").val();

            return ['1', '2', '3'].includes(radioValue)
          }
        },
      },
      'collective_activity_sheet[codigoIbgeMunicipio]': {
        required: true
      }
    }
  });

  $('#professionals')
  .on('cocoon:after-insert', function() {
    console.log('aqui')
  })
});
