// Import and register all your controllers from the importmap via controllers/**/*_controller
import { application } from "controllers/application"
import { eagerLoadControllersFrom } from "@hotwired/stimulus-loading"
eagerLoadControllersFrom("controllers", application)

// import { Application } from '@hotwired/stimulus'
// import Sortable from '@stimulus-components/sortable'

// const application = Application.start()
// application.register('sortable', Sortable)
