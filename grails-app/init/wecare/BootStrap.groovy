package wecare

class BootStrap {

    def init = { servletContext ->

        if (UserInfo.count == 0) {
            def adminRole = new RoleInfo(authority: 'ROLE_ADMIN').save(flush: true)
            def userRole = new RoleInfo(authority: 'ROLE_USER').save(flush: true)

            def testAdmin = new UserInfo(username: 'admin1', password: 'admin1', name:'purushottam', email:'admin1@email.com').save(flush: true)
            def testUser = new UserInfo(username: 'user1', password: 'user1', name:'purushottam', email:'user1@email.com').save(flush: true)

            UserInfoRoleInfo.create testAdmin, adminRole
            UserInfoRoleInfo.create testUser, userRole


            UserInfoRoleInfo.withSession {
                it.flush()
                it.clear()
            }
        }


    }
    def destroy = {
    }
}
