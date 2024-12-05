package songupload.dao;

import java.io.IOException;
import java.io.Reader;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import songupload.bean.SonguploadDTO;

public class SonguploadDAO {
	private SqlSessionFactory sqlSessionFactory;
	private static SonguploadDAO instance = new SonguploadDAO();
	
	public static SonguploadDAO getInstance() {
		return instance;
	}
	
	public SonguploadDAO() {
		try {
			Reader reader = Resources.getResourceAsReader("mybatis-config.xml");
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public void fileupload(SonguploadDTO songuploadDTO) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		sqlSession.insert("songuploadSQL.fileupload", songuploadDTO);
		sqlSession.commit();
		sqlSession.close();		
	}

}









