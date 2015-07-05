package com.eagle.web.test;

import java.io.File;

import org.apache.struts2.ServletActionContext;

public class FileTest {
	public static void main(String[] args) {
//		String path=ServletActionContext.
//		getServletContext().getRealPath("/");
		File file= new File("/home/king");
		
		System.out.println(file.canRead());
		File[] listFiles = file.listFiles();
		int i=0;
		int j=0;
		for(File f:listFiles){
			System.out.println(f);
			i++;
		}
		System.out.println(i);
		String[] list = file.list();
		for(String s:list){
			System.out.println(s);
			j++;
		}
		System.out.println(j);
	}
}
