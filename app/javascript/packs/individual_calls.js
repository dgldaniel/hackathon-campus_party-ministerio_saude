import "cocoon-js-vanilla";

function showSelectedOnNacionalidade(event, inputs) {
  const $containerGravidez = document.getElementById('container-stGravidezPlanejada');

  if (event.target.value === '1') {
    $containerGravidez.style.display = 'block';
    inputs['nuGestasPrevias'].disabled = false;
    inputs['nuPartos'].disabled = false;
    inputs['idadeGestacional'].disabled = false;
  } else {
    $containerGravidez.style.display = 'none';
    inputs['nuGestasPrevias'].disabled = true;
    inputs['nuPartos'].disabled = true;
    inputs['idadeGestacional'].disabled = true;
  }
}

function calculateAge(inputText) {
  inputText.addEventListener('blur', event => {
    if (!event.target.value) return;

    const birthDate = new Date(event.target.value);
    const otherDate = new Date();

    const years = (otherDate.getFullYear() - birthDate.getFullYear());

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
  const currentInputs = Array.from(document.querySelectorAll('input[id^="individual_call"]'));

  const inputs = currentInputs.reduce((acc, cur) => {
    if (cur.id.includes('attributes')) return { ...acc };

    const splitData = cur.id.split('_');
    const key = splitData[splitData.length - 1]

    return { ...acc, [key]: cur };
  }, {})

  const $sexoInput = document.querySelectorAll('input[name="individual_call[sexo]"]');

  for (const $inputButton of $sexoInput) {
    $inputButton.addEventListener('change', (event) => showSelectedOnNacionalidade(event, inputs));
  }

  calculateAge(inputs['dataNascimento'])
});
