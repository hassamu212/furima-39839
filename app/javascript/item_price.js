document.addEventListener("DOMContentLoaded", function() {
  
  const priceInput = document.getElementById("item-price");
  const addTaxDom = document.getElementById("add-tax-price");
  const profit = document.getElementById("profit");
  
  priceInput.addEventListener("input", () => {
    const inputValue = parseInt(priceInput.value);
    const addTax = Math.floor(inputValue * 0.1);

    addTaxDom.innerHTML = addTax;
    profit.innerHTML = Math.floor(inputValue - addTax);
  });

});