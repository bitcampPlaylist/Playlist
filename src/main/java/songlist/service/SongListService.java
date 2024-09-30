package songlist.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.control.CommandProcess;

import songlist.dao.SonglistDAO;
import songupload.bean.SonguploadDTO;

public class SongListService implements CommandProcess {

    @Override
    public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
        SonglistDAO songlistDAO = SonglistDAO.getInstance();
        List<SonguploadDTO> songList = songlistDAO.getAllSong();

        StringBuilder jsonBuilder = new StringBuilder();
        jsonBuilder.append("[");

        for (int i = 0; i < songList.size(); i++) {
            SonguploadDTO song = songList.get(i);
            jsonBuilder.append("{")
                        .append("\"song_name\":\"").append(song.getSong_name()).append("\",") // 제목 
                        .append("\"song_artist\":\"").append(song.getSong_artist()).append("\"") // 가수
//                        .append("\"song_album\":\"").append(song.getSong_album()).append("\"") // 앨범
                        .append("}");
            if (i < songList.size() - 1) {
                jsonBuilder.append(",");
            }
        }

        jsonBuilder.append("]");

        response.setContentType("application/json; charset=UTF-8");
        response.getWriter().print(jsonBuilder.toString());

        return "none";
    }

}
