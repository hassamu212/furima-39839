window.addEventListener('turbo:load', () => {
  if ( document.getElementById('item-price')!= null) {
    const priceInput = document.getElementById("item-price");
    const addTaxDom = document.getElementById("add-tax-price");
    const profitDom = document.getElementById("profit");

    priceInput.addEventListener("input", () => {
      const inputValue = document.getElementById("item-price").value;
        let tax = Math.floor(inputValue * 0.1)
        addTaxDom.innerHTML = tax
        profitDom.innerHTML = Math.floor(inputValue * 0.9)
    })
  }
});

window.addEventListener("turbo:render", () => {
  if ( document.getElementById('item-price')!= null) {
    const priceInput = document.getElementById("item-price");
    const addTaxDom = document.getElementById("add-tax-price");
    const profitDom = document.getElementById("profit");

    priceInput.addEventListener("input", () => {
      const inputValue = document.getElementById("item-price").value;
        let tax = Math.floor(inputValue * 0.1)
        addTaxDom.innerHTML = tax
        profitDom.innerHTML = Math.floor(inputValue * 0.9)
    })
  }
});