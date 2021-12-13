package user.util;

import java.io.File;

public class FileRenameUtil {

	public static String checkSameFileName(String evbbs_file_name, String path) {
		//인자인 evbbs_file_name에서 확장자를 뺀 파일명 가려내자!
		//우선 "."의 위치를 알아내야 한다.
		int period = evbbs_file_name.lastIndexOf("."); // test123.txt --> 7
		 
		String f_name = evbbs_file_name.substring(0, period); // test123
		String suffix = evbbs_file_name.substring(period); // .txt
		
		//전체 경로
		String saveFileName = path + System.getProperty("file.separator") +evbbs_file_name;
		
		File f = new File(saveFileName);
		
		//같은 이름이 있을 경우 파일명 뒤에 숫자를 붙여준다.
		int idx = 1;
		while(f != null && f.exists()) {
			
			//파일이 이미 존재하므로 이름을 변경하자!
			StringBuffer sb = new StringBuffer();
			sb.append(f_name);
			sb.append(idx++); //변경된 이름이 있을 수도 있으므로 idx값을 일단 1 증가시킴!
			sb.append(suffix);
			
			evbbs_file_name = sb.toString(); // test1231.txt
			
			saveFileName = path + System.getProperty("file.separator") +evbbs_file_name;
			
			f = new File(saveFileName);
			
		}//while의 끝
		
		return evbbs_file_name;
	}
}






