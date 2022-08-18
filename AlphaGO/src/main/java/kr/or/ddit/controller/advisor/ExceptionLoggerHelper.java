package kr.or.ddit.controller.advisor;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Component;

import kr.or.ddit.dto.MemberVO;

@Component("exceptionLoggerHelper")
public class ExceptionLoggerHelper {

	@Resource(name="errorLogPath")
	private String errorLogPath;
	
	public void write(HttpServletRequest request, Exception e, String classType) {
		
		String savePath = errorLogPath.replace("/", File.separator);
		String logFilePath = savePath+File.separator+"system_exception_log.csv";
		
		String url = request.getRequestURI().replace(request.getContextPath(), "");
		String date = new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new Date());
		String loginUserName
				= ((MemberVO)request.getSession().getAttribute("loginUser")).getName();
		String exceptionType = e.getClass().getName();
		
		String log = "[Error : " + exceptionType + "]" + url + "," + date + ","
					+ loginUserName + "," + classType + "\n";
		
		// 로그 파일 생성
		File file = new File(savePath);
		file.mkdirs();
		
		try {
			BufferedWriter out = new BufferedWriter(new FileWriter(logFilePath, true));
			
			out.write(log);
			out.newLine();
			
			out.close();
		} catch (IOException exception) {
			exception.printStackTrace();
		}
		
	}
}
/*
 *ㅋㅋㅋㅋㅋㅋㅋ싫은데 
 *아아앙 토요일ㄹ이데;;;
 *얌마 내꺼가 맞다고
 *
 *ㅇㄴㅁㅇㄴㅇㄴㅇㄴ
 *ㄴㄴ
 *ㄴㅇ
 *ㅇ
 *
 *ㅇㅇ
 *ㅇ
 */
/*ㅁㄴㅇㅇㅁㄴ&^*^&*^&*^&*^&*&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&*/
//아아아아/123123123123123