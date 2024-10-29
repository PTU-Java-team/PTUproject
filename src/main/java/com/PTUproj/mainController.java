package com.PTUproj;

import com.PTUproj.dto.BoardDTO;
import com.PTUproj.dto.MemberDTO;
import com.PTUproj.service.BoardService;
import com.PTUproj.service.MemberService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequiredArgsConstructor
public class mainController {

    private final MemberService memberService;  //의존성을 주입함


    //    @GetMapping("/")
//    public String main() {      //시작 화면
//        return "main";
//    }
    @GetMapping("/")
    public String showBoardList(Model model) {
        List<BoardDTO> boardList = boardService.findAll();
        model.addAttribute("boardList", boardList);
        return "main"; // 위에서 작성한 JSP 파일
    }

    @GetMapping("/index")
    public String index() {
        return "index";
    }

    //밑에 3개가 상단 메뉴
    @GetMapping("/smallGroup")   //소모임
    public String smellGroup() {
        return "smallGroup";
    }

    @GetMapping("/website")     //웹사이트
    public String website() {
        return "website";
    }
/*
    @GetMapping("/sell")    //판매
    public String sell() {
        return "sell";
    }
*/
    //하단 메뉴 컨트롤러
    @GetMapping("/ECRole")  //이용약관
    public String ECRole() {
        return "mainPage/ECRole";
    }

    @GetMapping("/humanInfo")   //개인정보처리방침
    public String humanInfo() {
        return "mainPage/humanInfo";
    }

    @GetMapping("/qna")
    public String qna() {
        return "mainPage/qna";
    }

    //로그인 관련 컨트롤러
    @GetMapping("/logins")   //로그인 페이지
    public String login() {
        return "login/logins";
    }

    @PostMapping("/logins")   //로그인 처리 ...  세션도 사용함
    public String login(@ModelAttribute MemberDTO memberDTO, HttpSession session) {
        boolean loginResult = memberService.login(memberDTO, session);

        if (loginResult) {
            session.getAttribute("loginEmail");
            return "login/good";  //로그인 성공하면 good.jsp 로 이동   참고로 good.jsp는 급조한 것이다.
        } else {
            return "login/logins"; //실패하면 login.jsp 에 있도록 함
        }
    }

    @GetMapping("/admin/dashboard")
    public String adminDashboard(HttpSession session) {
        Boolean isAdmin = (Boolean) session.getAttribute("isAdmin");

        if (Boolean.TRUE.equals(isAdmin)) {
            return "/list"; // 관리자 대시보드로 이동
        } else {
            return "redirect:/"; // 권한이 없으면 메인 페이지로 리다이렉트
        }
    }

    //로그인과 회원가입 간의 연결 통로
    @GetMapping("/login-tunnel")    //화원가입 성공하면 성공했다고 알려주고
    public String loginTunnel() {       //로그인 페이지로 돌아가게 해주는 터널 역할
        return "login/login-tunnel";
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate(); // 세션 무효화
        return "redirect:/"; // 메인 페이지로 리다이렉트
    }

    //회원가입 컨트롤러
    @GetMapping("/save")
    public String saveForm() {
        return "login/save";
    }

    //회원가입 툴 / MemberDTO와 연관있음
    @PostMapping("/save")
    public String save(@ModelAttribute MemberDTO memberDTO, Model model) {
        // 이메일 중복 체크
        if (memberService.isEmailTaken(memberDTO.getMember_Email())) {
            model.addAttribute("error", "이미 사용중인 이메일입니다.");
            return "login/save";  // 에러가 발생하면 회원가입 폼으로 돌아감
        }


        int saveResult = memberService.save(memberDTO);
        if (saveResult > 0) {
            return "login/login-tunnel";    //성공
        } else {
            return "login/save";    //실패하면 다시 회원가입 페이지로 이동
        }
    }

    //회원 목록 조회
    @GetMapping("/list")
    public String findAll(Model model) {
        List<MemberDTO> memberDTOList = memberService.findAll();
        model.addAttribute("memberList", memberDTOList);
        return "list";
    }

    //회원 삭제
    @GetMapping("/member")
    public String findById(@RequestParam("member_id") Long member_id, Model model) {
        MemberDTO memberDTO = memberService.findById(member_id);
        model.addAttribute("member", memberDTO);
        return "detail";
    }

    //회원 삭제 후 갱신된 페이지
    @GetMapping("/member/delete")
    public String delete(@RequestParam("member_id") Long member_id) {
        memberService.delete(member_id);
        return "redirect:/list"; //리스트를 재요청(리다이렉트)... 여기 주소에 주의 할 것
    }

    //수정화면 요청   세션 사용함
    @GetMapping("/update")
    public String updateForm(HttpSession session, Model model) {
        //세션에 저장된 나의 이메일 가져옴
        String loginEmail = (String) session.getAttribute("loginEmail");
        //우측에 String으로 감싼 이유는 Object 라서 String 보다 더 상위이기 때문에 강제 형변환함
        MemberDTO memberDTO = memberService.findByMemberEmail(loginEmail);
        //회원의 이메일을 이용해 DB에서 조회를 해서 dto로 가져와서 회원의 전체 정보를 가져옴
        model.addAttribute("member", memberDTO);
        return "login/update";
    }

    //수정 처리
    @PostMapping("/update")
    public String update(@ModelAttribute MemberDTO memberDTO) {
        boolean result = memberService.update(memberDTO);

        if (result) {
            return "redirect:/good?member_id=" + memberDTO.getMember_id();
        } else {
            return "main";
        }

    }

    @GetMapping("/good")
    public String getGoodPage(@RequestParam Long member_id, Model model) {
        // ID에 대한 회원 정보를 가져와서 모델에 추가
        MemberDTO member = memberService.findById(member_id);
        model.addAttribute("member", member);
        return "login/good"; // good.jsp 페이지로 이동
    }


    //이메일 중복 체크
    @PostMapping("/email-check")
    public @ResponseBody String emailCheck(@RequestParam("member_Email") String member_Email) {
        System.out.println("memberEmail = " + member_Email);
        String checkResult = memberService.emailCheak(member_Email);
        return checkResult;     // 이 return 값은 ajax의 login.jsp의 res 로 값이 넘어감
    }


    // 장바구니 페이지로 이동
    @GetMapping("/cart")
    public String viewCart(Model model, HttpSession session) {
        Map<String, Integer> cart = (Map<String, Integer>) session.getAttribute("cart");
        if (cart == null) {
            cart = new HashMap<>(); // 장바구니가 비어있다면 새로 생성
        }
        model.addAttribute("cart", cart); // 모델에 장바구니 정보 추가
        return "cart"; // cart.jsp 페이지로 이동
    }

    // 장바구니에 상품 추가
    @PostMapping("/addToCart")
    public String addToCart(@RequestParam String productId, @RequestParam int quantity, HttpSession session) {
        Map<String, Integer> cart = (Map<String, Integer>) session.getAttribute("cart");
        if (cart == null) {
            cart = new HashMap<>();
        }
        cart.put(productId, cart.getOrDefault(productId, 0) + quantity);
        session.setAttribute("cart", cart);
        return "redirect:/cart"; // 장바구니 페이지로 이동
    }


    //

    //


    //
    //게시판 컨트롤러
    private final BoardService boardService;
    // private final CommentService commentService;

    @GetMapping("/b_save")
    public String saveFormb() {
        return "board/b_save";
    }

    @PostMapping("/b_save")
    public String saveb(@ModelAttribute BoardDTO boardDTO) {
        int saveResult = boardService.save(boardDTO);
        if (saveResult > 0) {
            return "board/b_paging";
        } else {
            return "board/b_save";
        }
    }

    @GetMapping("/b_list")
    public String findAllb(Model model) {
        List<BoardDTO> boardDTOList = boardService.findAll();
        model.addAttribute("boardList", boardDTOList);
        return "board/b_list";
    }

    @GetMapping("/b_detail")
    public String findByIdb(@RequestParam("id") Long id,
                            @RequestParam(value = "page", required = false, defaultValue = "1") int page,
                            Model model) {
        boardService.updateHits(id);
        BoardDTO boardDTO = boardService.findById(id);
        model.addAttribute("board", boardDTO);
        model.addAttribute("page", page);
        // List<CommentDTO> commentDTOList = commentService.findAll(id);
        //   model.addAttribute("commentList", commentDTOList);
        return "board/b_detail";
    }

    @GetMapping("/b_delete")
    public String deleteb(@RequestParam("id") Long id) {
        boardService.delete(id);
        return "redirect:/board/";
    }

    @GetMapping("/b_update")
    public String updateFormb(@RequestParam("id") Long id, Model model) {
        BoardDTO boardDTO = boardService.findById(id);
        model.addAttribute("board", boardDTO);
        return "board/b_update";
    }

    @PostMapping("/b_update")
    public String updateb(@ModelAttribute BoardDTO boardDTO, Model model) {
        boardService.update(boardDTO);
        BoardDTO dto = boardService.findById(boardDTO.getId());
        model.addAttribute("board", dto);
        return "board/b_detail";
//        return "redirect:/board?id="+boardDTO.getId();
    }

    // /board/paging?page=2
    // 처음 페이지 요청은 1페이지를 보여줌
    @GetMapping("/b_paging")
    public String pagingb(Model model,
                          @RequestParam(value = "page", required = false, defaultValue = "1") int page) {
        System.out.println("page = " + page);
        // 해당 페이지에서 보여줄 글 목록
        List<BoardDTO> pagingList = boardService.pagingList(page);
        System.out.println("pagingList = " + pagingList);
        //PageDTO pageDTO = boardService.pagingParam(page);
        model.addAttribute("boardList", pagingList);
        // model.addAttribute("paging", pageDTO);
        return "board/b_paging";
    }



}




//    //comment
//    private final CommentService commentService;
//
//    @PostMapping("/save")
//    public @ResponseBody List<CommentDTO> savec(@ModelAttribute CommentDTO commentDTO) {
//        System.out.println("commentDTO = " + commentDTO);
//        commentService.save(commentDTO);
//        // 해당 게시글에 작성된 댓글 리스트를 가져옴
//        List<CommentDTO> commentDTOList = commentService.findAll(commentDTO.getBoardId());
//        return commentDTOList;
//    }
//}
//









