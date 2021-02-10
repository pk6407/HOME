package com.coffeesazo.qna.model.dao;

import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;

import com.coffeesazo.qna.model.vo.QnAVo;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;


public class FileUpload {
	// saveDir => upload 폴더 Properties 내 주소 
	public static final String saveDir = "C:\\Users\\jeyoonji\\semiproject\\kh-semiproject\\backend\\Coffeesazo\\WebContent\\view\\upload\\";
	int maxSize = 1024*1024*100; // 100mb;
	String encoding = "utf-8";
	MultipartRequest  mul;
	String sysFile = "";
	String oriFile = "";

	public FileUpload(HttpServletRequest req) {

		try {
			mul = new MultipartRequest(req, saveDir, maxSize, encoding, new DefaultFileRenamePolicy());

			// 업로드된 파일명 바꾸는 방법
			Enumeration<String> en = mul.getFileNames();
			while(en.hasMoreElements()) {
				String tag = (String)en.nextElement();
				sysFile = mul.getFilesystemName(tag); // 수정된 파일명
				oriFile = mul.getOriginalFileName(tag); // 원본 파일명

				//System.out.println("원본 파일명 : " + oriFile); -> 파일명 변경 되는지 확인차 출력해봄.
				//System.out.println("변경 파일명 : " + sysFile);		
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}				
	}
}

/*
 * public QnAVo getphoto() { QnAVo vo = new QnAVo(); //
 * vo.setQnaTitle(mul.getParameter("QNA_TITLE")); //
 * vo.setQnaText(mul.getParameter("QNA_TEXT")); vo.setQnaImage(sysFile);
 * 
 * return vo; } }
 */
 