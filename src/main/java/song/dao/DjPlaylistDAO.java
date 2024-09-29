package song.dao;

import java.io.IOException;
import java.io.Reader;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import song.bean.SongDjList;
import song.bean.SongPlaylistDTO;
import songlist.bean.SonglistDTO;


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
	
	public SongPlaylistDTO selectDJPlayList(int id) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		SongPlaylistDTO songPlaylistDTO = sqlSession.selectOne("songSQL.selectDJPlayList", id);
		sqlSession.close();
		return songPlaylistDTO;
	}

	public List<SongDjList> selectSongDjList(int id) {
		List<SongDjList> list = new ArrayList<SongDjList>();
		SqlSession sqlSession = sqlSessionFactory.openSession();
		list = sqlSession.selectList("songSQL.selectSongDjList", id);
		sqlSession.close();
		return list;
	}

	public SonglistDTO selectSong(int song_id) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		SonglistDTO songlistDTO = sqlSession.selectOne("songSQL.selectSong", song_id);
		return songlistDTO;
	}
	
}
