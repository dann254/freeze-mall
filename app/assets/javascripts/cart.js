function addToCart(id) {
  // let cartProducts = [];
  // if (window.localstorage.getItem("cartProducts")) {
  //   cartProducts = window.localStorage.getItem("cartProducts");
  // }
  var cartProducts = cartProducts.push(id);
  window.localStorage.setItem(("cartProducts": cartProducts));
}
