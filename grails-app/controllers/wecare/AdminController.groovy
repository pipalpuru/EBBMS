/*
package wecare

import grails.plugin.springsecurity.annotation.Secured

import javax.imageio.ImageIO
import java.awt.image.BufferedImage

@Secured(['ROLE_ADMIN'])
class AdminController {

    def springSecurityService

    def index() {
        render(view: "adminPage")
    }


    def adminPage() {
    }

    @Secured(['ROLE_ADMIN'])
    def postList (){
        UserInfo user = (UserInfo) springSecurityService.getCurrentUser()
        def postByUser = AdminDomain.findAllByUserInfo(user)
        [postByUser: postByUser]

    }

    def save() {
        UserInfo user = (UserInfo) springSecurityService.getCurrentUser()
        boolean flag = false
        def img = request.getFile('blogImage')
        println "params>>" + params
        println "img = $img"
        BufferedImage imm = ImageIO.read(img.getInputStream())
        ByteArrayOutputStream outputStream = new ByteArrayOutputStream()
        //use another encoding if JPG is inappropriate for you
        ImageIO.write(imm, "jpg", outputStream)
        outputStream.flush()
        Byte[] encodedImage = outputStream.toByteArray()
        outputStream.close()
        println "encodedImage = $encodedImage"
        def image = new Image()
        image.image = encodedImage
        image.name = user

        if (!image.validate()) {
            image.errors.each { error ->
                println error
            }
        }

        if (image.save(flush: true)) {

            flag = true
            println "after save image!!!"

            def data = new AdminDomain()
            data.title = params.title
            data.description = params.description
            data.image = image
            data.userInfo = user

            if (!data.validate()) {
                data.errors.each { error ->
                    println error
                }
            }

            if (data.save(flush: true)) {
                flag = true
            } else {
                flag = false
            }
        }

        if (flag) {
            println "saved sucessfully"
        } else {
            println "error1!!"
        }

        redirect(action: "adminPage")
    }

    def delete() {
        def del = AdminDomain.findById(params.id)
        print(del)
        del.delete(flush: true, failOnError: true)
        redirect(action: "adminPage")
    }

    def edit() {
        def edit = AdminDomain.findById(params.id)
        print(edit)
        render(view: "editPost", model: [edit: edit])
    }

    def displayEditImage() {
        def file = Image.findById(params.id)
        if (file) {
            byte[] imageArray = file.image
            response.setContentLength(imageArray.length)
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

    def updatePost() {
        UserInfo user = (UserInfo) springSecurityService.getCurrentUser()
        boolean flag = false
        def img = request.getFile('blogImage')
        println "params>>" + params
        println "img = $img"
        BufferedImage imm = ImageIO.read(img.getInputStream())
        ByteArrayOutputStream outputStream = new ByteArrayOutputStream()
        //use another encoding if JPG is inappropriate for you
        ImageIO.write(imm, "jpg", outputStream)
        outputStream.flush()
        Byte[] encodedImage = outputStream.toByteArray()
        outputStream.close()
        println "encodedImage = $encodedImage"

        def value = AdminDomain.findById(params.id)
        def id = value?.image?.id
        def id2 = value?.id

        def image = Image.findById(id)
        image.image = encodedImage
        image.name = user

        if (!image.validate()) {
            image.errors.each { error ->
                println error
            }
        }

        if (image.save(flush: true)) {

            flag = true
            println "after save image!!!"

            def update = AdminDomain.findById(params.id)
            println "update>>>" +update
            update.title = params.title
            update.description = params.description
            update.image = image
            update.userInfo = user
            update.save(flush: true)
            redirect(action: "adminPage")

        }

    }
}


*/
