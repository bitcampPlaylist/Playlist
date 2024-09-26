package songlist.bean;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class SonglistDTO {
	private int song_id;
	private String song_name;
	private String artist_name;
	private String song_album;
	private String song_tag;
	private int song_traknum;
	private int song_titleyn;
	private String song_albumart;
	private int song_playcount;
}
