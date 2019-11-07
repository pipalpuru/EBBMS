package wecare

import groovy.transform.EqualsAndHashCode
import groovy.transform.ToString
import grails.compiler.GrailsCompileStatic

@GrailsCompileStatic
@EqualsAndHashCode(includes='username')
@ToString(includes='username', includeNames=true, includePackage=false)
class UserInfo implements Serializable {

    private static final long serialVersionUID = 1

    String name
    String email
    String phone
    String address
    String gender
    String username
    String password
    String bloodgroup
    String age
    Byte[] profileimage
    Date lastdonateddate
    Date nextdnationdate
    String expDate



    boolean enabled = true
    boolean accountExpired
    boolean accountLocked
    boolean passwordExpired

    Set<RoleInfo> getAuthorities() {
        (UserInfoRoleInfo.findAllByUserInfo(this) as List<UserInfoRoleInfo>)*.roleInfo as Set<RoleInfo>
    }

    static constraints = {
        password nullable: false, blank: false, password: true
        username nullable: false, blank: false, unique: true
        name nullable: true
        bloodgroup nullable: true
        email nullable: true
        phone nullable: true
        address nullable: true
        gender nullable: true
        age nullable: true
        profileimage nullable: true
        lastdonateddate nullable: true
        nextdnationdate nullable: true
        expDate nullable: true

    }

    static mapping = {
        password column: '`password`'
    }
}
