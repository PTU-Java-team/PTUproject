- 합치기가 잘 안 되지 않아서 일단 상품관련 모든 java 파일을 분리했습니다.
- 검색기능 추가
- 기존 상품등록 기능에 로그인해서 세션에 저장되고 있는 사용자의 ID도 상품테이블에 같이 추가되도록 수정.
- product_table에 member_id를 외래키로 추가
alter table PRODUCT_TABLE add constraint fk_product_member_id foreign key (member_id) references MEMBER_TABLE (member_id);
