import cep from "cep-promise";
require("custom/cidades-estados-brasil");

window.onload = function () {
  // Manager Multi-Form

  const titleTabs = [
    "Dados Pessoais",
    "Domínio de Metas Terapêuticas",
    "Domínio de Adesão dos Provedores de Saúde aos Protocolos de Tratamento",
    "Domínio de Identificação de Complicações",
    "Domínio de Ações Preventivas",
  ];

  let currentTabPosition = 0; // Current tab is set to be the first tab (0)

  const $prevBtn = document.getElementById("prevBtn");
  const $nextBtn = document.getElementById("nextBtn");
  const $submitBtn = document.getElementById("submitBtn");
  const $allTabs = document.getElementsByClassName("tab");

  $prevBtn.addEventListener("click", () => nextPrev(-1));
  $nextBtn.addEventListener("click", () => nextPrev(1));

  showCurrentTab(currentTabPosition); // Display the current tab

  function validateForm() {
    // This function deals with validation of the form fields
    var x,
      y,
      i,
      valid = true;
    x = document.getElementsByClassName("tab");
    y = x[currentTabPosition].getElementsByTagName("input");
    // A loop that checks every input field in the current tab:

    for (i = 0; i < y.length; i++) {
      if (!y[i].validity.valid) {
        // add an "invalid" class to the field:
        y[i].classList.add("is-danger");
        // and set the current valid status to false:
        valid = false;
      }
    }
    // If the valid status is true, mark the step as finished and valid:
    if (valid) {
      document
        .getElementsByClassName("step")
        [currentTabPosition].classList.add("finish");

      for (i = 0; i < y.length; i++) {
        const isInvalid = y[i].classList.contains("is-danger");

        if (isInvalid) y[i].classList.remove("is-danger");
      }
    }
    return valid; // return the valid status
  }

  function showCurrentTab(tabPosition) {
    // This function will display the specified tab of the form ...

    const allTabsSize = $allTabs.length - 1;

    $allTabs[tabPosition].style.display = "block";

    // ... and fix the Previous/Next buttons:
    if (tabPosition === 0) {
      $prevBtn.style.display = "none";
    } else {
      $prevBtn.style.display = "inline";
    }

    if (tabPosition === allTabsSize) {
      $nextBtn.style.display = "none";
      $submitBtn.style.display = "inline";
    } else {
      $nextBtn.style.display = "inline";
      $submitBtn.style.display = "none";
    }
    // ... and run a function that displays the correct step indicator:
    fixBulletIndicator(tabPosition);
  }

  function fixBulletIndicator(tabPosition) {
    // This function removes the "active" class of all steps...
    const $bullets = document.getElementsByClassName("step");
    const $titleTab = document.getElementById("title-tab");

    // Add title on current tab
    $titleTab.textContent = titleTabs[tabPosition];

    // remove all "active" class in all bullets
    for (let index = 0; index < $bullets.length; index++) {
      $bullets[index].className = $bullets[index].className.replace(
        " active",
        ""
      );
    }
    //... and adds the "active" class to the current bullet:
    $bullets[tabPosition].className += " active";
  }

  function nextPrev(movePosition) {
    // This function will figure out which tab to display

    // Exit the function if any field in the current tab is invalid:
    if (movePosition == 1 && !validateForm()) return false;

    // Hide the current tab:
    $allTabs[currentTabPosition].style.display = "none";
    // Increase or decrease the current tab by 1:
    currentTabPosition = currentTabPosition + movePosition;
    // if you have reached the end of the form... :
    if (currentTabPosition >= $allTabs.length) {
      //...the form gets submitted:
      document.getElementById("patient-form").submit();

      return false;
    }
    // Otherwise, display the correct tab:
    showCurrentTab(currentTabPosition);
  }

  // Calculate Ratio

  const $waistMeasurementField = document.getElementById("waist-measurement");
  const $hipMeasurementField = document.getElementById("hip-measurement");
  const $ratioField = document.getElementById(
    "patient_report_attributes_waist_measured_ratio"
  );

  $hipMeasurementField.addEventListener("blur", () => {
    const waistValue = Number($waistMeasurementField.value);
    const hipValue = Number($hipMeasurementField.value);

    if (hipValue) {
      $ratioField.value = waistValue / hipValue;
    }
  });

  // Consult Zip code

  const $zipCodeInput = document.getElementById(
    "patient_address_attributes_zip_code"
  );
  const $stateInput = document.getElementById(
    "patient_address_attributes_state"
  );
  const $cityInput = document.getElementById("patient_address_attributes_city");

  $zipCodeInput.addEventListener("blur", () => {
    const zipCodeValue = $zipCodeInput.value;

    cep(zipCodeValue).then((result) => {
      $cityInput.value = result.city;
      $stateInput.value = result.state;
    });
  });

  // Enable/Disable number address
  const $numberCheckbox = document.getElementById("number-checkbox");
  const $numberInput = document.getElementById(
    "patient_address_attributes_number"
  );

  $numberCheckbox.addEventListener("change", (event) => {
    const isChecked = event.target.checked;

    if (isChecked) {
      $numberInput.disabled = true;
      $numberInput.value = null;

      return;
    }

    $numberInput.disabled = false;
  });
};

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
});
