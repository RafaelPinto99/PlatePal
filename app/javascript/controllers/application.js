import { Application } from "@hotwired/stimulus";
import RecipeList from "./recipe_list_controller";

const application = Application.start()

application.debug = false
window.Stimulus = application

Stimulus.register("recipes-list", RecipeList);

export { application}
