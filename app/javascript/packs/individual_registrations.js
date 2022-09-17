/*

Validar dados

CondicoesDeSaude

#1 descricaoCausaInternacaoEm12Meses

- Não deve ser preenchido se o campo statusTeveInternadoem12Meses = false

#5 descricaoPlantasMedicinaisUsadas

- Não deve ser preenchido se o campo statusUsaPlantasMedicinais = false.

#6 doencaCardiaca

- Requerido preenchimento de pelo menos um item se o campo statusTeveDoencaCardiaca = true;
- Não deve ser preenchido se o campo statusTeveDoencaCardiaca = false

#7 doencaRespiratoria

- Requerido preenchimento de pelo menos um item se o campo statusTemDoencaRespiratoria = true;
- Não deve ser preenchido o campo statusTemDoencaRespiratoria = false.

#8 doencaRins

- Requerido preenchimento de pelo menos um item se o campo statusTemTeveDoencasRins = true;
- Não deve ser preenchido se o campo statusTemTeveDoencasRins = false

#9 maternidadeDeReferencia

- Não pode ser preenchido se o campo statusEhGestante = false

#14 statusEhGestante
- Campo sexoCidadao = 0 - Masculino;
- Campo dataNascimentoCidadao for menor que 9 anos ou maior que 60 anos a partir da dataAtendimento.

EmSituacaoDeRua

#1 grauParentescoFamiliarFrequentado
- Não pode ser preenchido se o campo statusSituacaoRua = false;
- Não pode ser preenchido se o campo statusVisitaFamiliarFrequentemente = false

#2 higienePessoalSituacaoRua
- Não pode ser preenchido se o campo statusSituacaoRua = false;
- Requerido preenchimento de pelo menos um item se o campo statusTemAcessoHigienePessoalSituacaoRua = true

#3 origemAlimentoSituacaoRua
- Não pode ser preenchido se o campo statusSituacaoRua = false

#4 outraInstituicaoQueAcompanha
- Não pode ser preenchido se o campo statusSituacaoRua = false;
- Não pode ser preenchido se o campo statusAcompanhadoPorOutraInstituição = false

#5 quantidadeAlimentacoesAoDiaSituacaoRua
- Não pode ser preenchido se o campo statusSituacaoRua = false

#6 statusAcompanhadoPorOutraInstituicao
- Não pode ser preenchido se o campo statusSituacaoRua = false

#8 statusRecebeBeneficio
- Não pode ser preenchido se o campo statusSituacaoRua = false

#10 statusTemAcessoHigienePessoalSituacaoRua
- Não pode ser preenchido se o campo statusSituacaoRua = false

#11 statusVisitaFamiliarFrequentemente
- Não pode ser preenchido se o campo statusSituacaoRua = false

#12 tempoSituacaoRua
- Não pode ser preenchido se o campo statusSituacaoRua = false

IdentificacaoUsuarioCidadao

#2 codigoIbgeMunicipioNascimento
 Só pode ser preenchido se o campo nacionalidadeCidadao = 1 (Brasileiro). Neste caso é de preenchimento obrigatório

#3 dataNascimentoCidadao
- Não pode ser posterior a dataAtendimento ou mais anterior que 130 anos a partir da dataAtendimento.

#8 nomeMaeCidadao
- Não deve ser preenchido se o campo desconheceNomeMae = true

#9 cnsCidadao

- Não pode ser preenchido se o campo cpfCidadao for preenchido;
- Este campo é de preenchimento obrigatório apenas se o campo cpfCidadao não estiver preenchido

#10 cnsResponsavelFamiliar
- Só pode ser preenchido se o campo statusEhResponsavel = false;
- Não pode ser preenchido se o campo cpfResponsavelFamiliar for preenchido

#11 telefoneCelular

- Apenas números;
- O preenchimento do campo é obrigatório apenas se o campo nacionalidadeCidadao estiver preenchido como "brasileira" ou "naturalizado".

#13 paisNascimento
- Só pode ser preenchido se o campo nacionalidadeCidadao = 3 (Estrangeiro). Neste caso o preenchimento é obrigatório;
- Se o campo nacionalidadeCidadao for igual a 1 (Brasileira), este campo deve ser preenchido com 31 (BRASIL)

#17 etnia
- Só deve ser preenchido se o campo racaCorCidadao = 5. Neste caso o preenchimento é obrigatório

#18 nomePaiCidadao
- As regras de validação de um nome estão descritas em Validar nome;

#20 dtNaturalizacao
- Só deve ser preenchido se o campo nacionalidadeCidadao = 2. Neste caso, é de preenchimento obrigatório;
- Não pode ser posterior a dataAtendimento;
- Não pode ser anterior a dataNascimentoCidadao.

#21 portariaNaturalizacao
- Só deve ser preenchido se o campo nacionalidadeCidadao = 2. Neste caso o preenchimento é obrigatório.

#22 dtEntradaBrasil
- Só deve ser preenchido se o campo nacionalidadeCidadao = 3. Neste caso o preenchimento é obrigatório;
- Não pode ser posterior a dataAtendimento;
- Não pode ser anterior a dataNascimentoCidadao.

#23 microarea
- Não deve ser preenchido se o campo stForaArea = true

#25 cpfCidadao
- Não pode ser preenchido se o campo cnsCidadao for preenchido;
- Este campo é de preenchimento obrigatório apenas se o campo cnsCidadao não estiver preenchido.

#26 cpfResponsavelFamiliar
- Só pode ser preenchido se o campo statusEhResponsavel = false;
- Não pode ser preenchido se o campo cnsResponsavelFamiliar for preenchido.

InformacoesSocioDemograficas

#1 deficienciasCidadao

Requerido preenchimento de pelo menos um item se o campo statusTemAlgumaDeficiencia = true;
Não deve ser preenchido se o campo statusTemAlgumaDeficiencia = false

#4 orientacaoSexualCidadao
Não pode ser preenchido se o campo statusDesejaInformarOrientacaoSexual = false

#6 relacaoParentescoCidadao
Só pode ser preenchido se o campo statusEhResponsavel = false

#15 identidadeGeneroCidadao
Não pode ser preenchido se o campo statusDesejaInformarIdentidadeGenero = fals

#17 responsavelPorCrianca
 Não pode ser preenchido se a dataNascimentoCidadao for maior ou igual a 10 anos a partir da dataAtendimento

#18 coPovoComunidadeTradicional
  Não deve ser preenchido se o campo statusMembroPovoComunidadeTradicional = false.

SaidaCidadaoCadastro
#2 dataObito
  Só pode ser preenchido se o campo motivoSaidaCidadao = 135. Neste caso o preenchimento é obrigatório;
  Não pode ser anterior a dataNascimentoCidadao;
  Não pode ser anterior a dtEntradaBrasil;
  Não pode ser anterior a dtNaturalizacao;
  Não pode ser posterior a dataAtendimento.

#3 numeroDO
  Só pode ser preenchido se o campo motivoSaidaCidadao = 135
*/

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
  // const $termoRecusa = document.getElementById('individual_registration_statusTermoRecusaCadastroIndividualAtencaoBasica')

  // CondicoesDeSaude

  const $statusTeveInternadoem12MesesInput = document.getElementById('individual_registration_statusTeveInternadoEm12Meses')
  const $descricaoCausaInternacaoEm12MesessInput = document.getElementById('individual_registration_descricaoCausaInternacaoEm12Meses')
  const $descricaoPlantasMedicinaisUsadasInput = document.getElementById('individual_registration_descricaoPlantasMedicinaisUsadas')
  const $statusUsaPlantasMedicinaisInput = document.getElementById('individual_registration_statusUsaPlantasMedicinais')
  const $doencaCardiacaInput = document.getElementById('individual_registration_doencaCardiaca')
  const $statusTeveDoencaCardiacaInput = document.getElementById('individual_registration_statusTeveDoencaCardiaca')
  const $doencaRespiratoriaInput = document.getElementById('individual_registration_doencaRespiratoria')
  const $statusTemDoencaRespiratoriaInput = document.getElementById('individual_registration_statusTemDoencaRespiratoria')
  const $doencaRinsInput = document.getElementById('individual_registration_doencaRins')
  const $statusTemTeveDoencasRinsInput = document.getElementById('individual_registration_statusTemTeveDoencasRins')
  const $maternidadeDeReferenciaInput = document.getElementById('individual_registration_maternidadeDeReferencia')
  const $statusEhGestanteInput = document.getElementById('individual_registration_statusEhGestante')
  const $sexoCidadaoInput = document.getElementById('individual_registration_sexoCidadao')
  const $dataNascimentoCidadaoInput = document.getElementById('individual_registration_dataNascimentoCidadao')

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


});



