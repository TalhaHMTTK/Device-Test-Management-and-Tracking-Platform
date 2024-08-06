import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  connect() {
    this.removeBackdrops();
    this.modal = new bootstrap.Modal(this.element);
    this.modal.show();
    this.element.addEventListener("hidden.bs.modal", () => {
      this.element.remove();
    });

    document.addEventListener("turbo:submit-end", this.handleTurboSubmitEnd.bind(this));
  }

  disconnect() {
    document.removeEventListener("turbo:submit-end", this.handleTurboSubmitEnd.bind(this));
  }

  removeBackdrops() {
    let backdrops = document.querySelectorAll(".modal-backdrop");
    backdrops.forEach(backdrop => backdrop.remove());
  }

  handleTurboSubmitEnd(event) {
    const isSuccess = event.detail.success;
  
    if (isSuccess) {
      this.modal.hide();
      this.removeBackdrops();
    }
  }
}
