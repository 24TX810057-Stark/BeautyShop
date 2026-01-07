package vn.iotstar.beautyshop.security;

import org.mindrot.jbcrypt.BCrypt;

public class PasswordUtil {

	// Hash mật khẩu (dùng khi register / đổi mật khẩu)
	public static String hash(String plainPassword) {
		return BCrypt.hashpw(plainPassword, BCrypt.gensalt(12));
	}

	// So sánh mật khẩu (dùng khi login)
	public static boolean verify(String plainPassword, String hashedPassword) {
		return BCrypt.checkpw(plainPassword, hashedPassword);
	}

}
