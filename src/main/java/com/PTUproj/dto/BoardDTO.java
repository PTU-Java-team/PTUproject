package com.PTUproj.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.Date;

@ToString
@Getter
@Setter
public class BoardDTO {
    private int board_Id;           // 게시판 ID
    private String board_Title;     // 제목
    private Date board_Redate;      // 등록일
    private String boardContent;    // 내용
    private byte[] boardImg;       // 이미지
    private int productId;         // 상품 ID
    private String categoryName;    // 카테고리 이름
    private String boardWriter;      // 작성자
    private String boardPass;        // 비밀번호

    public Long getId() {
        return 0L;
    }
}
