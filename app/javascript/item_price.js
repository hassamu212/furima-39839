function handleTurboLoad() {
  if (document.getElementById('item-price') != null) {
    const priceInput = document.getElementById("item-price");
    const addTaxDom = document.getElementById("add-tax-price");
    const itemProfit = document.getElementById("profit");

    priceInput.addEventListener("input", () => {
      const inputValue = priceInput.value;
      addTaxDom.innerHTML = Math.floor(inputValue * 0.1);
      itemProfit.innerHTML = Math.ceil(inputValue - (inputValue * 0.1));
    });
  };
};

window.addEventListener('turbo:load', handleTurboLoad);