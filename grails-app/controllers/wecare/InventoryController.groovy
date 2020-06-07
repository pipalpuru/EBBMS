package wecare

import grails.converters.JSON
import org.grails.web.json.JSONObject
import org.springframework.security.access.annotation.Secured


@Secured(['permitAll'])
class InventoryController {

    def index() {
        render(view: 'inventory')
    }

    def inventory() {
        def list = UserInfo.list().sort { -it.id }
        //render list as JSON
        [list: list]
    }

    def delete() {
        println "params = $params"
        def data = UserInfo.findById(params.id)
        println "data =" + data.id
        def userInfo = UserInfoRoleInfo.findByUserInfo(data)
        println "userInfo = $userInfo"
        userInfo.delete(flush: true, failOnError: true)
        data.delete(flush: true, failOnError: true)
        redirect(controller: "inventory", action: "inventory")
    }

    def edit() {
        JSONObject object = new JSONObject()
        println "params = $params"
        def data = UserInfo.findById(params.id)
        println "data =" + data.id
        data.name = params.fullName
        data.address = params.address
        data.phone = params.phone
        data.age = params.age
        data.email = params.email
        data.gender = params.gender
        data.save(flush: true, failOnError: true)
        render object
    }

    def findAcc() {
        JSONObject user = new JSONObject()
        def data = UserInfo.findById(params.id)
        user.put("fullName", data.name)
        user.put("id", data.id)
        user.put("address", data.address)
        user.put("phone", data.phone)
        user.put("email", data.email)
        user.put("age", data.age)
        user.put("gender", data.gender)
        user.put("blood", data.bloodgroup)
        render user
    }
}
