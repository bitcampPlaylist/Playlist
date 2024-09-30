package musicplayer.dao;

import musicplayer.bean.Song;
import songlist.bean.SonglistDTO;

import java.io.IOException;
import java.io.Reader;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import member.bean.MemberDTO;

public class SongDAO {
	private SqlSessionFactory sqlSessionFactory;
	private static SongDAO instance = new SongDAO();
	
	public static SongDAO getInstance() {
		return instance;
    }
	
	public SongDAO() {
		try {
			Reader reader = Resources.getResourceAsReader("mybatis-config.xml");
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

    	System.out.println(song_id);
    	SqlSession sqlSession = sqlSessionFactory.openSession();
        SonglistDTO songlistDTO = sqlSession.selectOne("musicplayerSQL.loadSong", song_id);
        System.out.println(songlistDTO);
        sqlSession.close();	
        return songlistDTO;
        
    }

}
