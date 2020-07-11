package cn.tea.pojo;
/**
 * ��Ʒ���ʵ����
 * @author asus
 *@����ʱ�䣺2020��6��29������7:00:16
 */

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
public class Product {
	private int pid;//��Ʒid
	private String pname;//��Ʒ����
	private String img;//��ƷͼƬ
	private Double originalPrice;//��Ʒԭ��
	private Double discountPrice;//��Ʒ�ۿۼ�
	private int tid;//��Ʒ���id
	private String describe;//��Ʒ���
	private int collect;//��Ʒ�ղ���
	private int view;//��Ʒ�����
	private int mid;//��Ʒ������id
	private Date createTime;//��Ʒ�Ĵ���ʱ��
	private int createBy;//��Ʒ�������
	private Date modifyTime;//��Ʒ���޸�ʱ��
	private int modifyBy;//��Ʒ���޸���
	private Producttype producttype;//��Ʒ����ʵ��
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public Double getOriginalPrice() {
		return originalPrice;
	}
	public void setOriginalPrice(Double originalPrice) {
		this.originalPrice = originalPrice;
	}
	public Double getDiscountPrice() {
		return discountPrice;
	}
	public void setDiscountPrice(Double discountPrice) {
		this.discountPrice = discountPrice;
	}
	public int getTid() {
		return tid;
	}
	public void setTid(int tid) {
		this.tid = tid;
	}
	public String getDescribe() {
		return describe;
	}
	public void setDescribe(String describe) {
		this.describe = describe;
	}
	public int getMid() {
		return mid;
	}
	public void setMid(int mid) {
		this.mid = mid;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public int getCreateBy() {
		return createBy;
	}
	public void setCreateBy(int createBy) {
		this.createBy = createBy;
	}
	public Date getModifyTime() {
		return modifyTime;
	}
	public void setModifyTime(Date modifyTime) {
		this.modifyTime = modifyTime;
	}
	public int getModifyBy() {
		return modifyBy;
	}
	public void setModifyBy(int modifyBy) {
		this.modifyBy = modifyBy;
	}
	public Producttype getProducttype() {
		return producttype;
	}
	public void setProducttype(Producttype producttype) {
		this.producttype = producttype;
	}
	public Product(String pname, int tid) {
		super();
		this.pname = pname;
		this.tid = tid;
	}
	
	
}
