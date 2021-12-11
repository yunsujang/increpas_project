package mybatis.vo;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;
 
public class BbsVO {
	private String evcbbs_idx,
					evcbbs_title, 
					evcbbs_writer, 
					evcbbs_content,
					evcbbs_file_name,
					evcbbs_ori_name,
					evcbbs_write_date,
					evcbbs_ip,
					evcbbs_hit,
					evcbbs_status,
					evu_idx;
					//evbbsb_name;
 
	
	private List<CommentVO>comment_list; //현재글의 댓글들

	private MultipartFile file; //첨부파일
	
	public MultipartFile getFile() {
		return file;
	}
	
	public String getEvcbbs_idx() {
		return evcbbs_idx;
	}

	public void setEvcbbs_idx(String evcbbs_idx) {
		this.evcbbs_idx = evcbbs_idx;
	}

	public String getEvcbbs_title() {
		return evcbbs_title;
	}

	public void setEvcbbs_title(String evcbbs_title) {
		this.evcbbs_title = evcbbs_title;
	}

	public String getEvcbbs_writer() {
		return evcbbs_writer;
	}

	public void setEvcbbs_writer(String evcbbs_writer) {
		this.evcbbs_writer = evcbbs_writer;
	}

	public String getEvcbbs_content() {
		return evcbbs_content;
	}

	public void setEvcbbs_content(String evcbbs_content) {
		this.evcbbs_content = evcbbs_content;
	}

	public String getEvcbbs_file_name() {
		return evcbbs_file_name;
	}

	public void setEvcbbs_file_name(String evcbbs_file_name) {
		this.evcbbs_file_name = evcbbs_file_name;
	}

	public String getEvcbbs_ori_name() {
		return evcbbs_ori_name;
	}

	public void setEvcbbs_ori_name(String evcbbs_ori_name) {
		this.evcbbs_ori_name = evcbbs_ori_name;
	}

	public String getEvcbbs_write_date() {
		return evcbbs_write_date;
	}

	public void setEvcbbs_write_date(String evcbbs_write_date) {
		this.evcbbs_write_date = evcbbs_write_date;
	}

	public String getEvcbbs_ip() {
		return evcbbs_ip;
	}

	public void setEvcbbs_ip(String evcbbs_ip) {
		this.evcbbs_ip = evcbbs_ip;
	}

	public String getEvcbbs_hit() {
		return evcbbs_hit;
	}

	public void setEvcbbs_hit(String evcbbs_hit) {
		this.evcbbs_hit = evcbbs_hit;
	}

	public String getEvcbbs_status() {
		return evcbbs_status;
	}

	public void setEvcbbs_status(String evcbbs_status) {
		this.evcbbs_status = evcbbs_status;
	}

	public void setFile(MultipartFile file) {
		this.file = file;
	}
	
	public String getEvu_idx() {
		return evu_idx;
	}

	public void setEvu_idx(String evu_idx) {
		this.evu_idx = evu_idx;
	}

	public List<CommentVO> getComment_list() {
		return comment_list;
	}

	public void setComment_list(List<CommentVO> comment_list) {
		this.comment_list = comment_list;
	}

	
	
}
