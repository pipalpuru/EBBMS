package wecare

class Book {
    String title
    String authorEmail

    static constraints = {
        title(blank: false)
        authorEmail(nullable: true, email: true)
    }
}
