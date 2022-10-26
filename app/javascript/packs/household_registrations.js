import "cocoon-js-vanilla";

document.addEventListener('DOMContentLoaded', () => {
  const currentInputs = Array.from(document.querySelectorAll('input[id^="household_registration"]'));

  const inputs = currentInputs.reduce((acc, cur) => {
    if (cur.id.includes('attributes')) return { ...acc };

    const splitData = cur.id.split('_');
    const key = splitData[splitData.length - 1]

    return { ...acc, [key]: cur };
  }, {});

  console.log(inputs)


});
