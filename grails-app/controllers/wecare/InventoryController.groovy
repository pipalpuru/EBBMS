package wecare

import grails.converters.JSON
import org.springframework.security.access.annotation.Secured


@Secured(['permitAll'])
class InventoryController {

    def index() {
        render(view: 'inventory')
    }

    def inventory(){
        def list = UserInfo.list().sort{ -it.id}
        //render list as JSON
        [list: list]
    }
}
