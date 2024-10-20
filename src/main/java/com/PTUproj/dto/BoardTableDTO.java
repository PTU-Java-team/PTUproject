package com.PTUproj.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class BoardTableDTO {
    private int boardId;
    private String boardTitle;
    private String boardRedate;
    private String boardContent;
    private String boardImg;
    private int productId;
    private String categoryName;
}
