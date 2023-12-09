import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="search-repices"
export default class extends Controller {
  static targets = [ "form", "input", "recipes" ]
  connect() {
    console.log(this.formTarget);
    console.log(this.inputTarget);
    console.log(this.recipesTarget);
  }

  search(event) {
    event.preventDefault();
    const url = `${this.formTarget.action}?query=${this.inputTarget.value}`;
    fetch(`${url}`, { headers: { accept: "text/plain" } })
      .then(response => response.text())
      .then((data) => {
        this.recipesTarget.innerHTML = data;
        });
      }
}
