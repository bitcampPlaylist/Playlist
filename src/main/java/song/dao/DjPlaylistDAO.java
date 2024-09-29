package song.dao;

import java.io.IOException;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import song.bean.SongPalylistDTO;


public class DjPlaylistDAO {
	private SqlSessionFactory sqlSessionFactory;
	private static DjPlaylistDAO instance = new DjPlaylistDAO();
	
	public static DjPlaylistDAO getInstance() {
		return instance;
	}
	
	public DjPlaylistDAO() {
		try {
			Reader reader = Resources.getResourceAsReader("mybatis-config.xml");
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	
//	-------------------------------------------------------
	
	public SongPalylistDTO selectDJPlayList(int id) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		SongPalylistDTO songPalylistDTO = sqlSession.selectOne("songSQL.selectDJPlayList", id);
		sqlSession.close();
		return songPalylistDTO;
	}
	
}
