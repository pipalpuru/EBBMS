package wecare

import org.springframework.security.access.annotation.Secured

import javax.imageio.ImageIO
import java.awt.image.BufferedImage
import java.text.SimpleDateFormat


@Secured(['permitAll'])
class EventController {
    def springSecurityService

    def index() {
        render(view: '/event/event')
    }

    def addevent() {
        boolean flag
        def img1 = request.getFile('eventimage')
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


        def data = new Event()
        data.name = params.name
        data.location = params.location
        data.organizer = params.organizer
        data.image = encodedImage1

        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd")
        String dateString = params.date
        println dateString
        Date date1 = format.parse(dateString)
        data.date = date1

        data.save(flush: true)

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

        if (flag) {
            println "saved sucessfully"
        } else {
            println "error1!!"
        }
        redirect(action: 'index')
    }

    def showevent() {
        UserInfo user = (UserInfo) springSecurityService.getCurrentUser()
        int data7 = Interested.count()
        def data = Event.list()
        def data4 = Interested.list()
        [data: data, data7: data7, user: user, data4: data4]
    }

    def profileImage() {
        def file = Event.findById(params.id)
        print "file>>>" + file
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

    def eventCounter() {
            UserInfo user = (UserInfo) springSecurityService.getCurrentUser()
            def data = new Interested()
            data?.interestedTo = params.id
            data?.interestedUser = user
            data.save(flush: true)
            redirect(action: 'showevent')
        }

    }

