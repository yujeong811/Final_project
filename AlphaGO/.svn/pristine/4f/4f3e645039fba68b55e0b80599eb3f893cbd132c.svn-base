package kr.or.ddit.interceptor;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import kr.or.ddit.command.PopupRegistCommand;
import kr.or.ddit.dto.PopAttachVO;
import kr.or.ddit.dto.PopupVO;
import kr.or.ddit.service.PopupService;

public class PopupIntercepter extends HandlerInterceptorAdapter{
	private static final Logger logger = LoggerFactory.getLogger(PopupIntercepter.class);

	//팝업 정보를 불러오기위해 서비스 set해줌
	private PopupService popupService;
	//팝업 첨부파일을 보내기 위해 저장경로를 set해줌
	private String savePath;
	
	public void setPopupService(PopupService popupService) {
		this.popupService = popupService;
	}
	public void setSavePath(String savePath) {
		this.savePath = savePath;
	}
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		//preHandle의 리턴값은 boolean이며 true일 떄 실행됨
		 HttpSession session = request.getSession();
	        
	        if(session.getAttribute("loginUser") != null) {
	        
	            // 기존 HttpSession에 남아있는 정보가 있는 경우 이를 삭제
	            logger.info("clear login data before");
	            session.removeAttribute("loginUser");
	        }
	        return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, 
			Object handler, ModelAndView modelAndView) throws Exception {
		//사용유무가 Y이며 팝업 기간에 오늘 날짜가 포함된 팝업 -> 쿼리로 해결함
		PopupVO popup = popupService.selectUsePopup();
		if(popup!=null) {//null 체크
			//팝업의 첨부파일을 가져오기
			PopupRegistCommand usePopup = popupService.getPopup(popup.getPopcode());
			List<PopAttachVO> attachList = usePopup.getAttachList();
			if(attachList != null) {
				for(PopAttachVO attach : attachList) {
					String fileName = attach.getFilename().split("\\$\\$")[1];
					attach.setFilename(fileName);
				}
				if(attachList.size()>0) {//첨부파일 있으면 세팅
					usePopup.setAttachList(attachList);
				}
			}
			if(usePopup!=null) {//null 체크
				//사용중인 팝업이 있으면 model에 담아준다.
				modelAndView.addObject("popup", usePopup);
			}
		}
	}
	
}









