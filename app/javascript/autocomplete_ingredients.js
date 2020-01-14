const getSuggestions = (searchString) => {
  let suggestions = <%= Ingredient.ingredient_names(searchString) %>
  console.log(suggestions);
}

const autocompleteIngredients = () => {
  let inputField = document.getElementById("dose_ingredient");
  inputField.addEventListener('keyup', (event) => {
    let searchString = event.currentTarget.value;
    getSuggestions(searchString);
  });
}

export { autocompleteIngredients };
