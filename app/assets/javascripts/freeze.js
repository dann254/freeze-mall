function accCollapse(value) {
  window.localStorage.setItem("open", value);
}
function codeAddress() {
  if (window.localStorage.getItem("open")) {
    if (window.localStorage.getItem("open") === "buyer") {
      document.getElementById("collapse1").classList.add("in");
    } else if (window.localStorage.getItem("open")) {
      document.getElementById("collapse2").classList.add("in");
    }
  }
}
window.onload = codeAddress;
