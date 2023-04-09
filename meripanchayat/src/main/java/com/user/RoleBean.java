package com.user;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name = "trx_roles")
public class RoleBean implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
	@Id
	public int roleId;
	public String roleName;
	
	@OneToMany(cascade = CascadeType.ALL,fetch=FetchType.LAZY,mappedBy="role")
	@JsonIgnore
	private Set<UserRoleBean> userRoles = new HashSet<UserRoleBean>();

	public int getRoleId() {
		return roleId;
	}

	public void setRoleId(int roleId) {
		this.roleId = roleId;
	}

	public String getRoleName() {
		return roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

	public Set<UserRoleBean> getUserRoles() {
		return userRoles;
	}

	public void setUserRoles(Set<UserRoleBean> userRoles) {
		this.userRoles = userRoles;
	}

	@Override
	public String toString() {
		return "Role [roleId=" + roleId + ", roleName=" + roleName + ", userRoles=" + userRoles + "]";
	}
	
	
	
	
}
