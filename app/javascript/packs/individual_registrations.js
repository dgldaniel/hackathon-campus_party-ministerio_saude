document.addEventListener('DOMContentLoaded', () => {
  const currentInputs = Array.from(document.querySelectorAll('input[id^="individual_registration"]'));

  const inputs = currentInputs.reduce((acc, cur) => {
    if (cur.id.includes('attributes')) return { ...acc };

    const splitData = cur.id.split('_');
    const key = splitData[splitData.length - 1]

    return { ...acc, [key]: cur };
  }, {})

  // Dados Gerais
  inputs['statusEhResponsavel'].addEventListener('change', event => {
    if (event.target.checked) {
      inputs['cpfResponsavelFamiliar'].disabled = true;
      inputs['cnsResponsavelFamiliar'].disabled = true;
    } else {
      inputs['cpfResponsavelFamiliar'].disabled = false;
      inputs['cnsResponsavelFamiliar'].disabled = false;
    }
  });

  inputs['stForaArea'].addEventListener('change', event => {
    if (event.target.checked) {
      inputs['microArea'].readOnly = true;
      inputs['microArea'].value = 'FA';
    } else {
      inputs['microArea'].readOnly = false;
      inputs['microArea'].value = '';
    }
  });

  const sexoRadioButton = document.getElementsByName("individual_registration[sexoCidadao]");

  sexoRadioButton.forEach(eachInput => {
    eachInput.addEventListener('change', event => {
      if (event.target.value === "0") {
        inputs['statusEhGestante'].disabled = true;
        inputs['maternidadeDeReferencia'].disabled = true;
      } else {
        inputs['statusEhGestante'].disabled = false;
        inputs['maternidadeDeReferencia'].disabled = false;
      }});
  });

  const racaCorRadioButton = document.getElementsByName("individual_registration[racaCorCidadao]");

  racaCorRadioButton.forEach(eachInput => {
    eachInput.addEventListener('change', event => {
      if (event.target.value !== "5") {
       document.getElementById('individual_registration_etnia').disabled = true;
      } else {
       document.getElementById('individual_registration_etnia').disabled = false;
      }});
  });

  inputs['desconheceNomeMae'].addEventListener('change', event => {
    if (event.target.checked) {
      inputs['nomeMaeCidadao'].disabled = true;
    } else {
      inputs['nomeMaeCidadao'].disabled = false;
    }
  });

  inputs['desconheceNomePai'].addEventListener('change', event => {
    if (event.target.checked) {
      inputs['nomePaiCidadao'].disabled = true;
    } else {
      inputs['nomePaiCidadao'].disabled = false;
    }
  });

  const nacionalidadeRadioButton = document.getElementsByName("individual_registration[nacionalidadeCidadao]");

  nacionalidadeRadioButton.forEach(eachInput => {
    eachInput.addEventListener('change', event => {
      if (event.target.value === "1") {
        inputs['paisNascimento'].readOnly = true;
        inputs['paisNascimento'].value = 'BRASIL';

        inputs['dtNaturalizacao'].disabled = true;
        inputs['dtNaturalizacao'].value = '';

        inputs['portariaNaturalizacao'].disabled = true;
        inputs['portariaNaturalizacao'].value = '';

        inputs['dtEntradaBrasil'].disabled = true;
        inputs['dtEntradaBrasil'].value = '';

        document.getElementById('individual_registration_codigoIbgeMunicipioNascimento').disabled = false;

      } else if (event.target.value === "2") {
        inputs['paisNascimento'].readOnly = false;
        inputs['paisNascimento'].disabled = true;
        inputs['paisNascimento'].value = '';

        inputs['dtNaturalizacao'].disabled = false;
        inputs['portariaNaturalizacao'].disabled = false;

        document.getElementById('individual_registration_codigoIbgeMunicipioNascimento').disabled = true;

        inputs['dtEntradaBrasil'].disabled = true;
        inputs['dtEntradaBrasil'].value = '';
      } else {
        inputs['paisNascimento'].readOnly = false;
        inputs['paisNascimento'].disabled = false;

        inputs['dtNaturalizacao'].disabled = true;
        inputs['dtNaturalizacao'].value = '';

        inputs['portariaNaturalizacao'].disabled = true;
        inputs['portariaNaturalizacao'].value = '';

        document.getElementById('individual_registration_codigoIbgeMunicipioNascimento').disabled = true;

        inputs['dtEntradaBrasil'].disabled = false;
      }});
  });

  inputs['statusMembroPovoComunidadeTradicional'].addEventListener('change', event => {
    if (event.target.checked) {
      inputs['coPovoComunidadeTradicional'].disabled = false;
    } else {
      inputs['coPovoComunidadeTradicional'].disabled = true;
    }
  });

  const orientacaoSexualRadioButton = document.getElementsByName("individual_registration[orientacaoSexualCidadao]");

  inputs['statusDesejaInformarOrientacaoSexual'].addEventListener('change', event => {
    if (event.target.checked) {
      orientacaoSexualRadioButton.forEach((eachInput) => {
        eachInput.disabled = false;
      })
    } else {
      orientacaoSexualRadioButton.forEach((eachInput) => {
        eachInput.disabled = true;
      })
    }
  });

  const deficienciasCidadaoRadioButton = document.getElementsByName("individual_registration[deficienciasCidadao][]");

  inputs['statusTemAlgumaDeficiencia'].addEventListener('change', event => {
    if (event.target.checked) {
      deficienciasCidadaoRadioButton.forEach((eachInput) => {
        eachInput.disabled = false;
      })
    } else {
      deficienciasCidadaoRadioButton.forEach((eachInput) => {
        eachInput.disabled = true;
      })
    }
  });

  inputs['statusEhGestante'].addEventListener('change', event => {
    if (event.target.checked) {
      inputs['maternidadeDeReferencia'].disabled = false;
    } else {
      inputs['maternidadeDeReferencia'].disabled = true;
    }
  });

  const doencaCardiacaRadioButton = document.getElementsByName("individual_registration[doencaCardiaca][]");

  inputs['statusTeveDoencaCardiaca'].addEventListener('change', event => {
    if (event.target.checked) {
      doencaCardiacaRadioButton.forEach((eachInput) => {
        eachInput.disabled = false;
      })
    } else {
      doencaCardiacaRadioButton.forEach((eachInput) => {
        eachInput.disabled = true;
      })
    }
  });

  const doencaRinsRadioButton = document.getElementsByName("individual_registration[doencaRins][]");

  inputs['statusTemTeveDoencasRins'].addEventListener('change', event => {
    if (event.target.checked) {
      doencaRinsRadioButton.forEach((eachInput) => {
        eachInput.disabled = false;
      })
    } else {
      doencaRinsRadioButton.forEach((eachInput) => {
        eachInput.disabled = true;
      })
    }
  });

  const doencaRespiratoriaRadioButton = document.getElementsByName("individual_registration[doencaRespiratoria][]");

  inputs['statusTemDoencaRespiratoria'].addEventListener('change', event => {
    if (event.target.checked) {
      doencaRespiratoriaRadioButton.forEach((eachInput) => {
        eachInput.disabled = false;
      })
    } else {
      doencaRespiratoriaRadioButton.forEach((eachInput) => {
        eachInput.disabled = true;
      })
    }
  });

  inputs['statusTeveInternadoEm12Meses'].addEventListener('change', event => {
    if (event.target.checked) {
      inputs['descricaoCausaInternacaoEm12Meses'].disabled = false;
    } else {
      inputs['descricaoCausaInternacaoEm12Meses'].disabled = true;
    }
  });

  inputs['statusUsaPlantasMedicinais'].addEventListener('change', event => {
    if (event.target.checked) {
      inputs['descricaoPlantasMedicinaisUsadas'].disabled = false;
    } else {
      inputs['descricaoPlantasMedicinaisUsadas'].disabled = true;
    }
  });

  inputs['statusAcompanhadoPorOutraInstituicao'].addEventListener('change', event => {
    if (event.target.checked) {
      inputs['outraInstituicaoQueAcompanha'].disabled = false;
    } else {
      inputs['outraInstituicaoQueAcompanha'].disabled = true;
    }
  });

  inputs['statusVisitaFamiliarFrequentemente'].addEventListener('change', event => {
    if (event.target.checked) {
      inputs['grauParentescoFamiliarFrequentado'].disabled = false;
    } else {
      inputs['grauParentescoFamiliarFrequentado'].disabled = true;
    }
  });

  const higienePessoalRadioButton = document.getElementsByName("individual_registration[higienePessoalSituacaoRua][]");

  inputs['statusTemAcessoHigienePessoalSituacaoRua'].addEventListener('change', event => {
    if (event.target.checked) {
      higienePessoalRadioButton.forEach((eachInput) => {
        eachInput.disabled = false;
      })
    } else {
      higienePessoalRadioButton.forEach((eachInput) => {
        eachInput.disabled = true;
      })
    }
  });

  const inputsFromUnderstading = document.querySelectorAll('div[name="scope-understading"] input');

  inputs['statusSituacaoRua'].addEventListener('change', event => {
    if (event.target.checked) {

      inputsFromUnderstading.forEach((eachInput) => {
        eachInput.disabled = true;
      });
    } else {
      inputsFromUnderstading.forEach((eachInput) => {
        eachInput.disabled = false;
      });
    }
  });

  const inputsFromStatusTerm = document.querySelectorAll('div[name="status-term"] input');

  inputs['statusTermoRecusaCadastroIndividualAtencaoBasica'].addEventListener('change', event => {
    if (event.target.checked) {
      inputsFromStatusTerm.forEach((eachInput) => {
        eachInput.disabled = true;
      });
    } else {
      inputsFromStatusTerm.forEach((eachInput) => {
        eachInput.disabled = false;
      });
    }
  });





});



