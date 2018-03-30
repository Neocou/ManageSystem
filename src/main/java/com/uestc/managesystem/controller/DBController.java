package com.uestc.managesystem.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.uestc.managesystem.service.serviceInter.DBService;

@Controller
@Api(value = "数据库管理")
public class DBController {
	
	@Autowired
	private DBService dbService;
	/**
	 * 数据库管理
	 * 默认跳转
	 * @return
	 */
	@ApiOperation(value = "数据库管理入口",httpMethod = "GET")
	@RequestMapping(value = "/dbmanage" ,method = RequestMethod.GET)
	public String dbmanage(){
		return "dbManage/dbmanage";
	}

	/**
	 * 返回备份数据库文件
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	@ApiOperation(value = "下载数据库文件",httpMethod = "GET")
	@RequestMapping(value = "/download" ,method = RequestMethod.GET)
    public void downLoad(HttpServletRequest request,HttpServletResponse response) throws Exception{  
		dbService.backup();
        //需要下载的文件  
        String fileName = "C:/Users/Administrator/workspace/ManageSystem/src/main/webapp/assets/db/dbbackup.sql";
        //获取输入流  
        InputStream bis = new BufferedInputStream(new FileInputStream(new File(fileName)));
        String filename = "db.sql";
        //设置文件下载头
        response.addHeader("Content-Disposition", "attachment;filename=" + filename);
        //设置文件ContentType类型，这样设置，会自动判断下载文件类型
        response.setContentType("multipart/form-data");
        BufferedOutputStream out = new BufferedOutputStream(response.getOutputStream());
        int len = 0;
        while((len = bis.read()) != -1){  
            out.write(len);
            out.flush();
        }  
        out.close();
        bis.close();
    }  
	
	/**
	 * 数据库还原
	 * @param request
	 * @param file 上传sql文件
	 * @param model
	 * @return
	 */
	@ApiOperation(value = "上传数据库文件",httpMethod = "POST")
	@RequestMapping(value="/upload",method=RequestMethod.POST)
	public String uploadExcel(HttpServletRequest request,  MultipartFile file,Model model) {
		try {
			
			String path = "C:/Users/Administrator/workspace/ManageSystem/src/main/webapp/assets/db";
			String fileName = "dbrestore.sql";
			File f = new File(path, fileName);
			file.transferTo(f);
			dbService.restore();
		} catch (Exception e) {
			e.printStackTrace();

		}
		return "redirect:dbmanage?mesg=1" ;
	}
	

}
