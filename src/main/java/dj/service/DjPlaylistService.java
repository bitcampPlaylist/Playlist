package dj.service;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

import song.bean.SongDjList;
import song.bean.SongPlaylistDTO;
import song.dao.DjPlaylistDAO;
import songlist.bean.SonglistDTO;

public class DjPlaylistService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
	// 데이터
		int id = 1; //몇번때 눌렀는지 넘오올 것 
	// db
		DjPlaylistDAO djPlaylistDAO = DjPlaylistDAO.getInstance();
		SongPlaylistDTO songPlaylistDTO = djPlaylistDAO.selectDJPlayList(id);
		// 곡 가져오기 
		List<SongDjList> list = new ArrayList<SongDjList>();
		list = djPlaylistDAO.selectSongDjList(id);
		
		List<SonglistDTO> songlist = new ArrayList<SonglistDTO>();
		for(SongDjList dto : list) {
			int song_id = dto.getSong_id();
			SonglistDTO songlistDTO = new SonglistDTO();
			songlistDTO = djPlaylistDAO.selectSong(song_id);
			System.out.println(songlistDTO.getSong_name());
			songlist.add(songlistDTO);
		}
		
		System.out.println(songPlaylistDTO);
		System.out.println(list);

	// 뿌리기 
		request.setAttribute("songPalylistDTO", songPlaylistDTO);
		request.setAttribute("songlist", songlist);
		
		return "/dj/djPlaylist.jsp";
	}

}
