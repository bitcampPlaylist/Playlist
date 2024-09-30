package musicplayer.service;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

import musicplayer.bean.Song;
import musicplayer.dao.SongDAO;
import songlist.bean.SonglistDTO;

public class GetSongService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		//데이터
		
		//DB
		SongDAO songDAO = SongDAO.getInstance();
		SonglistDTO songlistDTO = songDAO.getSongById(id);
		//int song_id_int = songDAO.getSongById(id);
		
		// JSON 형식으로 응답
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");

		try (PrintWriter out = response.getWriter()) { // PrintWriter를 try-with-resources로 사용
		    out.print("{");
		    out.print("\"song_id\":" + songlistDTO.getSong_id() + ",");
		    out.print("\"song_name\":\"" + songlistDTO.getSong_name() + "\",");
		    out.print("\"song_artist\":\"" + songlistDTO.getSong_artist() + "\",");
		    out.print("\"song_albumart\":\"" + songlistDTO.getSong_albumart() + "\",");
		    out.print("\"song_file_name\":\"" + songlistDTO.getSong_file_name() + "\"");
		    out.print("}");
		    out.flush(); // 모든 데이터를 플러시
		}

        return null; // 뷰 이름을 반환할 필요 없음

	}
}

