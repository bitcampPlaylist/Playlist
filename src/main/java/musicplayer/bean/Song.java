package musicplayer.bean;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Song {           
    private String songName;
    private String artistName; 
    private String albumArt;
	private int songId; 
    private String songFile;
    
    public Song() {}
    
    public Song(String songName, String artistName, String albumArt, String songFile) {
        this.songName = songName;
        this.artistName = artistName;
        this.albumArt = albumArt;
        this.songFile = songFile;
    }
}

