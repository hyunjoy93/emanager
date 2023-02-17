package com.framework.ctl.controller;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.framework.cmm.helper.WebControllerHelper;
import com.framework.utl.BizUtil;

@Controller
public class CtlController extends WebControllerHelper {

	Logger log = LoggerFactory.getLogger(this.getClass());

	/**
	 * 로그아웃
	 * 
	 * @return ModelAndView
	 * @exception Exception
	 */
	@RequestMapping("/view/ctl/logout")
	public ModelAndView logout(ModelAndView mav, @RequestParam Map<String, Object> map, HttpServletRequest request)
			throws Exception {

		// 로그아웃
		BizUtil.logout(request);

		// 화면VIEW
		super.setViewName(mav, map, "lgn/login");

		return mav;
	}

	/**
	 * 관제 운영 관리 > 사용자 관리
	 * 
	 * @return ModelAndView
	 * @exception Exception
	 */
	@RequestMapping("/view/ctl/subControlMember")
	public ModelAndView subControlMember(ModelAndView mav, @RequestParam Map<String, Object> map,
			HttpServletRequest request) throws Exception {

		// 초기화
		super.setInit(mav, map, request);

		// 화면VIEW
		super.setViewName(mav, map, "ctl/subControlMember");

		return mav;
	}

	/**
	 * 관제 운영 관리 > 공지그룹 관리(SMS, Email)
	 * 
	 * @return ModelAndView
	 * @exception Exception
	 */
	@RequestMapping("/view/ctl/subControlContact")
	public ModelAndView subControlNotice(ModelAndView mav, @RequestParam Map<String, Object> map,
			HttpServletRequest request) throws Exception {

		// 초기화
		super.setInit(mav, map, request);

		// 화면VIEW
		super.setViewName(mav, map, "ctl/subControlContact");

		return mav;
	}

	/**
	 * 관제 운영 관리 > 운영자 메뉴얼(wiki)
	 * 
	 * @return ModelAndView
	 * @exception Exception
	 */
	@RequestMapping("/view/ctl/operatorManual")
	public String operatorManual(ModelAndView mav, @RequestParam Map<String, Object> map, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		// 초기화
		super.setInit(mav, map, request);

		// 세션체크
		// if() {
		//
		// }
		
		// 쿠기삭제
		Cookie cookie = new Cookie("jwt", null); // 삭제할 쿠키에 대한 값을 null로 지정
	    cookie.setMaxAge(0); // 유효시간을 0으로 설정해서 바로 만료
	    response.addCookie(cookie); // 응답에 추가해서 삭제
		
		// 서버ip가져오는 방식 -> url정보로 수정
		String HostInfo = request.getHeader("host");
		System.out.println("HostInfo :: " + HostInfo);
		
		String ClientIP = "";
		// xxx.xxx.xxx.xxx:7291
		if(HostInfo.contains(":")) {
			String[] HostInfoSplit = HostInfo.split(":");
			ClientIP = HostInfoSplit[0];
		}else {
			ClientIP = HostInfo;
		}
		System.out.println("IP :: " + ClientIP);

		//ClientIP = "10.217.192.15";

		// 권한 확인
		Map<String, String> loginUser = new HashMap<>();
		System.out.println(map.get("userGroup"));

		if (map.get("userGroup").equals("관리자")) {
			loginUser.put("username", "adminstrator@ktcdev.com");
			loginUser.put("password", "ktcWiki!#%");
		} else {
			loginUser.put("username", "only-reader@ktcdev.com");
			loginUser.put("password", "onlyRead!#%");
		}

		// 로그인할 계정 확인
		System.out.println("username :: " + loginUser.get("username"));
		System.out.println("password :: " + loginUser.get("password"));

		// json
		String sendData = ""; 
		sendData = "{\"query\":\"mutation {";
		sendData += "authentication {";
		sendData += "login(username:\\\"" + loginUser.get("username") + "\\\"";
		sendData += ", password:\\\"" + loginUser.get("password") + "\\\"";
		sendData += ", strategy: \\\"local\\\") ";
		sendData += "{responseResult {succeeded, errorCode, message}, jwt}";
		sendData += "}}\"}";

		System.out.println(sendData);

		String apiUrl = "http://" + ClientIP + ":3001/graphql";

		// restapi
		URL url = null;
		String readLine = null;
		StringBuilder buffer = null;
		OutputStream outputStream = null;
		BufferedReader bufferedReader = null;
		BufferedWriter bufferedWriter = null;
		HttpURLConnection urlConnection = null;

		int connTimeout = 5000;
		int readTimeout = 3000;

		try {
			url = new URL(apiUrl);

			urlConnection = (HttpURLConnection) url.openConnection();
			urlConnection.setRequestMethod("POST");
			urlConnection.setConnectTimeout(connTimeout);
			urlConnection.setReadTimeout(readTimeout);
			urlConnection.setRequestProperty("Content-Type", "application/json");
			urlConnection.setRequestProperty("charset", "UTF-8");
			urlConnection.setRequestProperty("Accept", "application/json");
			urlConnection.setDoInput(true);
			urlConnection.setDoOutput(true);
			urlConnection.setUseCaches(false);
			urlConnection.setInstanceFollowRedirects(true);

			outputStream = urlConnection.getOutputStream();

			bufferedWriter = new BufferedWriter(new OutputStreamWriter(outputStream));
			bufferedWriter.write(sendData);
			bufferedWriter.flush();

			buffer = new StringBuilder();
			if (urlConnection.getResponseCode() == HttpURLConnection.HTTP_OK) {
				bufferedReader = new BufferedReader(new InputStreamReader(urlConnection.getInputStream()));
				while ((readLine = bufferedReader.readLine()) != null) {
					buffer.append(readLine).append("\n");
				}
			} else {
				buffer.append("\"code\" : \"" + urlConnection.getResponseCode() + "\"");
				buffer.append(", \"message\" : \"" + urlConnection.getResponseMessage() + "\"");
				buffer.append(", \"error\" : \"" + urlConnection.getErrorStream() + "\"");
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			try {
				if (bufferedWriter != null) {
					bufferedWriter.close();
				}
				if (outputStream != null) {
					outputStream.close();
				}
				if (bufferedReader != null) {
					bufferedReader.close();
				}
			} catch (Exception ex) {
				ex.printStackTrace();
			}
		}

		System.out.println("결과 : " + buffer.toString());

		JSONObject JSONresult = new JSONObject(buffer.toString());

		String loginSucces = JSONresult.getJSONObject("data").getJSONObject("authentication").getJSONObject("login")
				.getJSONObject("responseResult").get("succeeded").toString();

		System.out.println("loginSucces :: " + loginSucces);

		String redirectURL = "";
		if (loginSucces.equals("true")) {
			String jwt = JSONresult.getJSONObject("data").getJSONObject("authentication").getJSONObject("login")
					.get("jwt").toString();

			cookie = new Cookie("jwt", jwt);
			cookie.setDomain(ClientIP);
			cookie.setPath("/");
			cookie.setHttpOnly(true);
			cookie.setSecure(false);

			response.addCookie(cookie);
			
			//String encodedParam = URLEncoder.encode("위키-문법", "UTF-8");
			
			redirectURL = "redirect:http://" + ClientIP + ":3001/";//+encodedParam;

		} else {
			// 연결실패
			redirectURL = "redirect:/view/dsb/main";
		}
		System.out.println(redirectURL);
		
		return redirectURL;
	}
}
