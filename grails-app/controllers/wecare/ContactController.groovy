package wecare

import org.springframework.security.access.annotation.Secured

class ContactController {
    @Secured(['permitAll'])

    def index() {
        render(view: '/contact/contact')
    }
}
