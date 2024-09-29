package dj.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

import song.bean.SongPalylistDTO;
import song.dao.DjPlaylistDAO;

public class DjPlaylistService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// 데이터
		int id = 1; //몇번때 눌렀는지 넘오올 것 
		// db
		DjPlaylistDAO djPlaylistDAO = DjPlaylistDAO.getInstance();
		SongPalylistDTO songPalylistDTO = djPlaylistDAO.selectDJPlayList(id); 
		
		// 뿌리기 
		request.setAttribute("songPalylistDTO", songPalylistDTO);
		
		return "/dj/djPlaylist.jsp";
	}

}
