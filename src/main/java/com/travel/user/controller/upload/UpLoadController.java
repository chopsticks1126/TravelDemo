package com.travel.user.controller.upload;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.springframework.core.io.support.PropertiesLoaderUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Controller
@RequestMapping("/upLoadController")
public class UpLoadController {
	/**
	 * 璺宠浆鍒颁笂娆″拰涓嬭浇鐨勭晫闈�
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping("/uploadJsp.do")
	// url=http://localhost:8080/TravelDemo/upLoadController/uploadJsp.do
	public String uploadJsp(Model model, HttpServletRequest request) {
		// this.getServletContext().getRealPath("/WEB-INF/upload");
		String uploadFilePath = "d:\\temp\\imooc\\";
		// 瀛樺偍瑕佷笅杞界殑鏂囦欢鍚�
		Map<String, String> fileNameMap = new HashMap<String, String>();
		// 閫掑綊閬嶅巻filepath鐩綍涓嬬殑鎵�湁鏂囦欢鍜岀洰褰曪紝灏嗘枃浠剁殑鏂囦欢鍚嶅瓨鍌ㄥ埌map闆嗗悎涓�
		listfile(new File(uploadFilePath), fileNameMap);// File鏃㈠彲浠ヤ唬琛ㄤ竴涓枃浠朵篃鍙互浠ｈ〃涓�釜鐩綍
		// 灏哅ap闆嗗悎鍙戦�鍒發istfile.jsp椤甸潰杩涜鏄剧ず
		request.setAttribute("fileNameMap", fileNameMap);
		return "/upload/upload";
	}

	/**
	 * 鎵归噺涓婁紶鍔熻兘
	 * @param multiRequest
	 * @return
	 */
	@RequestMapping(value = "/doUploadFile")	// url=http://localhost:8080/TravelDemo/upLoadController/doUploadFile.do
	public String doUploadFile(MultipartHttpServletRequest multiRequest) {
		Iterator<String> filesNames = multiRequest.getFileNames(); 		// 鑾峰緱鎵�湁鐨勬枃浠跺悕
		while (filesNames.hasNext()) { 									// 杩唬锛屽鍗曚釜鏂囦欢杩涜鎿嶄綔
			String fileName = filesNames.next();
			MultipartFile file = multiRequest.getFile(fileName);
			if (!file.isEmpty()) {
				try {
					InputStream  in =file.getInputStream();
					String path = file.getOriginalFilename();
					File uploadfile = new File("d:\\temp\\imooc\\"+path);
					FileOutputStream fos = new FileOutputStream(uploadfile);
					BufferedOutputStream bos =new BufferedOutputStream(fos);
					int b=-1;
					
					byte [] buffer =new byte[1024];
					while ((b=in.read(buffer))!=-1){
						bos.write(buffer,0,b);
					}
					bos.flush();
					bos.close();
					fos.close();
					in.close();
//					FileUtils.copyInputStreamToFile(file.getInputStream(),
//							new File("d:\\temp\\imooc\\",file.getOriginalFilename()));
				} catch (IOException e) {
					e.printStackTrace();
				}
			}

		}
		return "/upload/success"; 			// 涓婁紶鎴愬姛鍒欒烦杞嚦姝uccess.jsp椤甸潰
	}
	/**
	 * 涓嬭浇鏂囦欢
	 * @param request
	 * @param response
	 */
	@RequestMapping(value = "/downDate.do")
	public void downDate(HttpServletRequest request, HttpServletResponse response) throws Exception{
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		FileInputStream in = null;
		OutputStream out = null;
		// 寰楀埌瑕佷笅杞界殑鏂囦欢鍚�
		String fileName = request.getParameter("filename"); // 23239283-92489-闃垮嚒杈�avi
		try {
			fileName = new String(fileName.getBytes("iso8859-1"), "UTF-8");
			// fileSaveRootPath=this.getServletContext().getRealPath("/WEB-INF/upload");
			String fileSaveRootPath = "d:\\temp\\imooc\\"; 							// 涓婁紶鐨勬枃浠跺強涓嬭浇淇濆瓨鐨勮矾寰�
			String path = findFileSavePathByFileName(fileName, fileSaveRootPath); 	// 閫氳繃鏂囦欢鍚嶆壘鍑烘枃浠剁殑鎵�湪鐩綍
			File file = new File(fileSaveRootPath + "\\" + fileName); 
//			File file = new File(path + "\\" + fileName); 							// 寰楀埌瑕佷笅杞界殑鏂囦欢
			if (!file.exists()) { // 濡傛灉鏂囦欢涓嶅瓨鍦�
				request.setAttribute("message", "");
				return;
			}
			String realname = fileName.substring(fileName.indexOf("_") + 1);		// 澶勭悊鏂囦欢鍚�
			response.setHeader("content-disposition", "attachment;filename=" + URLEncoder.encode(realname, "UTF-8"));// 璁剧疆鍝嶅簲澶达紝鎺у埗娴忚鍣ㄤ笅杞借鏂囦欢
//			in = new FileInputStream(path + "\\" + fileName);// 璇诲彇瑕佷笅杞界殑鏂囦欢锛屼繚瀛樺埌鏂囦欢杈撳叆娴�
			in = new FileInputStream(fileSaveRootPath + "\\" + fileName);// 璇诲彇瑕佷笅杞界殑鏂囦欢锛屼繚瀛樺埌鏂囦欢杈撳叆娴�
			out = response.getOutputStream();			// 鍒涘缓杈撳嚭娴�
			byte buffer[] = new byte[1024];				// 鍒涘缓缂撳啿鍖�
			int len = 0;
			while ((len = in.read(buffer)) > 0) {		// 寰幆灏嗚緭鍏ユ祦涓殑鍐呭璇诲彇鍒扮紦鍐插尯褰撲腑
				out.write(buffer, 0, len);				// 杈撳嚭缂撳啿鍖虹殑鍐呭鍒版祻瑙堝櫒锛屽疄鐜版枃浠朵笅杞�
			}
			in.close(); 		// 鍏抽棴鏂囦欢杈撳叆娴�
			out.close(); 		// 鍏抽棴杈撳嚭娴�
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * @Method: findFileSavePathByFileName
	 * @Description: 閫氳繃鏂囦欢鍚嶅拰瀛樺偍涓婁紶鏂囦欢鏍圭洰褰曟壘鍑鸿涓嬭浇鐨勬枃浠剁殑鎵�湪璺緞
	 * @param filename 瑕佷笅杞界殑鏂囦欢鍚�
	 * @param saveRootPath 涓婁紶鏂囦欢淇濆瓨鐨勬牴鐩綍
	 * @return 瑕佷笅杞界殑鏂囦欢鐨勫瓨鍌ㄧ洰褰�
	 */
	public String findFileSavePathByFileName(String filename, String saveRootPath) {
		int hashcode = filename.hashCode();
		int dir1 = hashcode & 0xf; // 0--15
		int dir2 = (hashcode & 0xf0) >> 4; // 0-15
		String dir = saveRootPath + "\\" + dir1 + "\\" + dir2; // upload\2\3
		File file = new File(dir);
		if (!file.exists()) {
			// 鍒涘缓鐩綍
			file.mkdirs();
		}
		return dir;
	}

	/**
	 * @Method: listfile
	 * @Description: 閫掑綊閬嶅巻鎸囧畾鐩綍涓嬬殑鎵�湁鏂囦欢
	 * @param file  鍗充唬琛ㄤ竴涓枃浠讹紝涔熶唬琛ㄤ竴涓枃浠剁洰褰�
	 * @param map 瀛樺偍鏂囦欢鍚嶇殑Map闆嗗悎
	 */
	public void listfile(File file, Map<String, String> map) {
		// 濡傛灉file浠ｈ〃鐨勪笉鏄竴涓枃浠讹紝鑰屾槸涓�釜鐩綍
		if (!file.isFile()) {
			// 鍒楀嚭璇ョ洰褰曚笅鐨勬墍鏈夋枃浠跺拰鐩綍
			File files[] = file.listFiles();
			// 閬嶅巻files[]鏁扮粍
			for (File f : files) {
				// 閫掑綊
				listfile(f, map);
			}
		} else {
			/**
			 * 澶勭悊鏂囦欢鍚嶏紝涓婁紶鍚庣殑鏂囦欢鏄互uuid_鏂囦欢鍚嶇殑褰㈠紡鍘婚噸鏂板懡鍚嶇殑锛屽幓闄ゆ枃浠跺悕鐨剈uid_閮ㄥ垎
			 * file.getName().indexOf("_")妫�储瀛楃涓蹭腑绗竴娆″嚭鐜�_"瀛楃鐨勪綅缃紝濡傛灉鏂囦欢鍚嶇被浼间簬锛�
			 * 9349249849-88343-8344_寮�彂鏂囨。.text
			 * 閭ｄ箞file.getName().substring(file.getName().indexOf("_")+1)
			 * 澶勭悊涔嬪悗灏卞彲浠ュ緱鍒板紑鍙戞枃妗�text閮ㄥ垎
			 */
			String realName = file.getName().substring(file.getName().indexOf("_") + 1);
			// file.getName()寰楀埌鐨勬槸鏂囦欢鐨勫師濮嬪悕绉帮紝杩欎釜鍚嶇О鏄敮涓�殑锛屽洜姝ゅ彲浠ヤ綔涓簁ey锛宺ealName鏄鐞嗚繃鍚庣殑鍚嶇О锛屾湁鍙兘浼氶噸澶�
			map.put(file.getName(), realName);
		}
	}
}
