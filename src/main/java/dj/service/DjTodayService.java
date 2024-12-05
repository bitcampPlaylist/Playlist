package dj.service;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

import song.bean.SongPlaylistDTO;
import song.dao.DjPlaylistDAO;

public class DjTodayService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
	
	// 데이터
		
	// db
		DjPlaylistDAO djPlaylistDAO = DjPlaylistDAO.getInstance();
		
		List<SongPlaylistDTO> list = new ArrayList<>();
		list = djPlaylistDAO.selectDJPlayListList();
		System.out.println(list);
	// 뿌리기 
		request.setAttribute("list", list);
		
		return "/dj/djToday.jsp";
	}

}
