import { Application } from "@hotwired/stimulus"
import RailsNestedForm from '@stimulus-components/rails-nested-form'
import RemoteRails from '@stimulus-components/remote-rails'

const application = Application.start()
application.register('nested-form', RailsNestedForm)

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }
