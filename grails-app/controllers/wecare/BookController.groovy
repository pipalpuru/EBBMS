package wecare

import org.springframework.security.access.annotation.Secured


@Secured(['permitAll'])
class BookController {
    def index() {
        render(view: '/book/index')
    }

    def save() {
        println("params>>>" +params)
        def data = new Book()
        data.title = params.bookName
        data.authorEmail = params.authorName
        data.save(flush: true)

        if (!data.validate()) {
            data.errors.each { error ->}
            println errors
        }
        redirect(action: 'index')
    }

}
