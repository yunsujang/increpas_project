package user.util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Random;

import org.codehaus.jackson.impl.ByteSourceBootstrapper;

public class SecureUtil {
	
	public static String getEncrypt(String pwd, String str) {
		// 반환할 객체
		String result = null;
		byte[] salt = str.getBytes();
		
		// 사용자가 전달한 값도 byte형 배열로 변환
		byte[] a = pwd.getBytes();
		
		// 사용자가 전달한 값을 byte배열로 변환한 길이와 salt의 길이를 합쳐 하나의 배열을 생성하자
		byte [] bytes = new byte[a.length+salt.length];
		
		// 사용자가 입력한 값과 salt의 값을 통합된 배열에 저장 
		System.arraycopy(a, 0, bytes, 0, a.length);
					// value, valueStartIndex, target, targetStartIndex, valueLength  
		System.arraycopy(salt, 0, bytes, a.length, salt.length);
		
		try {
			MessageDigest md = MessageDigest.getInstance("SHA-256");
			md.update(bytes);
			
			byte[] byteData = md.digest();
			
			StringBuffer sb = new StringBuffer();
			for(int i=0; i < byteData.length; i++)
				sb.append(Integer.toString((byteData[i]) & 0xFF +256,16).substring(1));
			
			result = sb.toString();
			
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public static String generateSalt() {
		Random random = new Random();
		byte[] salt = new byte[8];
		random.nextBytes(salt);
		
		StringBuffer sb = new StringBuffer();
		for(Byte n : salt) {
			// 바이트 값을 Hex값으로 변환
			String str = String.format("%02x", n);
			sb.append(str);
		}
		
		return sb.toString();
	}
}
