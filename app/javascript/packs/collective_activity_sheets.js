import "cocoon-js-vanilla";

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
});
