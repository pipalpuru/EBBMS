package wecare

import grails.gorm.DetachedCriteria
import groovy.transform.ToString

import org.codehaus.groovy.util.HashCodeHelper
import grails.compiler.GrailsCompileStatic

@GrailsCompileStatic
@ToString(cache=true, includeNames=true, includePackage=false)
class UserInfoRoleInfo implements Serializable {

	private static final long serialVersionUID = 1

	UserInfo userInfo
	RoleInfo roleInfo

	@Override
	boolean equals(other) {
		if (other instanceof UserInfoRoleInfo) {
			other.userInfoId == userInfo?.id && other.roleInfoId == roleInfo?.id
		}
	}

    @Override
	int hashCode() {
	    int hashCode = HashCodeHelper.initHash()
        if (userInfo) {
            hashCode = HashCodeHelper.updateHash(hashCode, userInfo.id)
		}
		if (roleInfo) {
		    hashCode = HashCodeHelper.updateHash(hashCode, roleInfo.id)
		}
		hashCode
	}

	static UserInfoRoleInfo get(long userInfoId, long roleInfoId) {
		criteriaFor(userInfoId, roleInfoId).get()
	}

	static boolean exists(long userInfoId, long roleInfoId) {
		criteriaFor(userInfoId, roleInfoId).count()
	}

	private static DetachedCriteria criteriaFor(long userInfoId, long roleInfoId) {
		UserInfoRoleInfo.where {
			userInfo == UserInfo.load(userInfoId) &&
			roleInfo == RoleInfo.load(roleInfoId)
		}
	}

	static UserInfoRoleInfo create(UserInfo userInfo, RoleInfo roleInfo, boolean flush = false) {
		def instance = new UserInfoRoleInfo(userInfo: userInfo, roleInfo: roleInfo)
		instance.save(flush: flush)
		instance
	}

	static boolean remove(UserInfo u, RoleInfo r) {
		if (u != null && r != null) {
			UserInfoRoleInfo.where { userInfo == u && roleInfo == r }.deleteAll()
		}
	}

	static int removeAll(UserInfo u) {
		u == null ? 0 : UserInfoRoleInfo.where { userInfo == u }.deleteAll() as int
	}

	static int removeAll(RoleInfo r) {
		r == null ? 0 : UserInfoRoleInfo.where { roleInfo == r }.deleteAll() as int
	}

	static constraints = {
	    userInfo nullable: false
		roleInfo nullable: false, validator: { RoleInfo r, UserInfoRoleInfo ur ->
			if (ur.userInfo?.id) {
				if (UserInfoRoleInfo.exists(ur.userInfo.id, r.id)) {
				    return ['userRole.exists']
				}
			}
		}
	}

	static mapping = {
		id composite: ['userInfo', 'roleInfo']
		version false
	}
}
