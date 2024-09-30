package member.bean;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MemberDTO {
    private String member_name;
    private String member_id;
    private String member_pwd;
    private String member_gender;
    private String member_email1;
    private String member_email2;
    private String member_tel1;
    private String member_tel2;
    private String member_tel3;
    private int member_zipcode;
    private String member_addr1;
    private String member_addr2;
    private Date member_logtime;
}
