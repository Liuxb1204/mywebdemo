package com.dancer.util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class MD5Util {
	public static String encodeValue(String str){
		StringBuilder sb=new StringBuilder();
		try {
			//创建 MessageDigest
			MessageDigest md=MessageDigest.getInstance("md5");//MD5 SHA
			//加密 
			byte[] digest = md.digest(str.getBytes());//md5 ->  16 位字节数组  SHA -> 20 位字节数组
			
			//将加密结果 --> sb 
			// byte -> -128  ~ 127 -> 0~255 范围 
			for (int i = 0; i < digest.length; i++) {
				byte b = digest[i];
				
				int intValue=b&0xff;  // 0`255 范围
				if(intValue<16){
					sb.append(0);
				}
				sb.append(Integer.toHexString(intValue));
				
			}
			
			
						
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return sb.toString();
	}
}
