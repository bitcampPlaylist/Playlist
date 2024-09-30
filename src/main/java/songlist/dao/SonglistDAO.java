package songlist.dao;

import java.io.IOException;
import java.io.Reader;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import songupload.bean.SonguploadDTO;

public class SonglistDAO {
	private SqlSessionFactory sqlSessionFactory;
	private static SonglistDAO instance = new SonglistDAO();
	
	public static SonglistDAO getInstance() {
		return instance;
	}
	
	public SonglistDAO() {
		try {
			Reader reader = Resources.getResourceAsReader("mybatis-config.xml");
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
    public List<SonguploadDTO> getAllSong() {
        SqlSession sqlSession = sqlSessionFactory.openSession();
        List<SonguploadDTO> songList = sqlSession.selectList("songlistSQL.getAllSong");
        sqlSession.close();
        return songList;
    }

}









