//package my.garden.controller;
//
//import javax.servlet.http.HttpSession;
//
//import org.aspectj.lang.ProceedingJoinPoint;
//import org.aspectj.lang.annotation.Around;
//import org.aspectj.lang.annotation.Aspect;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Component;
//import org.springframework.web.servlet.ModelAndView;
//
//@Component
//@Aspect
//public class LoginAdviser {
//	@Autowired
//	private HttpSession session;
//	
//	@Around("execution(* my.garden.controller.LoginController.*(..))")
//	public Object loginCheck(ProceedingJoinPoint pjp) throws Throwable{
//		if(session.getAttribute("loginId") == null) {
//			ModelAndView mav = new ModelAndView();
//			mav.addObject("msg", "�α����� ���� �������ּ���");
//			mav.setViewName("index");
//			return mav; //���ϰ��� ModelAndView�Ƿ� execution(* kh.spring.practice.HomeController.join(..)) ���� ���ԵǴ� �ֵ鵵 ModelAndView�� ���ϰ��� �ٲ�� ��
//		} else {
//			return pjp.proceed();
//		}
//	}
//	
//}
