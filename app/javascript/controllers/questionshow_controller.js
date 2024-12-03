import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["question", "progress"];

  initialize() {
    this.currentIndex = 0;
    this.totalQuestions = this.questionTargets.length;
    this.updateProgress();
  }

  next() {
    if (this.currentIndex < this.totalQuestions - 1) {
      this.toggleQuestion(this.currentIndex, this.currentIndex + 1);
      this.currentIndex++;
      this.updateProgress();
    }
  }

  previous() {
    if (this.currentIndex > 0) {
      this.toggleQuestion(this.currentIndex, this.currentIndex - 1);
      this.currentIndex--;
      this.updateProgress();
    }
  }

  toggleQuestion(oldIndex, newIndex) {
    this.questionTargets[oldIndex].setAttribute("hidden", true);
    this.questionTargets[newIndex].removeAttribute("hidden");
  }

  updateProgress() {
    const percentage = ((this.currentIndex + 1) / this.totalQuestions) * 100;
    this.progressTarget.style.width = `${percentage}%`;
  }
}
