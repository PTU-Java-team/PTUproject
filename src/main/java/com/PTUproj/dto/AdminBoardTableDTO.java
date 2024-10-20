package com.PTUproj.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class AdminBoardTableDTO {
    private int noticeId;
    private int adminId;
    private String boardType;
    private String boardTitle;
    private int boardView;
    private String boardDate;
}
