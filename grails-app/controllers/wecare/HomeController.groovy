package wecare

import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured



@Secured(['permitAll'])
class HomeController {
    def springSecurityService
    def index() {
        render(view: '/home/home')
    }

    def home(){
        UserInfo user = (UserInfo) springSecurityService.getCurrentUser()
        def alldoner = UserInfo.findAllByIdNotEqual(user?.id)
       [alldoner: alldoner, user:user]

    }

    def profileImage() {
        def file = UserInfo.findById(params.id)
        print "file>>>" + file
        if (file) {
            byte[] imageArray = file.profileimage
            //response.setContentLength(imageArray.length)
            response.contentType = 'image/jpg'
            BufferedOutputStream outputStream = null
            try {
                ByteArrayInputStream inputStream = new ByteArrayInputStream(imageArray)
                outputStream = new BufferedOutputStream(response.getOutputStream())
                byte[] buffer = new byte[4096]
                int length = 0
                while ((length = inputStream.read(buffer)) >= 0) {
                    outputStream.write(buffer, 0, length)
                }

            } catch (Exception e) {
                println "Error!!!"
            } finally {
                if (outputStream != null) try {
                    outputStream.close()
                } catch (IOException logOrError) {
                }
            }
            response.outputStream << outputStream
            response.outputStream.flush()
        }
    }

    def about(){
        render(view: '/about/about')
    }

    def request () {
        UserInfo user = (UserInfo) springSecurityService.getCurrentUser()
        def data = new Request()
        data.requestTO = params.id
        data.requestFrom = user
        data.save(flush: true)

        if (!data.validate()) {
            data.errors.each { error ->
                println error
            }
        }
        redirect(action: 'home')
    }
}
