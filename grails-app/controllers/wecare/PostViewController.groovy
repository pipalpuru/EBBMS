/*
package wecare

import grails.plugin.springsecurity.annotation.Secured


@Secured(['permitAll'])
class PostViewController {

    def springSecurityService

    def index() {
        render(view: 'postView')
    }

    def postView() {
        UserInfo user = (UserInfo) springSecurityService.getCurrentUser()
        def view = AdminDomain.findById(params.id)
        def view2 = AdminDomain.list()
        def comment = Comment.findAllByPostId(params.id)
        [view: view, comment: comment, user: user, view2:view2]

    }

    def displayBlogImage(){
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

    def displayProfileImage() {
        def file = Image.findById(params.id)
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

    def displayCoverImage() {
        def file = Image.findById(params.id)
        println "file>>>" + file
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

    def saveComment() {
        println "comment>>>"+ params
        def data = new Comment()
        data.commentName = params.commentName
        data.comment = params.comment
        data.postId = params.postId
        data.save(flush: true)

        redirect(action: 'postView', params: [id: params.postId])
    }
}
*/
