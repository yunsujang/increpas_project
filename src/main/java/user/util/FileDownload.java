package user.util;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class FileDownload
 * 
 * 웹상에서 /FileDownload로 호출 할 수 있도록 web.xml에
 * servlet으로 등록하고 servlet-mapping으로 연결해야 한다.
 * 근데...
 * STS가 이걸 다~ 해주네~^^
 */
public class FileDownload extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FileDownload() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 파라미터 값들 받기(dir, filename)
		String dir = request.getParameter("dir");
		//System.out.println(dir);
		String evbbs_file_name = request.getParameter("filename");
		
		// dir은 파일이 저장되는 위치다. 이것을 절대경로화 시킨다.
		String realPath = getServletContext().getRealPath("/resources/"+dir);
		//System.out.println(realPath); //민우의힘!
		// 다시 파일명과 연결하여 전체경로를 만들자
		//String fullPath = realPath+"/"+filename;
		String fullPath = realPath+System.getProperty("file.separator")+evbbs_file_name;
		
		//System.out.println(fullPath);
		//전체 경로가 준비되었으니 파일을 보내기 위해 파일 객체를 생성하자!
		File f = new File(fullPath);
		if(f.exists() && f.isFile()) {
			//File객체가 실제 경로에 존재하고, 파일일경우에만 수행한다.
			
			byte[] buf = new byte[2048];
			
			//전송할 데이터가 스트림 처리될때 문자셋 지정!
			response.setContentType("application/octet-stream; charset=8859_1");
			
			//다운로드 대화상자 처리
			response.setHeader("Content-Disposition", "attachment;filename="+
					new String(evbbs_file_name.getBytes(),"8859_1"));
			
			//전송타입이 이진데이터(binary)
			response.setHeader("Content-Transfer-Encoding", "binary");
			
			BufferedInputStream bis = new BufferedInputStream(
					new FileInputStream(f));
			
			//요청한 곳으로 보내기 위해 스트림을 응답객체로부터 얻어낸다.
			BufferedOutputStream bos = new BufferedOutputStream(
					response.getOutputStream());
			
			int size = -1;
			try {
				//읽어오자마자 쓰기 한다.
				while((size = bis.read(buf)) != -1) {
					bos.write(buf, 0, size);// 보내기
					bos.flush();// 스트림 비우기
				}//end while
				
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				if(bos != null)
					bos.close();
				if(bis != null)
					bis.close();
			}
			
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
