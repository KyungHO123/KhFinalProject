package kr.kh.team3.model.vo;

import lombok.NoArgsConstructor;

import lombok.Data;

@Data
@NoArgsConstructor
public class FileVO {
	private int fi_num;
	  private int fi_po_num;
	  private String fi_name;
	  private String fi_ori_name;
	  static final String [] imgExtensions = {".jpg", ".png", ".bmp", ".gif",".avif"};
	  
	  public FileVO(int fi_po_num, String fi_name, String fi_ori_name) {
	    this.fi_po_num = fi_po_num;
	    this.fi_name = fi_name;
	    this.fi_ori_name = fi_ori_name;
	  }
	  
	  public boolean isImg() {
	    if(fi_ori_name == null) {
	      return false;
	    }
	    for(String imgExtensions : imgExtensions) {
	      if(fi_ori_name.endsWith(imgExtensions)) {
	        return true;
	      }
	    }
	    return false;
	  }
}
