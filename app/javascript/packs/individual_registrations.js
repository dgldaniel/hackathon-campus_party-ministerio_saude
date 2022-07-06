import autocomplete from "js-autocomplete";

document.addEventListener('DOMContentLoaded', () => {
  // Functions to open and close a modal
  function openModal($el) {
    $el.classList.add('is-active');
  }

  function closeModal($el) {
    $el.classList.remove('is-active');
  }

  function closeAllModals() {
    (document.querySelectorAll('.modal') || []).forEach(($modal) => {
      closeModal($modal);
    });
  }

  // Add a click event on buttons to open a specific modal
  (document.querySelectorAll('.js-modal-trigger') || []).forEach(($trigger) => {
    const modal = $trigger.dataset.target;
    const $target = document.getElementById(modal);

    $trigger.addEventListener('click', () => {
      openModal($target);
    });
  });

  // Add a click event on various child elements to close the parent modal
  (document.querySelectorAll('.modal-background, .modal-close, .modal-card-head .delete, .modal-card-foot .button') || []).forEach(($close) => {
    const $target = $close.closest('.modal');

    $close.addEventListener('click', () => {
      closeModal($target);
    });
  });

  // Add a keyboard event to close all modals
  document.addEventListener('keydown', (event) => {
    const e = event || window.event;

    if (e.keyCode === 27) { // Escape key
      closeAllModals();
    }
  });

  // auto-complete
  var input = document.getElementById("q_nome_completo_eq");

  if (!!input) {
    autocomplete({
      selector: input,
      minChars: 3,
      source: (text, update) => {
          fetch(`http://localhost:3000/individual_registrations_search.json?search=${text}`, {
            method: 'GET'
          })
          .then(response => response.json()).then(data => {
            update(data)
          })
      },
      onSelect: function(event, term, item) {
        input.value = item.getElementsByTagName('p')[0].innerHTML;
      },
      renderItem: (data) => {
        return `<div class="autocomplete-suggestion"><div class="media"><div class="media-body"><h5 class="mt-0">${data.cns_cpf_cidadao}</h5><p>${data.nome_completo}</p></div></div></div>`;
      }
    });
  }

  const cnsInput = document.getElementById("individual_registration_cns_profissional");
  console.log('cnsInput', cnsInput)

  cnsInput.addEventListener('blur', (event) => validateCns(event))

  function validateCns(event) {

    let cns = event.target.value;

    cns = cns.replace(/\D/g, "");

    if (cns.length < 15) {
        responseValidateCns('invalid');
        return;
    }

    if (["1", "2"].includes(cns[0])) {
        const pis = cns.substr(0, 11);
        const sum = pis.split("").reduce((total, value, index) => total + value * (15 - index), 0);
        const rest = sum % 11;
        const digit = rest === 0 ? 0 : 11 - rest;
        const result = digit === 10 ? `${pis}001${11 - ((sum + 2) % 11)}` : `${pis}000${digit}`;
        if (result === cns) {
            responseValidateCns("valid");
            return;
        }
    }
    if (["7", "8", "9"].includes(cns[0])) {
        const sum = cns.split("").reduce((total, value, index) => total + value * (15 - index), 0);
        const result = sum % 11 === 0;

        if (result) {
            responseValidateCns("valid");
            return;
        }
    }
    responseValidateCns("invalid");
  }

  function responseValidateCns(response) {
    if (response === "valid") {
      cnsInput.classList.remove('is-danger')
      cnsInput.classList.add('is-primary')
    }

    if (response === "invalid") {
      cnsInput.classList.add('is-danger')
      cnsInput.classList.remove('is-primary')

    }
  }
});

window.onload = function () {
// step form

const $prevBtn = document.getElementById("prevBtn");
const $nextBtn = document.getElementById("nextBtn");

$prevBtn.addEventListener("click", () => nextPrev(-1));
$nextBtn.addEventListener("click", () => nextPrev(1));

var currentTab = 0; // Current tab is set to be the first tab (0)
showTab(currentTab); // Display the current tab

function showTab(n) {
  // This function will display the specified tab of the form ...
  var x = document.getElementsByClassName("tab");
  x[n].style.display = "block";
  // ... and fix the Previous/Next buttons:
  if (n == 0) {
    document.getElementById("prevBtn").style.display = "none";
  } else {
    document.getElementById("prevBtn").style.display = "inline";
  }
  if (n == (x.length - 1)) {
    document.getElementById("nextBtn").innerHTML = "Submit";
  } else {
    document.getElementById("nextBtn").innerHTML = "Next";
  }
  // ... and run a function that displays the correct step indicator:
  fixStepIndicator(n)
}

function nextPrev(n) {
  // This function will figure out which tab to display
  var x = document.getElementsByClassName("tab");
  // Exit the function if any field in the current tab is invalid:
  if (n == 6) return false;
  // Hide the current tab:
  if (currentTab < 6) {
    x[currentTab].style.display = "none";
  }
  // Increase or decrease the current tab by 1:
  currentTab = currentTab + n;
  // if you have reached the end of the form... :
  if (currentTab >= x.length) {
    //...the form gets submitted:
    document.getElementById("form-register").submit();
    return false;
  }
  // Otherwise, display the correct tab:
  showTab(currentTab);
}

function fixStepIndicator(n) {
  // This function removes the "active" class of all steps...
  var i, x = document.getElementsByClassName("step");
  for (i = 0; i < x.length; i++) {
    x[i].className = x[i].className.replace(" active", "");
  }
  //... and adds the "active" class to the current step:
  x[n].className += " active";
}
};
