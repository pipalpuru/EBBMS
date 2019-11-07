package wecare

import grails.plugin.springsecurity.annotation.Secured

import java.awt.image.BufferedImage
import java.text.SimpleDateFormat

@Secured(['permitAll'])
class ProfileViewController {
    def springSecurityService


    def index() {
        redirect(action: 'profileView')
    }

    def profileView() {
        println "profile"
        UserInfo user = (UserInfo) springSecurityService.getCurrentUser()
        println "user>>" + user
        def list = Request.findAllByRequestTO(user?.id)
        def action = Action.list()
        [user: user, list: list, action: action]
    }


    def profileImage() {
        def file = UserInfo.findById(params.id)
        print "profileImage>>>" + file
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

    def accept() {
        println(" Accepted and deleteRequest>>>" + params)
        UserInfo user = (UserInfo) springSecurityService.getCurrentUser()
        def data = new Action()
        data?.acceptBy = user
        data?.acceptTo = params.id
        data.save(flush: true)

        def data2 = Request.get(params.id)
        data2.delete(flush: true)
        redirect(action: 'profileView')
    }

    def deleteRequest() {
        println("Reject and deleteRequest>>>" + params)
        def data = Request.get(params.id)
        data.delete(flush: true)
        redirect(action: 'profileView')
    }

    def deleteAction() {
        println("deleteAction>>>" + params)
        def data = Action.get(params.id)
        data.delete(flush: true)
        redirect(action: 'profileView')
    }


    def editProfile () {
        redirect(view: "/profileView/editProfile")
    }
}


    /*def updatePost() {
        UserInfo user = (UserInfo) springSecurityService.getCurrentUser()

        boolean flag = false
        def img1 = request.getFile('coverImage')
        println "params>>" + params
        println "img = $img1"
        BufferedImage imm1 = ImageIO.read(img1.getInputStream())
        ByteArrayOutputStream outputStream1 = new ByteArrayOutputStream()
        //use another encoding if JPG is inappropriate for you
        ImageIO.write(imm1, "jpg", outputStream1)
        outputStream1.flush()
        Byte[] encodedImage1 = outputStream1.toByteArray()
        outputStream1.close()
        println "encodedImage = $encodedImage1"


        def img2 = request.getFile('profileImage')
        println "params>>" + params
        println "img = $img2"
        BufferedImage imm2 = ImageIO.read(img2.getInputStream())
        ByteArrayOutputStream outputStream2 = new ByteArrayOutputStream()
        //use another encoding if JPG is inappropriate for you
        ImageIO.write(imm2, "jpg", outputStream2)
        outputStream2.flush()
        Byte[] encodedImage2 = outputStream2.toByteArray()
        outputStream2.close()
        println "encodedImage2 = $encodedImage2"


        def image = Image.findById(user?.coverImage?.id)
        image.image = encodedImage1
        image.name = params.username

        def image2 = Image.findById(user?.profileImage?.id)
        image2.image = encodedImage2
        image2.name = params.username


        if (!image.validate()) {
            image.errors.each { error ->
                println error
            }
        }

        if (!image2.validate()) {
            image2.errors.each { error ->
                println error
            }

            image2.save(flush: true)


            if (image.save(flush: true)) {
                flag = true
                println "after save image!!!"

                def data = UserInfo.findById(user?.id)
                data.name = params.name
                data.email = params.email
                data.username = params.username
                data.password = params.password
                data.address = params.address
            }
        }
    }*/
