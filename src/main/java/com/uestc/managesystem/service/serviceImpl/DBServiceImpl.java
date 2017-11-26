package com.uestc.managesystem.service.serviceImpl;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.UnsupportedEncodingException;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.uestc.managesystem.service.serviceInter.DBService;

@Service
public class DBServiceImpl implements DBService {

	
	
	/**
	 * 数据库备份
	 */
	@Transactional
	@Override
	public void backup() {
		// TODO Auto-generated method stub
		try {
			Runtime rt = Runtime.getRuntime();
			Process child = rt.exec("C:\\Program Files\\MySQL\\MySQL Server 5.7\\bin\\mysqldump -h localhost -uroot -ppassword managesystem");
			InputStream in = child.getInputStream();
			InputStreamReader xx = new InputStreamReader(in,"utf-8");
			String inStr;
			StringBuffer sb = new StringBuffer("");
			String outStr;
			BufferedReader br = new BufferedReader(xx);
			while ((inStr = br.readLine()) != null) {
				sb.append(inStr + "\r\n");
				}
				outStr = sb.toString();
				
				// 要用来做导入用的目标文件：
			FileOutputStream fout = new FileOutputStream("C:/Users/Administrator/workspace/ManageSystem/src/main/webapp/assets/db/dbbackup.sql");
			OutputStreamWriter writer = new OutputStreamWriter(fout, "utf-8");
			writer.write(outStr);
			writer.flush();
			in.close();
			xx.close();
			br.close();
			writer.close();
			fout.close();
			
		} catch (Exception e) {
			// TODO: handle exception
		}
	}

	/**
	 * 数据库还原
	 */
	@Transactional
	@Override
	public void restore() {
		// TODO Auto-generated method stub
		try {
			Runtime runtime = Runtime.getRuntime();
			Process process = runtime
			.exec("C:\\Program Files\\MySQL\\MySQL Server 5.7\\bin\\mysql.exe -hlocalhost -uroot -ppassword --default-character-set=utf8 managesystem");
			OutputStream outputStream = process.getOutputStream();
			BufferedReader br = new BufferedReader(new InputStreamReader(new FileInputStream("C:/Users/Administrator/workspace/ManageSystem/src/main/webapp/assets/db/dbrestore.sql"), "utf-8"));
			String str = null;
			StringBuffer sb = new StringBuffer();
			while ((str = br.readLine()) != null) {
					sb.append(str + "\r\n");
			}
			str = sb.toString();
			OutputStreamWriter writer = new OutputStreamWriter(outputStream,"utf-8");
			writer.write(str);
			writer.flush();
			outputStream.close();
			br.close();
			writer.close();
			} catch (UnsupportedEncodingException e) {e.printStackTrace();} 
			  catch (FileNotFoundException e) {e.printStackTrace();} 
			  catch (IOException e) {e.printStackTrace();}
	}

}
