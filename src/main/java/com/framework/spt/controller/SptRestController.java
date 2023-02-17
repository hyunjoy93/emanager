package com.framework.spt.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.framework.cmm.dto.PagingDto;
import com.framework.cmm.helper.WebControllerHelper;
import com.framework.spt.service.SptService;

@RestController
public class SptRestController extends WebControllerHelper{
	
	Logger log = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private SptService sptService;
	
	/**
	 * 목록
	 * 
	 * @param Map<String, Object> map
	 * @param HttpServletRequest request
	 * @return json
	 * @exception Exception
	 */
	@RequestMapping(value="/api/spt/list", method=RequestMethod.POST)
	public Map<String, Object> list(@RequestParam Map<String, Object> map, HttpServletRequest request, PagingDto pagingDto) throws Exception {

		try {
			// 초기화
			super.setInit(map, request);
			
			//공지사항
			super.setPagingList(map, request, pagingDto, "NoticeList", sptService.selectNotice(map));
			
		}catch(Exception ex) {
			super.setResFail(map, request, ex);
		}

		return map;
	}
	
	/**
	 * 상세팝업
	 * 
	 * @param Map<String, Object> map
	 * @param HttpServletRequest request
	 * @return json
	 * @exception Exception
	 */
	@RequestMapping(value="/api/spt/detail", method=RequestMethod.POST)
	public Map<String, Object> detail(@RequestParam Map<String, Object> map, HttpServletRequest request) throws Exception {

		try {
			// 초기화
			super.setInit(map, request);
			
			int idx = Integer.parseInt(String.valueOf(map.get("idx")));
			
			//공지사항 상세
			super.setInfo(map, request, "NoticeDetail", sptService.selectNoticeDetail(idx));
			
		}catch(Exception ex) {
			super.setResFail(map, request, ex);
		}

		return map;
	}
	
	/**
	 * 공지사항 등록
	 * 
	 * @param Map<String, Object> map
	 * @param HttpServletRequest request
	 * @return json
	 * @exception Exception
	 */
	@RequestMapping(value="/api/spt/regist", method=RequestMethod.POST)
	public Map<String, Object> regist(@RequestParam Map<String, Object> map, HttpServletRequest request) throws Exception {
		
		super.setInit(map, request);
		
		int idx = sptService.selectMaxIdx();
		
		map.put("idx", idx);
		System.out.println("====================insertMap======================="+map.toString());
		
		int insRes = sptService.insertNotice(map);
		
		if(insRes > 0) {
			map.put("insertResult", "successed");
		} else {
			map.put("insertResult", "failed");
		}
		return map;
	}
	
	/**
	 * 공지사항 삭제
	 * 
	 * @param Map<String, Object> map
	 * @param HttpServletRequest request
	 * @return json
	 * @exception Exception
	 */
	@RequestMapping(value="/api/spt/delete", method=RequestMethod.POST)
	public Map<String, Object> delete(@RequestParam Map<String, Object> map, HttpServletRequest request) throws Exception {
		
		super.setInit(map, request);
		
		int idx = Integer.parseInt(String.valueOf(map.get("idx")));
		
		int delRes = sptService.deleteNotice(idx);
		
		if(delRes > 0) {
			map.put("deleteResult", "successed");
		} else {
			map.put("deleteResult", "failed");
		}
		return map;
	}
	
	/**
	 * 공지사항 수정
	 * 
	 * @param Map<String, Object> map
	 * @param HttpServletRequest request
	 * @return json
	 * @exception Exception
	 */
	@RequestMapping(value="/api/spt/update", method=RequestMethod.POST)
	public Map<String, Object> update(@RequestParam Map<String, Object> map, HttpServletRequest request) throws Exception {
		
		super.setInit(map, request);
		
		int updRes = sptService.updateNotice(map);
		
		if(updRes > 0) {
			map.put("updateResult", "successed");
		} else {
			map.put("updateResult", "failed");
		}
		return map;
	}
	
	/**
	 * VOC 등록
	 * 
	 * @param Map<String, Object> map
	 * @param HttpServletRequest request
	 * @return json
	 * @exception Exception
	 */
	@RequestMapping(value="/api/spt/registVoc", method=RequestMethod.POST)
	public Map<String, Object> registVoc(@RequestParam Map<String, Object> map, HttpServletRequest request) throws Exception {
		
		super.setInit(map, request);
		
		int insRes = sptService.insertVoc(map);
		
		if(insRes > 0) {
			map.put("insertResult", "successed");
		} else {
			map.put("insertResult", "failed");
		}
		return map;
	}
	
	/**
	 * 목록
	 * 
	 * @param Map<String, Object> map
	 * @param HttpServletRequest request
	 * @return json
	 * @exception Exception
	 */
	@RequestMapping(value="/api/spt/vocList", method=RequestMethod.POST)
	public Map<String, Object> vocList(@RequestParam Map<String, Object> map, HttpServletRequest request, PagingDto pagingDto) throws Exception {

		try {
			// 초기화
			super.setInit(map, request);
			
			//공지사항
			super.setPagingList(map, request, pagingDto, "VocList", sptService.selectVocList(map));
			
		}catch(Exception ex) {
			super.setResFail(map, request, ex);
		}

		return map;
	}
	
	/**
	 * FAQ
	 * 
	 * @param Map<String, Object> map
	 * @param HttpServletRequest request
	 * @return json
	 * @exception Exception
	 */
	@RequestMapping(value="/api/spt/faqList", method=RequestMethod.POST)
	public Map<String, Object> faqList(@RequestParam Map<String, Object> map, HttpServletRequest request, PagingDto pagingDto) throws Exception {

		try {
			// 초기화
			super.setInit(map, request);
			
			//공지사항
			super.setPagingList(map, request, pagingDto, "FaqList", sptService.selectFaq(map));
			
		}catch(Exception ex) {
			super.setResFail(map, request, ex);
		}

		return map;
	}
	
	/**
	 * FAQ 상세팝업
	 * 
	 * @param Map<String, Object> map
	 * @param HttpServletRequest request
	 * @return json
	 * @exception Exception
	 */
	@RequestMapping(value="/api/spt/faqDetail", method=RequestMethod.POST)
	public Map<String, Object> faqDetail(@RequestParam Map<String, Object> map, HttpServletRequest request) throws Exception {

		try {
			// 초기화
			super.setInit(map, request);
			
			int bbsTxnId = Integer.parseInt(String.valueOf(map.get("bbsTxnId")));
			
			//공지사항
			super.setInfo(map, request, "FaqDetail", sptService.selectFaqDetail(bbsTxnId));
			
		}catch(Exception ex) {
			super.setResFail(map, request, ex);
		}

		return map;
	}
	
	/**
	 * FAQ 수정
	 * 
	 * @param Map<String, Object> map
	 * @param HttpServletRequest request
	 * @return json
	 * @exception Exception
	 */
	@RequestMapping(value="/api/spt/updateFaq", method=RequestMethod.POST)
	public Map<String, Object> updateFaq(@RequestParam Map<String, Object> map, HttpServletRequest request) throws Exception {
		
		super.setInit(map, request);
		
		int updRes = sptService.updateFaq(map);
		
		if(updRes > 0) {
			map.put("updateResult", "successed");
		} else {
			map.put("updateResult", "failed");
		}
		return map;
	}
	
	/**
	 * FAQ 삭제
	 * 
	 * @param Map<String, Object> map
	 * @param HttpServletRequest request
	 * @return json
	 * @exception Exception
	 */
	@RequestMapping(value="/api/spt/deleteFaq", method=RequestMethod.POST)
	public Map<String, Object> deleteFaq(@RequestParam Map<String, Object> map, HttpServletRequest request) throws Exception {
		
		super.setInit(map, request);
		
		int bbsTxnId = Integer.parseInt(String.valueOf(map.get("bbsTxnId")));
		
		int delRes = sptService.deleteFaq(bbsTxnId);
		
		if(delRes > 0) {
			map.put("deleteResult", "successed");
		} else {
			map.put("deleteResult", "failed");
		}
		return map;
	}
	
	/**
	 * FAQ 등록
	 * 
	 * @param Map<String, Object> map
	 * @param HttpServletRequest request
	 * @return json
	 * @exception Exception
	 */
	@RequestMapping(value="/api/spt/insertFaq", method=RequestMethod.POST)
	public Map<String, Object> insertFaq(@RequestParam Map<String, Object> map, HttpServletRequest request) throws Exception {
		
		super.setInit(map, request);
		
		int insRes = sptService.insertFaq(map);
		
		if(insRes > 0) {
			map.put("insertResult", "successed");
		} else {
			map.put("insertResult", "failed");
		}
		return map;
	}
	/**
	 * FAQ 파일 업로드
	 * FAQ 파일 업로드 기능 추가 보류 20221205
	 * @param Map<String, Object> map
	 * @param MultipartHttpServletRequest request
	 * @return json
	 * @exception Exception
	 */
//	@RequestMapping(value="api/spt/faqFileUpload")
//	public Map<String, Object> uploadTest(MultipartHttpServletRequest request, HttpServletResponse response) throws Exception {
//		MultipartFile file = null;
//		Iterator<String> iterator = request.getFileNames();
//		if (iterator.hasNext()) {
//			file = request.getFile(iterator.next());
//			System.out.println(file);
//		}
//	    String name = request.getParameter("name");
//	    
//	    return null; // do nothing 
//	}
	

	/**
	 * 상세팝업
	 * 
	 * @param Map<String, Object> map
	 * @param HttpServletRequest request
	 * @return json
	 * @exception Exception
	 */
	@RequestMapping(value="/api/spt/vocDetail", method=RequestMethod.POST)
	public Map<String, Object> vocDetail(@RequestParam Map<String, Object> map, HttpServletRequest request) throws Exception {

		try {
			// 초기화
			super.setInit(map, request);
			
			int txnId = Integer.parseInt(String.valueOf(map.get("txn_id")));
			
			// VOC 조회수 +1
			sptService.updateViewCnt(txnId);
			
			//VOC 상세
			super.setInfo(map, request, "vocDetail", sptService.selectVocDetail(txnId));
			
		}catch(Exception ex) {
			super.setResFail(map, request, ex);
		}

		return map;
	}
	
	/**
	 * VOC 수정
	 * 
	 * @param Map<String, Object> map
	 * @param HttpServletRequest request
	 * @return json
	 * @exception Exception
	 */
	@RequestMapping(value="/api/spt/updateVoc", method=RequestMethod.POST)
	public Map<String, Object> updateVoc(@RequestParam Map<String, Object> map, HttpServletRequest request) throws Exception {
		
		super.setInit(map, request);
		
		int updRes = sptService.updateVoc(map);
		
		if(updRes > 0) {
			map.put("updateResult", "successed");
		} else {
			map.put("updateResult", "failed");
		}
		return map;
	}
	
	/**
	 * VOC 삭제
	 * 
	 * @param Map<String, Object> map
	 * @param HttpServletRequest request
	 * @return json
	 * @exception Exception
	 */
	@RequestMapping(value="/api/spt/deleteVoc", method=RequestMethod.POST)
	public Map<String, Object> deleteVoc(@RequestParam Map<String, Object> map, HttpServletRequest request) throws Exception {
		
		super.setInit(map, request);
		
		int txnId = Integer.parseInt(String.valueOf(map.get("txn_id")));
		
		int delRes = sptService.deleteVoc(txnId);
		
		if(delRes > 0) {
			map.put("deleteResult", "successed");
		} else {
			map.put("deleteResult", "failed");
		}
		return map;
	}
	
	/**
	 * VOC 답변 등록
	 * 
	 * @param Map<String, Object> map
	 * @param HttpServletRequest request
	 * @return json
	 * @exception Exception
	 */
	@RequestMapping(value="/api/spt/updateAns", method=RequestMethod.POST)
	public Map<String, Object> updateAns(@RequestParam Map<String, Object> map, HttpServletRequest request) throws Exception {
		
		super.setInit(map, request);
		
		int updRes = sptService.updateAns(map);
		
		if(updRes > 0) {
			map.put("insertResult", "successed");
		} else {
			map.put("insertResult", "failed");
		}
		return map;
	}
	
	/**
	 * VOC 답변 select
	 * 
	 * @param Map<String, Object> map
	 * @param HttpServletRequest request
	 * @return json
	 * @exception Exception
	 */
	@RequestMapping(value="/api/spt/getAns", method=RequestMethod.POST)
	public Map<String, Object> getAns(@RequestParam Map<String, Object> map, HttpServletRequest request) throws Exception {

		try {
			// 초기화
			super.setInit(map, request);
			
			int pId = Integer.parseInt(String.valueOf(map.get("pId")));
			
			//답변
			super.setInfo(map, request, "vocAns", sptService.selectAns(pId));
			
		}catch(Exception ex) {
			super.setResFail(map, request, ex);
		}

		return map;	
	}
	
	/**
	 * VOC 답변 댓글 리스트
	 * 
	 * @param Map<String, Object> map
	 * @param HttpServletRequest request
	 * @return json
	 * @exception Exception
	 */
	@RequestMapping(value="/api/spt/getreplyList", method=RequestMethod.POST)
	public Map<String, Object> getreplyList(@RequestParam Map<String, Object> map, HttpServletRequest request) throws Exception {

		try {
			// 초기화
			super.setInit(map, request);
			
			int txnId = Integer.parseInt(String.valueOf(map.get("txnId")));
			
			//답변 목록
			super.setList(map, request, "replyList", sptService.selectReplList(txnId));
			
		}catch(Exception ex) {
			super.setResFail(map, request, ex);
		}

		return map;	
	}
	
	/**
	 * VOC 답변 댓글삭제
	 * 
	 * @param Map<String, Object> map
	 * @param HttpServletRequest request
	 * @return json
	 * @exception Exception
	 */
	@RequestMapping(value="/api/spt/deleteRepl", method=RequestMethod.POST)
	public Map<String, Object> deleteRepl(@RequestParam Map<String, Object> map, HttpServletRequest request) throws Exception {
		
		super.setInit(map, request);
		
		int replId = Integer.parseInt(String.valueOf(map.get("replId")));
		
		int delReplRes = sptService.deleteRepl(replId);
		
		if(delReplRes > 0) {
			map.put("deleteResult", "successed");
		} else {
			map.put("deleteResult", "failed");
		}
		return map;
	}
	
	/**
	 * VOC 답변 댓글등록
	 * 
	 * @param Map<String, Object> map
	 * @param HttpServletRequest request
	 * @return json
	 * @exception Exception
	 */
	@RequestMapping(value="/api/spt/insertRepl", method=RequestMethod.POST)
	public Map<String, Object> insertRepl(@RequestParam Map<String, Object> map, HttpServletRequest request) throws Exception {
		
		super.setInit(map, request);
		
		int insRes = sptService.insertRepl(map);
		
		if(insRes > 0) {
			map.put("insertResult", "successed");
		} else {
			map.put("insertResult", "failed");
		}
		return map;
	}
	
}
