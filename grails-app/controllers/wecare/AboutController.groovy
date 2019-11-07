package wecare

import org.springframework.security.access.annotation.Secured

@Secured(['permitAll'])
class AboutController {
    def index(){
        render(view: "/about/about")
        }


    }

