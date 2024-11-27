import { Controller } from "@hotwired/stimulus"
import Sortable from "sortablejs";


export default class extends Controller {
  connect() {
    const element = this.element;
    new Sortable(element, {
      group: 'plan-recipes',
      animation: 150,
      onEnd: this.onDragEnd.bind(this),
    });
  }

  onDragEnd(event) {
    const orderedIds = Array.from(this.element.children)
      .map((card) => card.dataset.id);

    this.updateRecipeOrder(orderedIds);
  }

  updateRecipeOrder(order) {
    fetch("/plans/update_recipe_order", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
        "X-CSRF-Token": document.querySelector('meta[name="csrf-token"]').content,
      },
      body: JSON.stringify({ order: order }),
    })
    .then(response => response.json())
    .then(data => {
      if (data.success) {
        console.log("Order updated successfully!");
      } else {
        console.error("Failed to update order");
      }
    })
    .catch((error) => console.error("Error:", error));
  }

  saveOrder(event) {
    event.preventDefault();
    if (!this.order || this.order.length === 0) {
      alert("No changes to save.");
      return;
    }

    fetch(`/plans/${this.element.dataset.planId}/update_recipe_order`, {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
        "X-CSRF-Token": document.querySelector('meta[name="csrf-token"]').content,
      },
      body: JSON.stringify({ order: this.order }),
    })
    .then(response => response.json())
    .then(data => {
      if (data.success) {
        window.location.href = `<%= plan_path(@plan) %>`;
      } else {
        alert("Failed to update order");
      }
    })
    .catch((error) => {
      console.error("Error:", error);
      alert("An error occurred while saving the order.");
    });
  }
}
