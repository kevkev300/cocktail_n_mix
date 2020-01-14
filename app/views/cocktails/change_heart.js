var changeHeart = () => {
  var heartOne = document.querySelector(".favorited");
  var heartTwo = document.querySelector(".favorited").nextElementSibling;
  console.log(heartOne);
  console.log(heartTwo);
  heartOne.classList.toggle("d-none");
  heartTwo.classList.toggle("d-none");
}

changeHeart();
