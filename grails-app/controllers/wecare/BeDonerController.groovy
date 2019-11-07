package wecare

import org.springframework.security.access.annotation.Secured

import javax.imageio.ImageIO
import java.awt.image.BufferedImage
import java.text.SimpleDateFormat

@Secured(['permitAll'])
class BeDonerController {

    def index() {
        render(view: '/bedoner/bedoner')
    }

    def data() {
        boolean flag
        def img1 = request.getFile('profileimage')
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

        def data = new UserInfo()
        print(params)
        data.profileimage = encodedImage1
        data.name = params.name
        data.email = params.email
        data.username = params.username
        data.password = params.password
        data.phone = params.phone
        data.address = params.address
        data.bloodgroup = params.bloodgroup
        data.gender = params.gender
        data.age = params.age

        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd")
        String dateString = params.lastdonateddate
        println dateString
        Date date1 = format.parse(dateString)
        data.lastdonateddate = date1

        SimpleDateFormat format2 = new SimpleDateFormat("yyyy-MM-dd")
        String dateString2 = params.nextdonationdate
        println dateString2
        Date date2 = format2.parse(dateString2)
        data.nextdnationdate = date2

        Date cdate = new Date()
        SimpleDateFormat format3 = new SimpleDateFormat("yyyy-MM-dd")
        String dateString3 = cdate
        data.expDate = date1-cdate
        data.save(flush: true)

        if (!data.validate()) {
            data.errors.each { error ->
                println error
            }
        }

        if (data.save(flush: true)) {
            flag = true
            UserInfoRoleInfo.create(data, RoleInfo.findById(1))
        } else {
            flag = false
        }

        if (flag) {
            println "saved sucessfully"
        } else {
            println "error1!!"
        }
        render(view: "/home/home")
    }

    def index2 (){
        render(view: '/logIn/forgotPassword')
    }

    def forgotPassword() {
        def data = UserInfo.findByEmail(params.email)
       if (data){
            render(view: '/logIn/changePassword', model: [data: data, params: params])

        }
        else{
            println "  USERNAME NOT FOUND"
            redirect(action: 'index2')
        }
    }

    def changePassword(){
        print "params>>>" +params
        def data = UserInfo.findByEmail(params.email)
        data.password = params.password2
        data.save(flush: true)

        if (data.validate())
        {
            println "After password change"
            render(view: '/logIn/auth')
        }
        else{
            println " can not perform task"
        }

    }


}


