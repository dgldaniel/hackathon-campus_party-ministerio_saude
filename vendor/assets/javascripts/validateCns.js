export function validateCns(event, input) {
  let cns = event.target.value;
  cns = cns.replace(/\D/g, "");

  if (cns.length < 15) {
      responseValidateCns('invalid', input);
      return;
  }

  if (["1", "2"].includes(cns[0])) {
      const pis = cns.substr(0, 11);
      const sum = pis.split("").reduce((total, value, index) => total + value * (15 - index), 0);
      const rest = sum % 11;
      const digit = rest === 0 ? 0 : 11 - rest;
      const result = digit === 10 ? `${pis}001${11 - ((sum + 2) % 11)}` : `${pis}000${digit}`;
      if (result === cns) {
          responseValidateCns("valid", input);
          return;
      }
  }
  if (["7", "8", "9"].includes(cns[0])) {
      const sum = cns.split("").reduce((total, value, index) => total + value * (15 - index), 0);
      const result = sum % 11 === 0;

      if (result) {
          responseValidateCns("valid", input);
          return;
      }
  }
  responseValidateCns("invalid", input);
}

export function responseValidateCns(response, input) {
  if (response === "valid") {
    input.classList.remove('is-invalid')
    input.classList.add('is-valid')
  }

  if (response === "invalid") {
    input.classList.add('is-invalid')
    input.classList.remove('is-valid')
  }
}
