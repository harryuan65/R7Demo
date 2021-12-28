import { Controller } from "@hotwired/stimulus";
import { get } from "@rails/request.js";

export default class extends Controller {
  static targets = ["select"];
  static values = {
    url: String,
    param: String,
  };

  //What if the select element does not have an id?
  connect() {
    if (this.selectTarget.id === "") {
      this.selectTarget.id = Math.random().toString(16);
    }
  }

  change(event) {
    // let params = new URLSearchParams("?foo=bar")
    let params = new URLSearchParams();
    params.append(this.paramValue, event.target.selectedOptions[0].value);
    params.append("target", this.selectTarget.id);
    get(`${this.urlValue}?${params}`, {
      responseKind: "turbo-stream",
    });
  }
}
