/*
package wecare

import grails.plugin.springsecurity.annotation.Secured

@Secured(['permitAll'])
class ActivityController {
    def springSecurityService
    def index() { }

    def likeCounter(){
        UserInfo user = (UserInfo) springSecurityService.getCurrentUser()
        println "params>>>" +params

        def likePost = new Activity()
        likePost.userInfo = user
        likePost.adminDomain = AdminDomain.get(params.id)
        likePost.action = "postLiked"
        likePost.save(flush: true)
        if (likePost.validate()) {
            likePost.errors.each { error ->
                println error
            }
        }
        redirect(controller: "dashboard", action: "dashboard")
    }

    def readLater(){
        UserInfo user = (UserInfo) springSecurityService.getCurrentUser()
        println "params>>>" +params

        def readLater = new Activity()
        readLater.userInfo = user
        readLater.adminDomain = AdminDomain.get(params.id)
        readLater.action = "readLater"
        readLater.save(flush: true)
        if (!readLater.validate()) {
            readLater.errors.each { error ->
                println error
            }
        }
        redirect(controller: "dashboard", action: "dashboard")
    }

    def removeReadLater() {
        print(params)
        def remove = Activity.findById(params.id)
        remove.delete(flush: true, failOnError: true)
        UserInfo user = (UserInfo) springSecurityService.getCurrentUser()
        render(view: "/profileView/profileView", model: [id: user])
    }
}
*/
