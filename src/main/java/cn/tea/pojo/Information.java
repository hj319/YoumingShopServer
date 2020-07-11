package cn.tea.pojo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Information {

	private Integer iid;
	private int uid;
	private String ititle;
	private String infor;
	private String reply;
	private Date sendTime;
	private User user;
	
}
