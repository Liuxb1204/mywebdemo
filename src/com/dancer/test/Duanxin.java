package com.dancer.test;

import org.apache.commons.httpclient.Header;
import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.NameValuePair;
import org.apache.commons.httpclient.methods.PostMethod;



public class Duanxin {
	public static void main(String[] args)throws Exception  {
		  
			HttpClient client = new HttpClient();
			PostMethod post = new PostMethod("http://sms.webchinese.cn/web_api/");
			post.addRequestHeader("Content-Type",
			"application/x-www-form-urlencoded;charset=utf-8");// ��ͷ�ļ�������ת��
			NameValuePair[] data = { new NameValuePair("Uid", "dancer"), // ע����û���
			new NameValuePair("Key", "797916"), // ע��ɹ���,��¼��վʹ�õ���Կ
			new NameValuePair("smsMob", "15732174319"), // �ֻ�����
			new NameValuePair("smsText", "��֤���ǣ�7788") };
			post.setRequestBody(data);
			  
			client.executeMethod(post);
			Header[] headers = post.getResponseHeaders();
			int statusCode = post.getStatusCode();
			System.out.println("statusCode:" + statusCode);
			for (Header h : headers) {
			System.out.println(h.toString());
			}
			String result = new String(post.getResponseBodyAsString().getBytes(
			"utf-8"));
			System.out.println(result);
			post.releaseConnection();	
	}
}
