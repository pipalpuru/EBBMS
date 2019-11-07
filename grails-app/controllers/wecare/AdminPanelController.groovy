package wecare

import grails.plugin.springsecurity.annotation.Secured


@Secured(['permitAll'])
class AdminPanelController {
    def index() {
        render(view: '/adminPanel/donerList')
        }

    def donerList() {
        def donerlist = UserInfo.list()
        [donerlist: donerlist]
    }

    def index2(){
        render(view: '/adminPanel/addDoner')

    }
}