package vn.iotstar.beautyshop.util;

import java.security.SecureRandom;
import org.mindrot.jbcrypt.BCrypt;

public class PasswordUtil {

	private static final String CHARS = "ABCDEFGHJKLMNPQRSTUVWXYZabcdefghijkmnpqrstuvwxyz23456789";

	// Sinh mật khẩu tạm (code)
	public static String randomPassword(int len) {
		SecureRandom rnd = new SecureRandom();
		StringBuilder sb = new StringBuilder();
		for (int i = 0; i < len; i++) {
			sb.append(CHARS.charAt(rnd.nextInt(CHARS.length())));
		}
		return sb.toString();
	}

	// Hash mật khẩu
	public static String hash(String rawPassword) {
		return BCrypt.hashpw(rawPassword, BCrypt.gensalt());
	}

	// Verify mật khẩu nhập vào với mật khẩu đã hash
	public static boolean verify(String rawPassword, String hashedPassword) {
		if (rawPassword == null || hashedPassword == null) {
			return false;
		}
		return BCrypt.checkpw(rawPassword, hashedPassword);
	}
}
