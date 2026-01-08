package vn.iotstar.beautyshop.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class User {

	private int id;
	private String email;
	private String phone;
	private String password;
	private String fullName;
	private String role;
	private int status;
	private boolean isTempPassword;
}
