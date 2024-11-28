import { Application } from "@hotwired/stimulus"
import { definitionsFromContext } from "stimulus/webpack-helpers"

// Start the Stimulus application
const application = Application.start()

// Load all Stimulus controllers from the controllers directory
const context = require.context("controllers", true, /.js$/)
application.load(definitionsFromContext(context))
