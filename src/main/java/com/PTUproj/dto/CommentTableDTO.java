package com.PTUproj.dto;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class CommentTableDTO {
    private int commentId;
    private String commentContent;
    private String commentRate; // 날짜 형식을 String으로 변경
    private int adminNum;
}
