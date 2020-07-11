package cn.tea.dao;
/**
 * ����ģ��Ľӿ�
 * @author asus
 *@����ʱ�䣺2020��7��3������7:52:22
 */

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import cn.tea.pojo.Blog;
import cn.tea.pojo.Blogcomments;
import cn.tea.pojo.Blogtype;
@Repository
public interface BlogDao {
	//������в�����Ϣ�ķ���������ģ����ѯ����ҳ�Ͷ������
	List<Blog> getBlogList(@Param("tid")int tid,@Param("btitle") String btitle);
	
	//������в��ͷ�����Ϣ�ķ���,����ģ����ѯ����ҳ�Ȳ���
	List<Blogtype> getBlogtypeList(@Param("tname")String tname);
	
	//������в���������Ϣ�ķ���������ģ����ѯ����ҳ��
	List<Blogcomments> getBlogCommentsList(@Param("btitle")String btitle);
	
	//ɾ��������Ϣ�ķ���
	@Delete("delete from tea_blog where bid=#{bid}")
	int deleteBlog(@Param("bid") int bid);
		
	//����id������͵�����Ϣ�ķ���
	Blog findById(@Param("bid") int bid);
	
	//���Ӳ��ͷ�����Ϣ�ķ���
	@Insert("insert into tea_blogtype(tname,createBy,createTime)"
			+ "values(#{tname},#{createBy},#{createTime})")
	int addBlogtype(Blogtype blogtype);
	
	//ɾ�����ͷ�����Ϣ��������
	@Delete("delete from tea_blogtype where tid=#{tid}")
	int deleteBlogtype(@Param("tid") int tid);
	
	//�޸Ĳ��ͷ�����Ϣ�ķ���
	@Update("update tea_blogtype set tname=#{tname},modifyBy=#{modifyBy},modifyTime=#{modifyTime}"
			+ "where tid=#{tid}")
	int updateBlogtype(Blogtype type);
	
	//����id���Ҳ��ͷ�����Ϣ�ķ���
	@Select("select * from tea_blogtype where tid=#{tid}")
	Blogtype findBytypeId(@Param("tid") int tid);
	
	//����ɾ��������Ϣ�ķ���
	int deleteManyBlog(List<Integer> d);
	
	//����ɾ�����ͷ�����Ϣ�ķ���
	int deleteManyOfBlogType(List<Integer> d);
	
	//����ɾ������
	int deleteManyOfBlogComment(List<Integer> d);
	
	//����id��ѯ����������Ϣ�ķ���
	Blogcomments getBlogCommentById(@Param("cid")int cid);
	
	//ɾ�����������������ݵķ���
	@Delete("delete from tea_blogcomments where cid=#{cid}")
	int deleteBlogComment(int cid);

	
}
