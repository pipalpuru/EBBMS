/*
package wecare

import grails.plugin.springsecurity.annotation.Secured

import javax.imageio.ImageIO
import java.awt.image.BufferedImage
import java.text.SimpleDateFormat

@Secured(['permitAll'])
class SignUpController {
    def index() {
        render(view: "/signUp/signUp")

    }


    def signUp() {


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


        def image = new Image()
        image.image = encodedImage1
        image.name = params.username

        def image2 = new Image()
        image2.image= encodedImage2
        image2.name = params.username


        if (!image.validate()) {
            image.errors.each { error ->
                println error
            }
        }

        if (image.save(flush: true)) {
            flag = true
            println "after save image!!!"
            def data = new UserInfo()
            data.name = params.name
            data.email = params.email
            data.username = params.username
            data.password = params.password
            data.location = params.location

            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd")
            String dateString = params.birthday
            println dateString
            Date date1 = format.parse(dateString)

            data.birthday = date1
            data.coverImage = image
            data.profileImage = image2

            def adminRole = new RoleInfo(authority: 'ROLE_ADMIN').save(flush: true)
            UserInfoRoleInfo.create data, adminRole


            if (!data.validate()) {
                data.errors.each { error ->
                    println error
                }
            }

            if (data.save(flush: true)) {
                render(view: "/admin/adminPage")


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
    }


    def coverImage(){
        def coverlist = Image.findById(params.id)
        [coverlist: coverlist]
    }

    def displayCoverImage() {
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

    def profileImage(){
        def profileList = Image.findById(params.id)
        [profileList: profileList]
    }

    def displayProfileImage() {
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

}
*/
