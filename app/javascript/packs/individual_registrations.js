function handleDisabledInputTextByInputCheckbox(inputText, inputCheckbox) {
  inputCheckbox.addEventListener('change', event => {
    if (event.target.checked) {
      inputText.disabled = false;
      inputText.attributes["required"] = "";
    } else {
      inputText.disabled = true
      inputText.removeAttribute("required")
    }
  })
}

function handleDisabledInputTextByInputCheckboxInverse(inputText, inputCheckbox) {
  inputCheckbox.addEventListener('change', event => {
    if (!event.target.checked) {
      inputText.disabled = false;
      inputText.attributes["required"] = "";
    } else {
      inputText.disabled = true
      inputText.removeAttribute("required")
    }
  })
}

function handleDisplayOptionsByInputCheckbox(containerDiv, inputCheckbox) {
  inputCheckbox.addEventListener('change', event => {
    if (event.target.checked) {
      containerDiv.style.display = 'block'
    } else {
      containerDiv.style.display = 'none'
    }
  })

}

function handleDisplayContainerByInputCheckbox(containerDivs, inputCheckbox) {
  inputCheckbox.addEventListener('change', event => {
    if (event.target.checked) {
      containerDivs.forEach(eachDiv => {
        eachDiv.style.display = 'block'
      })
    } else {
      containerDivs.forEach(eachDiv => {
        eachDiv.style.display = 'none'
      })
    }
  })

}

function showSelectedOnNacionalidade() {
  const $containerCodigoIbgeMunicipioNascimento = document.getElementById('container-codigoIbgeMunicipioNascimento')
  const $containerpaisNascimento = document.getElementById('container-paisNascimento')

  if (this.value === '1') {
    $containerCodigoIbgeMunicipioNascimento.style.display = 'block';
    $containerpaisNascimento.style.display = 'none';
  } else {
    $containerCodigoIbgeMunicipioNascimento.style.display = 'none';
    $containerpaisNascimento.style.display = 'block';
  }
}

function calculateAge(inputText) {
  inputText.addEventListener('blur', event => {
    if (!event.target.value) return;

    birthDate = new Date(event.target.value);
    otherDate = new Date();

    var years = (otherDate.getFullYear() - birthDate.getFullYear());

    if (otherDate.getMonth() < birthDate.getMonth() ||
        otherDate.getMonth() == birthDate.getMonth() && otherDate.getDate() < birthDate.getDate()) {
        years--;
    }

    if (years < 130) {
      inputText.classList.add('is-valid')
      inputText.classList.remove('is-invalid')
    } else {
      inputText.classList.add('is-invalid')
      inputText.classList.remove('is-valid')
    }
  })
}


document.addEventListener('DOMContentLoaded', () => {
  // CondicoesDeSaude

  const $statusTeveInternadoem12MesesInput = document.getElementById('individual_registration_statusTeveInternadoEm12Meses')
  const $descricaoCausaInternacaoEm12MesessInput = document.getElementById('individual_registration_descricaoCausaInternacaoEm12Meses')
  const $descricaoPlantasMedicinaisUsadasInput = document.getElementById('individual_registration_descricaoPlantasMedicinaisUsadas')
  const $statusUsaPlantasMedicinaisInput = document.getElementById('individual_registration_statusUsaPlantasMedicinais')
  const $statusTeveDoencaCardiacaInput = document.getElementById('individual_registration_statusTeveDoencaCardiaca')
  const $statusTemDoencaRespiratoriaInput = document.getElementById('individual_registration_statusTemDoencaRespiratoria')
  const $statusTemTeveDoencasRinsInput = document.getElementById('individual_registration_statusTemTeveDoencasRins')
  const $maternidadeDeReferenciaInput = document.getElementById('individual_registration_maternidadeDeReferencia')
  const $statusEhGestanteInput = document.getElementById('individual_registration_statusEhGestante')

  const $doencaCardiacaOptions = document.getElementById('doencaCardiaca-options');
  const $doencaRespiratoriaOptions = document.getElementById('doencaRespiratoria-options');
  const $doencaRinsOptions = document.getElementById('doencaRins-options');

  handleDisabledInputTextByInputCheckbox($descricaoCausaInternacaoEm12MesessInput, $statusTeveInternadoem12MesesInput)
  handleDisabledInputTextByInputCheckbox($descricaoPlantasMedicinaisUsadasInput, $statusUsaPlantasMedicinaisInput)
  handleDisabledInputTextByInputCheckbox($maternidadeDeReferenciaInput, $statusEhGestanteInput)

  handleDisplayOptionsByInputCheckbox($doencaCardiacaOptions, $statusTeveDoencaCardiacaInput)
  handleDisplayOptionsByInputCheckbox($doencaRespiratoriaOptions,  $statusTemDoencaRespiratoriaInput)
  handleDisplayOptionsByInputCheckbox($doencaRinsOptions, $statusTemTeveDoencasRinsInput)

  // Dados Gerais
  const $nacionalidadeCidadaoInput = document.querySelectorAll('input[name="individual_registration[nacionalidadeCidadao]"]');

  const $nomeMaeCidadao = document.getElementById('individual_registration_nomeMaeCidadao')
  const $desconheceNomeMae = document.getElementById('individual_registration_desconheceNomeMae')
  const $nomePaiCidadao = document.getElementById('individual_registration_nomePaiCidadao')
  const $desconheceNomePai = document.getElementById('individual_registration_desconheceNomePai')
  const $numeroCartaoSusResponsavel = document.getElementById('individual_registration_numeroCartaoSusResponsavel')
  const $statusEhResponsavel = document.getElementById('individual_registration_statusEhResponsavel')
  const $dataNascimentoResponsavel = document.getElementById('individual_registration_dataNascimentoResponsavel')
  const $dataNascimentoCidadao = document.getElementById('individual_registration_dataNascimentoCidadao')

  for (const $inputButton of $nacionalidadeCidadaoInput) {
    $inputButton.addEventListener('change', showSelectedOnNacionalidade);
  }

  handleDisabledInputTextByInputCheckboxInverse($nomeMaeCidadao, $desconheceNomeMae)
  handleDisabledInputTextByInputCheckboxInverse($nomePaiCidadao, $desconheceNomePai)
  handleDisabledInputTextByInputCheckbox($numeroCartaoSusResponsavel, $statusEhResponsavel)

  calculateAge($dataNascimentoResponsavel)
  calculateAge($dataNascimentoCidadao)


  // Informações Socio Demograficas
  const $statusTemAlgumaDeficienciaInput = document.getElementById('individual_registration_statusTemAlgumaDeficiencia');
  const $statusDesejaInformarOrientacaoSexualInput = document.getElementById('individual_registration_statusDesejaInformarOrientacaoSexual');
  const $statusMembroPovoComunidadeTradicionalInput = document.getElementById('individual_registration_statusMembroPovoComunidadeTradicional');
  const $coPovoComunidadeTradicionalInput = document.getElementById('individual_registration_coPovoComunidadeTradicional');

  const $deficienciasCidadaoOptions = document.getElementById('deficienciasCidadao-options');
  const $orientacaoSexualCidadaoOptions = document.getElementById('orientacaoSexualCidadao-options');

  handleDisplayOptionsByInputCheckbox($deficienciasCidadaoOptions, $statusTemAlgumaDeficienciaInput)
  handleDisplayOptionsByInputCheckbox($orientacaoSexualCidadaoOptions, $statusDesejaInformarOrientacaoSexualInput)
  handleDisabledInputTextByInputCheckbox($coPovoComunidadeTradicionalInput, $statusMembroPovoComunidadeTradicionalInput)

  // Em Situação de Rua

  const $statusSituacaoRuaInput = document.getElementById('individual_registration_statusSituacaoRua');
  const $statusVisitaFamiliarFrequentementeInput = document.getElementById('individual_registration_statusVisitaFamiliarFrequentemente');
  const $grauParentescoFamiliarFrequentadoInput = document.getElementById('individual_registration_grauParentescoFamiliarFrequentado');
  const $statusTemAcessoHigienePessoalSituacaoRuaInput = document.getElementById('individual_registration_statusTemAcessoHigienePessoalSituacaoRua');
  const $higienePessoalSituacaoRuaOptions = document.getElementById('higienePessoalSituacaoRua-options');
  const $statusAcompanhadoPorOutraInstituicaoInput = document.getElementById('individual_registration_statusAcompanhadoPorOutraInstituicao');
  const $outraInstituicaoQueAcompanhaInput = document.getElementById('individual_registration_outraInstituicaoQueAcompanha');

  const $containerSituacaoRua = document.getElementById('situacaoRua-container')

  handleDisplayOptionsByInputCheckbox($higienePessoalSituacaoRuaOptions, $statusTemAcessoHigienePessoalSituacaoRuaInput)
  handleDisplayOptionsByInputCheckbox($containerSituacaoRua, $statusSituacaoRuaInput)

  handleDisabledInputTextByInputCheckbox($grauParentescoFamiliarFrequentadoInput, $statusVisitaFamiliarFrequentementeInput)
  handleDisabledInputTextByInputCheckbox($outraInstituicaoQueAcompanhaInput, $statusAcompanhadoPorOutraInstituicaoInput)
});



