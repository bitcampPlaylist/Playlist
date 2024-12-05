package songupload.service;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import songupload.bean.SonguploadDTO;
import songupload.dao.SonguploadDAO;

public class SongUploadService implements CommandProcess {
    private String bucketName = "bitcamp-9th-storage-144";

    @Override
    public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
        // 임시 저장 폴더
        String tempFolder = request.getServletContext().getRealPath("/storage/temp");
        String realFolderMusic = request.getServletContext().getRealPath("/storage/music");
        String realFolderAlbum = request.getServletContext().getRealPath("/storage/album");

        // MultipartRequest 생성
        MultipartRequest multi = new MultipartRequest(
                request,
                tempFolder, // 임시로 파일을 저장할 폴더
                10 * 1024 * 1024, // 10MB
                "UTF-8",
                new DefaultFileRenamePolicy());

        // 데이터 추출
        String song_name = multi.getParameter("song_name");
        String song_artist = multi.getParameter("song_artist");
        String song_album = multi.getParameter("song_album");
        String song_tag = multi.getParameter("song_tag");
        int song_traknum = Integer.parseInt(multi.getParameter("song_traknum"));
        int titleyn = Integer.parseInt(multi.getParameter("titleyn"));
        int song_playcount = 0;

        // 파일 생성 관련
        String song_file_name = multi.getOriginalFileName("song_file_name");
        String song_albumart_file_name = multi.getOriginalFileName("song_albumart_file");

        // 파일 객체 생성 (임시 폴더에서 생성된 파일)
        File song_file = new File(tempFolder, song_file_name);
        File album_file = new File(tempFolder, song_albumart_file_name);

        // NCPObjectStorageService 인스턴스 생성
        NCPObjectStorageService ncp = new NCPObjectStorageService();

        // 먼저 파일을 업로드한 후 임시 파일을 삭제
        try {
            // 음악 파일을 storage/music 경로로 업로드
            song_file_name = ncp.uploadFile("bitcamp-9th-bucket-144", "storage/music/" , song_file);

            // 앨범 아트 파일을 storage/album 경로로 업로드
            song_albumart_file_name = ncp.uploadFile("bitcamp-9th-bucket-144", "storage/album/" , album_file);

            // 업로드 완료 후 임시 파일 삭제
            if (song_file.exists()) {
                song_file.delete();
                System.out.println("Temporary song file deleted successfully: " + song_file.getAbsolutePath());
            }

            if (album_file.exists()) {
                album_file.delete();
                System.out.println("Temporary album file deleted successfully: " + album_file.getAbsolutePath());
            }
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException("Failed to upload files", e);
        }

        // DTO 설정
        SonguploadDTO songuploadDTO = new SonguploadDTO();
        songuploadDTO.setSong_name(song_name);
        songuploadDTO.setSong_artist(song_artist);
        songuploadDTO.setSong_album(song_album);
        songuploadDTO.setSong_tag(song_tag);
        songuploadDTO.setSong_traknum(song_traknum);
        songuploadDTO.setTitleyn(titleyn);
        songuploadDTO.setSong_albumart(song_albumart_file_name);
        songuploadDTO.setSong_file_name(song_file_name);
        songuploadDTO.setSong_playcount(song_playcount);

        // DB 저장
        SonguploadDAO songuploadDAO = SonguploadDAO.getInstance();
        songuploadDAO.fileupload(songuploadDTO);

        return "none";
    }
}
