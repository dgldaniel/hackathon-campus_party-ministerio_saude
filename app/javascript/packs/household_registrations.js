import "@nathanvda/cocoon";
import 'jquery-validation';

document.addEventListener('DOMContentLoaded', () => {
  const currentInputs = Array.from(document.querySelectorAll('input[id^="household_registration"]'));

  const inputs = currentInputs.reduce((acc, cur) => {
    if (cur.id.includes('attributes')) return { ...acc };

    const splitData = cur.id.split('_');
    const key = splitData[splitData.length - 1]

    return { ...acc, [key]: cur };
  }, {});

  function managerStSemNumero(checked) {
    inputs['numero'].disabled = checked;
  }

  inputs['stSemNumero'].addEventListener('change', event => {
    managerStSemNumero(event.target.checked);
  });

  const localizacaoButton = document.getElementsByName("household_registration[localizacao]");
  const areaRuralButton = document.getElementsByName("household_registration[areaProducaoRural]");

  function managerLocalization(value) {
    areaRuralButton.forEach(eachAreaRuralInput => {
      eachAreaRuralInput.disabled = value === '83';
    })
  }

  localizacaoButton.forEach((eachLocalizaoInput) => {
    managerLocalization(eachLocalizaoInput.value)

    eachLocalizaoInput.addEventListener('change', event => {
      managerLocalization(event.target.value);
    });
  });

  const animaisDomicilioOptions = document.getElementsByName("household_registration[animaisNoDomicilio][]");

  function managerStAnimaisNoDomicilio(checked) {
    inputs['quantosAnimaisNoDomicilio'].disabled = checked;

      animaisDomicilioOptions.forEach(eachInput => {
        eachInput.disabled = checked;
      })
  }

  managerStAnimaisNoDomicilio(inputs['stAnimaisNoDomicilio'].checked)

  inputs['stAnimaisNoDomicilio'].addEventListener('change', event => {
    managerStAnimaisNoDomicilio(event.target.checked);
  });
});

$(function() {
  $.validator.setDefaults({
    onkeyup: false,
    highlight: function (element) {
        jQuery(element).closest('.form-control').addClass('is-invalid');
    },
    unhighlight: function (element) {
        jQuery(element).closest('.form-control').removeClass('is-invalid');
        // jQuery(element).closest('.form-control').addClass('is-valid');
    },
    errorElement: 'div',
    errorClass: 'invalid-feedback',
    errorPlacement: function (error, element) {
        if (element.parent('.input-group-prepend').length) {
            $(element).siblings(".invalid-feedback").append(error);
            //error.insertAfter(element.parent());
        } else {
            error.insertAfter(element);
        }
      },
  });

  $("#household_registration_form").validate({
    rules: {
      'household_registration[cep]': {
        required: true,
      },
      'household_registration[codigoIbgeMunicipio]': {
        required: true,
      },
      'household_registration[numeroDneUf]': {
        required: true,
      },
      'household_registration[bairro]': {
        required: true,
      },
      'household_registration[tipoLogradouroNumeroDne]': {
        required: true,
      },
      'household_registration[nomeLogradouro]': {
        required: true,
      },
      'household_registration[numero]': {
        required: {
          depends: function() {
            return !$("#household_registration_stSemNumero").is(':checked');
          }
        },
      },
    }
  });
});
