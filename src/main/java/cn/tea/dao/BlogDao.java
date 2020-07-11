package cn.tea.dao;
/**
 * 博客模块的接口
 * @author asus
 *@创建时间：2020年7月3日上午7:52:22
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
	//获得所有博客信息的方法，包含模糊查询，分页和多表联查
	List<Blog> getBlogList(@Param("tid")int tid,@Param("btitle") String btitle);
	
	//获得所有博客分类信息的方法,包含模糊查询，分页等操作
	List<Blogtype> getBlogtypeList(@Param("tname")String tname);
	
	//获得所有博客评论信息的方法，包含模糊查询，分页等
	List<Blogcomments> getBlogCommentsList(@Param("btitle")String btitle);
	
	//删除博客信息的方法
	@Delete("delete from tea_blog where bid=#{bid}")
	int deleteBlog(@Param("bid") int bid);
		
	//根据id查出博客单条信息的方法
	Blog findById(@Param("bid") int bid);
	
	//增加博客分类信息的方法
	@Insert("insert into tea_blogtype(tname,createBy,createTime)"
			+ "values(#{tname},#{createBy},#{createTime})")
	int addBlogtype(Blogtype blogtype);
	
	//删除博客分类信息（单条）
	@Delete("delete from tea_blogtype where tid=#{tid}")
	int deleteBlogtype(@Param("tid") int tid);
	
	//修改博客分类信息的方法
	@Update("update tea_blogtype set tname=#{tname},modifyBy=#{modifyBy},modifyTime=#{modifyTime}"
			+ "where tid=#{tid}")
	int updateBlogtype(Blogtype type);
	
	//根据id查找博客分类信息的方法
	@Select("select * from tea_blogtype where tid=#{tid}")
	Blogtype findBytypeId(@Param("tid") int tid);
	
	//批量删除博客信息的方法
	int deleteManyBlog(List<Integer> d);
	
	//批量删除博客分类信息的方法
	int deleteManyOfBlogType(List<Integer> d);
	
	//批量删除博客
	int deleteManyOfBlogComment(List<Integer> d);
	
	//根据id查询博客评论信息的方法
	Blogcomments getBlogCommentById(@Param("cid")int cid);
	
	//删除单个博客评论数据的方法
	@Delete("delete from tea_blogcomments where cid=#{cid}")
	int deleteBlogComment(int cid);

	
}
