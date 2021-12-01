package mybatis.vo;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class BbsVO {
	private String evbbs_idx,
					evbbs_title, 
					evbbs_writer, 
					evbbs_content,
					evbbs_file_name,
					evbbs_ori_name,
					evbbs_write_date,
					evbbs_ip,
					evbbs_hit,
					evbbs_status,
					evcategory_idx,
					evu_idx;
					//evbbsb_name;

	
	private List<CommentVO>comment_list; //현재글의 댓글들

	private MultipartFile file; //첨부파일
	

	
	public MultipartFile getFile() {
		return file;
	}

	public void setFile(MultipartFile file) {
		this.file = file;
	}
	
	

	public String getEvbbs_idx() {
		return evbbs_idx;
	}

	public void setEvbbs_idx(String evbbs_idx) {
		this.evbbs_idx = evbbs_idx;
	}

	public String getEvbbs_title() {
		return evbbs_title;
	}

	public void setEvbbs_title(String evbbs_title) {
		this.evbbs_title = evbbs_title;
	}

	public String getEvbbs_writer() {
		return evbbs_writer;
	}

	public void setEvbbs_writer(String evbbs_writer) {
		this.evbbs_writer = evbbs_writer;
	}

	public String getEvbbs_content() {
		return evbbs_content;
	}

	public void setEvbbs_content(String evbbs_content) {
		this.evbbs_content = evbbs_content;
	}

	public String getEvbbs_file_name() {
		return evbbs_file_name;
	}

	public void setEvbbs_file_name(String evbbs_file_name) {
		this.evbbs_file_name = evbbs_file_name;
	}

	public String getEvbbs_ori_name() {
		return evbbs_ori_name;
	}

	public void setEvbbs_ori_name(String evbbs_ori_name) {
		this.evbbs_ori_name = evbbs_ori_name;
	}

	public String getEvbbs_write_date() {
		return evbbs_write_date;
	}

	public void setEvbbs_write_date(String evbbs_write_date) {
		this.evbbs_write_date = evbbs_write_date;
	}

	public String getEvbbs_ip() {
		return evbbs_ip;
	}

	public void setEvbbs_ip(String evbbs_ip) {
		this.evbbs_ip = evbbs_ip;
	}

	public String getEvbbs_hit() {
		return evbbs_hit;
	}

	public void setEvbbs_hit(String evbbs_hit) {
		this.evbbs_hit = evbbs_hit;
	}

	public String getEvbbs_status() {
		return evbbs_status;
	}

	public void setEvbbs_status(String evbbs_status) {
		this.evbbs_status = evbbs_status;
	}

	public String getEvcategory_idx() {
		return evcategory_idx;
	}

	public void setEvcategory_idx(String evcategory_idx) {
		this.evcategory_idx = evcategory_idx;
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
