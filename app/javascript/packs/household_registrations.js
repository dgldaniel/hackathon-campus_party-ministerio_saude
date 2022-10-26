import "cocoon-js-vanilla";

document.addEventListener('DOMContentLoaded', () => {
  const currentInputs = Array.from(document.querySelectorAll('input[id^="household_registration"]'));

  const inputs = currentInputs.reduce((acc, cur) => {
    if (cur.id.includes('attributes')) return { ...acc };

    const splitData = cur.id.split('_');
    const key = splitData[splitData.length - 1]

    return { ...acc, [key]: cur };
  }, {});

  inputs['stSemNumero'].addEventListener('change', event => {
    if (event.target.checked) {
      inputs['numero'].disabled = true;
    } else {
      inputs['numero'].disabled = false;
    }
  });

  const localizacaoButton = document.getElementsByName("household_registration[localizacao]");
  const areaRuralButton = document.getElementsByName("household_registration[areaProducaoRural]");

  localizacaoButton.forEach((eachLocalizaoInput) => {
    eachLocalizaoInput.addEventListener('change', event => {
      if (event.target.value === '83') {
        areaRuralButton.forEach(eachAreaRuralInput => {
          eachAreaRuralInput.disabled = true;
        })
      } else {
        areaRuralButton.forEach(eachAreaRuralInput => {
          eachAreaRuralInput.disabled = false;
        })
      }
    });
  });

  const animaisDomicilioOptions = document.getElementsByName("household_registration[animaisNoDomicilio][]");

  inputs['stAnimaisNoDomicilio'].addEventListener('change', event => {
    if (event.target.checked) {
      inputs['quantosAnimaisNoDomicilio'].disabled = true;

      animaisDomicilioOptions.forEach(eachInput => {
        eachInput.disabled = true;
      })
    } else {
      inputs['quantosAnimaisNoDomicilio'].disabled = false;

      animaisDomicilioOptions.forEach(eachInput => {
        eachInput.disabled = false;
      })
    }
  });




});
