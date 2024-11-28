import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["card"];

  connect() {
    this.initializeDragAndDrop();
  }

  initializeDragAndDrop() {
    const cards = this.element.querySelectorAll("[data-id]");

    cards.forEach((card) => {
      card.setAttribute("draggable", true);

      card.removeEventListener("dragstart", this.dragStart);
      card.removeEventListener("dragover", this.dragOver);
      card.removeEventListener("drop", this.drop); 

      card.addEventListener("dragstart", (event) => this.dragStart(event));
      card.addEventListener("dragover", (event) => this.dragOver(event));
      card.addEventListener("drop", (event) => this.drop(event));
    });
  }

    dragStart(event) {
      event.dataTransfer.setData("text/plain", event.target.dataset.id);
    }

  dragOver(event) {
    event.preventDefault();
  }

  drop(event) {
    event.preventDefault();

    const draggedCardId = event.dataTransfer.getData("text/plain");
    const draggedCard = this.element.querySelector(`[data-id="${draggedCardId}"]`);

    const droppedCard = event.target.closest("[data-id]");

    if (!draggedCard || !droppedCard || draggedCard === droppedCard) return;

    const draggedCardParent = draggedCard.parentNode;
    const droppedCardParent = droppedCard.parentNode;

    const draggedNextSibling = draggedCard.nextSibling === droppedCard ? draggedCard : draggedCard.nextSibling;

    droppedCardParent.insertBefore(draggedCard, droppedCard);
    draggedCardParent.insertBefore(droppedCard, draggedNextSibling);

    this.updatePositions();
  }


  updatePositions() {
    const cards = this.element.querySelectorAll("[data-id]");
    const positions = Array.from(cards).map((card, index) => ({
      id: card.dataset.id,
      position: index + 1,
    }));

    const payload = {
      positions: Object.fromEntries(positions.map((p) => [p.id, p.position])),
    };

    fetch(this.data.get("updatePositionsUrl"), {
      method: "PATCH",
      headers: {
        "Content-Type": "application/json",
        "X-CSRF-Token": document.querySelector("[name='csrf-token']").content,
      },
      body: JSON.stringify(payload),
    })
      .then((response) => response.json())
      .then((data) => {
        if (data.success) {
          console.log("Positions updated successfully!", data);
        } else {
          console.error("Error updating positions:", data.error);
        }
      })
      .catch((error) => console.error("Fetch error:", error));
  }
}
