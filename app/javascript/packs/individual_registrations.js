const { validateCns } = require('validateCns');
import { cpf } from 'cpf-cnpj-validator';
import moment from 'moment';
import 'jquery-validation';
// import 'jquery-validation/src/localization/messages_pt_BR';

import 'typeahead/handlebbars';
import 'typeahead/typeahead.bundle';

document.addEventListener('DOMContentLoaded', () => {
  const currentInputs = Array.from(document.querySelectorAll('input[id^="individual_registration"]'));

  const inputs = currentInputs.reduce((acc, cur) => {
    if (cur.id.includes('attributes')) return { ...acc };

    const splitData = cur.id.split('_');
    const key = splitData[splitData.length - 1]

    return { ...acc, [key]: cur };
  }, {});

  inputs['cpfCidadao'].addEventListener('input', event => {
    event.target.value = event.target.value.replace(/\D+/g, '')
                                            .replace(/(\d{3})(\d)/, '$1.$2')
                                            .replace(/(\d{3})(\d)/, '$1.$2')
                                            .replace(/(\d{3})(\d{1,2})/, '$1-$2')
                                            .replace(/(-\d{2})\d+?$/, '$1');
  });

  inputs['cpfResponsavelFamiliar'].addEventListener('input', event => {
    event.target.value = event.target.value.replace(/\D+/g, '')
                                            .replace(/(\d{3})(\d)/, '$1.$2')
                                            .replace(/(\d{3})(\d)/, '$1.$2')
                                            .replace(/(\d{3})(\d{1,2})/, '$1-$2')
                                            .replace(/(-\d{2})\d+?$/, '$1');
  });

  inputs['numeroNisPisPasep'].addEventListener('input', event => {
    event.target.value = event.target.value.replace(/\D+/g, '')
                                            .replace(/(\d{3})(\d)/, '$1.$2')
                                            .replace(/(\d{5})(\d)/, '$1.$2')
                                            .replace(/(\d{5}\.)(\d{2})(\d)/, '$1$2-$3')
                                            .replace(/(-\d)\d+?$/, '$1')
  });

  inputs['telefoneCelular'].addEventListener('input', event => {
    event.target.value = event.target.value.replace(/\D+/g, '')
                                            .replace(/(\d{2})(\d)/, '($1) $2')
                                            .replace(/(\d{4})(\d)/, '$1-$2')
                                            .replace(/(\d{4})-(\d)(\d{4})/, '$1$2-$3')
                                            .replace(/(-\d{4})\d+?$/, '$1')
  });

  inputs['cpfCidadao'].addEventListener('blur', event => {
    const isValidCPF = cpf.isValid(event.target.value);

    if (isValidCPF) {
      event.target.classList.remove('is-invalid')
      event.target.classList.add('is-valid')
    } else {
      event.target.classList.add('is-invalid')
      event.target.classList.remove('is-valid')
    }
  });

  inputs['cpfResponsavelFamiliar'].addEventListener('blur', event => {
    const isValidCPF = cpf.isValid(event.target.value);

    if (isValidCPF) {
      event.target.classList.remove('is-invalid')
      event.target.classList.add('is-valid')
    } else {
      event.target.classList.add('is-invalid')
      event.target.classList.remove('is-valid')
    }
  });

  inputs['cnsCidadao'].addEventListener('blur', (event) => validateCns(event, inputs['cnsCidadao']))
  inputs['cnsResponsavelFamiliar'].addEventListener('blur', (event) => validateCns(event, inputs['cnsResponsavelFamiliar']))

  const relacaoParentescoRadioButton = document.getElementsByName("individual_registration[relacaoParentescoCidadao]");

  function managerStatusEhResponsavel(checked) {
    inputs['cpfResponsavelFamiliar'].disabled = checked;
    inputs['cnsResponsavelFamiliar'].disabled = checked;

    if (checked) {
      inputs['cpfResponsavelFamiliar'].classList.remove('is-invalid')
      inputs['cpfResponsavelFamiliar'].classList.remove('is-invalid')
      inputs['cnsResponsavelFamiliar'].classList.remove('is-valid')
      inputs['cnsResponsavelFamiliar'].classList.remove('is-valid')
    }

    relacaoParentescoRadioButton.forEach((eachInput) => {
      eachInput.disabled = checked;
    });
  }

  managerStatusEhResponsavel(inputs['statusEhResponsavel'].checked);

  inputs['statusEhResponsavel'].addEventListener('change', event => {
    managerStatusEhResponsavel(event.target.checked)
  });

  function managerStForaArea(checked) {
    inputs['microArea'].readOnly = checked;
    inputs['microArea'].value = checked ? 'FA' : '';
  }

  managerStForaArea(inputs['stForaArea'].checked);

  inputs['stForaArea'].addEventListener('change', event => {
    managerStForaArea(event.target.checked);
  });

  const sexoRadioButton = document.getElementsByName("individual_registration[sexoCidadao]");

  function managerSexoOptions(value) {
    inputs['statusEhGestante'].disabled = value === '0';
    inputs['maternidadeDeReferencia'].disabled = value === '0';
  }

  sexoRadioButton.forEach(eachInput => {
    managerSexoOptions(eachInput.value);

    eachInput.addEventListener('change', event => {
      managerSexoOptions(event.target.value);
    });
  });

  const racaCorRadioButton = document.getElementsByName("individual_registration[racaCorCidadao]");

  function managerRacaCor(value) {
    document.getElementById('individual_registration_etnia').disabled = value !== "5";
  }

  racaCorRadioButton.forEach(eachInput => {
    managerRacaCor(eachInput.value);

    eachInput.addEventListener('change', event => {
      managerRacaCor(event.target.value)
    });
  });

  function managerDesconheceNomeMae(checked) {
    inputs['nomeMaeCidadao'].disabled = checked;
  }

  managerDesconheceNomeMae(inputs['nomeMaeCidadao'].checked)

  inputs['desconheceNomeMae'].addEventListener('change', event => {
    managerDesconheceNomeMae(event.target.checked);
  });

  function managerDesconheceNomePai(checked) {
    inputs['nomePaiCidadao'].disabled = checked;
  }

  managerDesconheceNomePai(inputs['nomePaiCidadao'].checked)

  inputs['desconheceNomePai'].addEventListener('change', event => {
    managerDesconheceNomePai(event.target.checked)
  });

  const nacionalidadeRadioButton = document.getElementsByName("individual_registration[nacionalidadeCidadao]");

  function managerNacionalidade(value) {
    if (value === "1") {
      inputs['paisNascimento'].readOnly = true;
      inputs['paisNascimento'].value = 'BRASIL';

      inputs['dtNaturalizacao'].disabled = true;
      inputs['dtNaturalizacao'].value = '';

      inputs['portariaNaturalizacao'].disabled = true;
      inputs['portariaNaturalizacao'].value = '';

      inputs['dtEntradaBrasil'].disabled = true;
      inputs['dtEntradaBrasil'].value = '';

      document.getElementById('individual_registration_codigoIbgeMunicipioNascimento').disabled = false;

    } else if (value === "2") {
      inputs['paisNascimento'].readOnly = false;
      inputs['paisNascimento'].disabled = true;
      inputs['paisNascimento'].value = '';

      inputs['dtNaturalizacao'].disabled = false;
      inputs['portariaNaturalizacao'].disabled = false;

      document.getElementById('individual_registration_codigoIbgeMunicipioNascimento').disabled = true;

      inputs['dtEntradaBrasil'].disabled = true;
      inputs['dtEntradaBrasil'].value = '';
    } else if (value === "3") {
      inputs['paisNascimento'].readOnly = false;
      inputs['paisNascimento'].disabled = false;

      inputs['dtNaturalizacao'].disabled = true;
      inputs['dtNaturalizacao'].value = '';

      inputs['portariaNaturalizacao'].disabled = true;
      inputs['portariaNaturalizacao'].value = '';

      document.getElementById('individual_registration_codigoIbgeMunicipioNascimento').disabled = true;

      inputs['dtEntradaBrasil'].disabled = false;
    }
  }

  nacionalidadeRadioButton.forEach(eachInput => {
    managerNacionalidade(eachInput.value);

    eachInput.addEventListener('click', event => {
      managerNacionalidade(event.target.value);
    });
  });

  function managerStatusMembroPovoComunidadeTradicional(checked) {
    inputs['coPovoComunidadeTradicional'].disabled = !checked;
  }

  managerStatusMembroPovoComunidadeTradicional(inputs['statusMembroPovoComunidadeTradicional'].checked)

  inputs['statusMembroPovoComunidadeTradicional'].addEventListener('change', event => {
    managerStatusMembroPovoComunidadeTradicional(event.target.checked)
  });

  const orientacaoSexualRadioButton = document.getElementsByName("individual_registration[orientacaoSexualCidadao]");

  function managerStatusDesejaInformarOrientacaoSexual(checked) {
    orientacaoSexualRadioButton.forEach((eachInput) => {
      eachInput.disabled = !checked;
    })
  }

  managerStatusDesejaInformarOrientacaoSexual(inputs['statusDesejaInformarOrientacaoSexual'].checked)

  inputs['statusDesejaInformarOrientacaoSexual'].addEventListener('change', event => {
    managerStatusDesejaInformarOrientacaoSexual(event.target.checked);
  });

  const deficienciasCidadaoRadioButton = document.getElementsByName("individual_registration[deficienciasCidadao][]");

  function managerDeficienciasCidadao(checked) {
    deficienciasCidadaoRadioButton.forEach((eachInput) => {
      eachInput.disabled = !checked;
    })
  }

  managerDeficienciasCidadao(inputs['statusTemAlgumaDeficiencia'].checked)

  inputs['statusTemAlgumaDeficiencia'].addEventListener('change', event => {
    managerDeficienciasCidadao(event.target.checked)
  });

  function managerStatusEhGestante(checked) {
    inputs['maternidadeDeReferencia'].disabled = !checked;
  }

  managerStatusEhGestante(inputs['statusEhGestante'].checked)

  inputs['statusEhGestante'].addEventListener('change', event => {
    managerStatusEhGestante(event.target.checked);
  });

  const doencaCardiacaRadioButton = document.getElementsByName("individual_registration[doencaCardiaca][]");

  function managerDoencaCardiaca(checked) {
    doencaCardiacaRadioButton.forEach((eachInput) => {
      eachInput.disabled = !checked;
    })
  }

  managerDoencaCardiaca(inputs['statusTeveDoencaCardiaca'].checked)

  inputs['statusTeveDoencaCardiaca'].addEventListener('change', event => {
    managerDoencaCardiaca(event.target.checked);
  });

  const doencaRinsRadioButton = document.getElementsByName("individual_registration[doencaRins][]");

  function managerDoencaRins(checked) {
    doencaRinsRadioButton.forEach((eachInput) => {
      eachInput.disabled = !checked;
    })
  }

  managerDoencaRins(inputs['statusTemTeveDoencasRins'].checked)

  inputs['statusTemTeveDoencasRins'].addEventListener('change', event => {
    managerDoencaRins(event.target.checked);
  });

  const doencaRespiratoriaRadioButton = document.getElementsByName("individual_registration[doencaRespiratoria][]");

  function managerDoencaRespiratoria(checked) {
    doencaRespiratoriaRadioButton.forEach((eachInput) => {
      eachInput.disabled = !checked;
    })
  }

  managerDoencaRespiratoria(inputs['statusTemDoencaRespiratoria'].checked)

  inputs['statusTemDoencaRespiratoria'].addEventListener('change', event => {
    managerDoencaRespiratoria(event.target.checked);
  });

  function managerStatusTeveInternadoEm12Meses(checked) {
    inputs['descricaoCausaInternacaoEm12Meses'].disabled = !checked;
  }

  managerStatusTeveInternadoEm12Meses(inputs['statusTeveInternadoEm12Meses'].checked)

  inputs['statusTeveInternadoEm12Meses'].addEventListener('change', event => {
    managerStatusTeveInternadoEm12Meses(event.target.checked)
  });

  function managerStatusUsaPlantasMedicinais(checked) {
    inputs['descricaoPlantasMedicinaisUsadas'].disabled = !checked;
  }

  managerStatusUsaPlantasMedicinais(inputs['statusUsaPlantasMedicinais'].checked)

  inputs['statusUsaPlantasMedicinais'].addEventListener('change', event => {
    managerStatusUsaPlantasMedicinais(event.target.checked)
  });


  const inputsFromUnderstading = document.querySelectorAll('div[name="scope-understading"] input');

  function managerStatusSituacaoRua(checked) {
    inputsFromUnderstading.forEach((eachInput) => {
      eachInput.disabled = !checked;
    });

    function managerStatusAcompanhadoPorOutraInstituicao(checked) {
      inputs['outraInstituicaoQueAcompanha'].disabled = !checked;
    }

    managerStatusAcompanhadoPorOutraInstituicao(inputs['statusAcompanhadoPorOutraInstituicao'].checked)

    inputs['statusAcompanhadoPorOutraInstituicao'].addEventListener('change', event => {
      managerStatusAcompanhadoPorOutraInstituicao(event.target.checked);
    });

    function managerStatusVisitaFamiliarFrequentemente(checked) {
      inputs['grauParentescoFamiliarFrequentado'].disabled = !checked;
    }

    managerStatusVisitaFamiliarFrequentemente(inputs['statusVisitaFamiliarFrequentemente'].checked)

    inputs['statusVisitaFamiliarFrequentemente'].addEventListener('change', event => {
      managerStatusVisitaFamiliarFrequentemente(event.target.checked);
    });

    const higienePessoalRadioButton = document.getElementsByName("individual_registration[higienePessoalSituacaoRua][]");

    function managerStatusTemAcessoHigienePessoalSituacaoRua(checked) {
      higienePessoalRadioButton.forEach((eachInput) => {
        eachInput.disabled = !checked;
      })
    }

    managerStatusTemAcessoHigienePessoalSituacaoRua(inputs['statusTemAcessoHigienePessoalSituacaoRua'].checked)

    inputs['statusTemAcessoHigienePessoalSituacaoRua'].addEventListener('change', event => {
      managerStatusTemAcessoHigienePessoalSituacaoRua(event.target.checked);
    });
  }

  managerStatusSituacaoRua(inputs['statusSituacaoRua'].checked)

  inputs['statusSituacaoRua'].addEventListener('change', event => {
    managerStatusSituacaoRua(event.target.checked);
  });

  // const inputsFromStatusTerm = document.querySelectorAll('div[name="status-term"] input');

  // function managerStatusTermoRecusaCadastroIndividualAtencaoBasica(checked) {
  //   inputsFromStatusTerm.forEach((eachInput) => {
  //     eachInput.setAttribute('disabled', !checked)
  //   });
  // }

  // managerStatusTermoRecusaCadastroIndividualAtencaoBasica(inputs['statusTermoRecusaCadastroIndividualAtencaoBasica'].checked)

  // inputs['statusTermoRecusaCadastroIndividualAtencaoBasica'].addEventListener('change', event => {
  //   managerStatusTermoRecusaCadastroIndividualAtencaoBasica(event.target.checked)
  // });
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

  jQuery.validator.addMethod("validDate", function(value) {
    console.log(value)
    return moment(value, 'DD-MM-YYYY', true).isValid();
}, "must be valid date");

  $("#individual_registration_form").validate({
    rules: {
      'individual_registration[cpfCidadao]': {
        required: true,
      },
      'individual_registration[cnsCidadao]': {
        required: true,
      },
      'individual_registration[cpfResponsavelFamiliar]': {
        required: {
          depends: function() {
            return $("#individual_registration_statusEhResponsavel").is(':checked');
          }
        },
      },
      'individual_registration[cnsResponsavelFamiliar]': {
        required: {
          depends: function() {
            return $("#individual_registration_statusEhResponsavel").is(':checked');
          }
        },
      },
      'individual_registration[nomeCidadao]': {
        required: true,
      },
      'individual_registration[dataNascimentoCidadao]': {
        required: true,
      },
      'individual_registration[nomeMaeCidadao]': {
        required: {
          depends: function() {
            return !$("#individual_registration_desconheceNomeMae").is(':checked');
          }
        },
      },
      'individual_registration[nomePaiCidadao]': {
        required: {
          depends: function() {
            return !$("#iindividual_registration_desconheceNomePai").is(':checked');
          }
        },
      },
      'individual_registration[codigoIbgeMunicipioNascimento]': {
        required: {
          depends: function() {
            return $("#individual_registration_nacionalidadeCidadao_1").is(':checked');
          }
        },
      },
      'individual_registration[dtNaturalizacao]': {
        required: {
          depends: function() {
            return $("#individual_registration_nacionalidadeCidadao_2").is(':checked');
          }
        },
      },
      'individual_registration[portariaNaturalizacao]': {
        required: {
          depends: function() {
            return $("#individual_registration_nacionalidadeCidadao_2").is(':checked');
          }
        },
      },
      'individual_registration[paisNascimento]': {
        required: {
          depends: function() {
            return $("#individual_registration_nacionalidadeCidadao_3").is(':checked');
          }
        },
      },
      'individual_registration[dtEntradaBrasil]': {
        required: {
          depends: function() {
            return $("#individual_registration_nacionalidadeCidadao_3").is(':checked');
          }
        },
      },
      'individual_registration[telefoneCelular]': {
        required: true,
      },
      'individual_registration[coPovoComunidadeTradicional]': {
        required: {
          depends: function() {
            return $("#individual_registration_statusMembroPovoComunidadeTradicional").is(':checked');
          }
        },
      },
      'individual_registration[maternidadeDeReferencia]': {
        required: {
          depends: function() {
            return $("#individual_registration_statusEhGestante").is(':checked');
          }
        },
      },
      'individual_registration[descricaoCausaInternacaoEm12Meses]': {
        required: {
          depends: function() {
            return $("#individual_registration_statusTeveInternadoEm12Meses").is(':checked');
          }
        },
      },
      'individual_registration[descricaoPlantasMedicinaisUsadas]': {
        required: {
          depends: function() {
            return $("#individual_registration_statusUsaPlantasMedicinais").is(':checked');
          }
        },
      },
      'individual_registration[outraInstituicaoQueAcompanha]': {
        required: {
          depends: function() {
            return $("#individual_registration_statusAcompanhadoPorOutraInstituicao").is(':checked');
          }
        },
      },
      'individual_registration[grauParentescoFamiliarFrequentado]': {
        required: {
          depends: function() {
            return $("#individual_registration_statusVisitaFamiliarFrequentemente").is(':checked');
          }
        },
      },
    }
  });
});
