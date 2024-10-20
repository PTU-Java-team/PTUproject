package com.PTUproj;

import com.PTUproj.dto.*;
import com.PTUproj.repository.MemberRepository;
import com.PTUproj.service.*;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;


@Controller
@RequiredArgsConstructor

public class mainController {

    private final MemberService memberService;  //의존성을 주입함


    @GetMapping("/")
    public String main() {      //시작 화면
        return "main";
    }

    //밑에 3개가 상단 메뉴
    @GetMapping("smallGroup")   //소모임
    public String smellGroup() {
        return "smallGroup";
    }

    @GetMapping("/website")     //웹사이트
    public String website() {
        return "website";
    }

    @GetMapping("/sell")    //판매
    public String sell() {
        return "sell";
    }

    //하단 메뉴 컨트롤러
    @GetMapping("/ECRole")  //이용약관
    public String ECRole() {
        return "mainPage/ECRole";
    }

    @GetMapping("/humanInfo")   //개인정보처리방침
    public String humanInfo() {
        return "mainPage/humanInfo";
    }

    @GetMapping("/comInfo") //회사소개
    public String comInfo() {
        return "mainPage/comInfo";
    }

    //로그인 관련 컨트롤러
    @GetMapping("/login")   //로그인 페이지
    public String login() {
        return "login/login";
    }

    @PostMapping("/login")   //로그인 처리 ...  세션도 사용함
    public String login(@ModelAttribute MemberDTO memberDTO, HttpSession session) {
        boolean loginResult = memberService.login(memberDTO, session);

        if (loginResult) {
            session.getAttribute("loginEmail");
            return "login/good";  //로그인 성공하면 good.jsp 로 이동   참고로 good.jsp는 급조한 것이다.
        } else {
            return "login/login"; //실패하면 login.jsp 에 있도록 함
        }
    }

    //로그인과 회원가입 간의 연결 통로
    @GetMapping("/login-tunnel")    //화원가입 성공하면 성공했다고 알려주고
    public String loginTunnel() {       //로그인 페이지로 돌아가게 해주는 터널 역할
        return "login/login-tunnel";
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
        if (memberService.isEmailTaken(memberDTO.getMemberEmail())) {
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
    public String findById(@RequestParam("id") Long id, Model model) {
        MemberDTO memberDTO = memberService.findById(id);
        model.addAttribute("member", memberDTO);
        return "detail";
    }

    //회원 삭제 후 갱신된 페이지
    @GetMapping("/member/delete")
    public String delete(@RequestParam("id") Long id) {
        memberService.delete(id);
        return "redirect:/list"; //리스트를 재요청(리다이렉트)... 여기 주소에 주의 할 것
    }

    //수정화면 요청   세션 사용함
    @GetMapping("/update")
    public String updateForm(HttpSession session,Model model) {
        //세션에 저장된 나의 이메일 가져옴
        String loginEmail = (String) session.getAttribute("loginEmail");
            //우측에 String으로 감싼 이유는 Object 라서 String 보다 더 상위이기 때문에 강제 형변환함
        MemberDTO memberDTO = memberService.findByMemberEmail(loginEmail);
            //회원의 이메일을 이용해 DB에서 조회를 해서 dto로 가져와서 회원의 전체 정보를 가져옴
        model.addAttribute("member", memberDTO);
        return "update";
    }

    //수정 처리
    @PostMapping("/update")
    public String update(@ModelAttribute MemberDTO memberDTO) {
        boolean result = memberService.update(memberDTO);

        if (result) {
            return "redirect:/list?id=" + memberDTO.getId();
        } else {
            return "main";
        }

    }

    //이메일 중복 체크
    @PostMapping("/email-check")
    public @ResponseBody String emailCheck(@RequestParam("memberEmail") String memberEmail) {
        System.out.println("memberEmail = " + memberEmail);
        String checkResult = memberService.emailCheak(memberEmail);
        return checkResult;     // 이 return 값은 ajax의 login.jsp의 res 로 값이 넘어감
    }




    //상품
    private final ProductService productService; // 제품 서비스 추가

    @GetMapping("/products")
    public String getAllProducts(Model model) {
        List<ProductTableDTO> products = productService.findAllProducts();
        model.addAttribute("productList", products);
        return "product/list"; // 제품 목록을 보여줄 JSP 페이지
    }

    // 제품 상세 정보 조회
    @GetMapping("/product")
    public String getProductDetail(@RequestParam("id") int productId, Model model) {
        ProductTableDTO product = productService.findProductById(productId);
        model.addAttribute("product", product);
        return "product/detail"; // 제품 상세 정보를 보여줄 JSP 페이지
    }

    // 새 제품 등록 페이지
    @GetMapping("/product/new")
    public String newProductForm() {
        return "product/new"; // 제품 등록 폼 JSP 페이지
    }

    // 새 제품 등록 처리
    @PostMapping("/product/new")
    public String addProduct(@ModelAttribute ProductTableDTO productDTO) {
        productService.saveProduct(productDTO);
        return "redirect:/products"; // 제품 등록 후 목록 페이지로 이동
    }

    // 제품 수정 페이지
    @GetMapping("/product/edit")
    public String editProductForm(@RequestParam("id") int productId, Model model) {
        ProductTableDTO product = productService.findProductById(productId);
        model.addAttribute("product", product);
        return "product/edit"; // 제품 수정 폼 JSP 페이지
    }

    // 제품 수정 처리
    @PostMapping("/product/edit")
    public String updateProduct(@ModelAttribute ProductTableDTO productDTO) {
        productService.updateProduct(productDTO);
        return "redirect:/products"; // 수정 후 목록 페이지로 이동
    }

    // 제품 삭제 처리
    @GetMapping("/product/delete")
    public String deleteProduct(@RequestParam("id") int productId) {
        productService.deleteProduct(productId);
        return "redirect:/products"; // 삭제 후 목록 페이지로 이동
    }




    // 카테고리
    private final category_Service categoryService;


    // 모든 카테고리 조회
    @GetMapping("/")
    public String findAllCategories(Model model) {
        List<category_tableDTO> categoryList = categoryService.findAllCategories();
        model.addAttribute("categories", categoryList);
        return "/";  // category 목록 페이지로 이동
    }

    // 특정 카테고리 조회
    @GetMapping("/")
    public String findCategoryById(@RequestParam("id") int categoryId, Model model) {
        category_tableDTO category = categoryService.findCategoryById(categoryId);
        model.addAttribute("category", category);
        return "/"; // 카테고리 상세 페이지로 이동
    }





    //댓글 COMMENT
    @Autowired
    private CommentService commentService;

    // 댓글 작성 폼 페이지로 이동
    @GetMapping("/comment/write")
    public String writeCommentForm() {
        return "comment/write";
    }

    // 댓글 저장
    @PostMapping("/comment/save")
    public String saveComment(@ModelAttribute CommentTableDTO commentDTO) {
        commentService.saveComment(commentDTO);
        return "redirect:/comment/list"; // 댓글 목록 페이지로 리다이렉트
    }

    // 모든 댓글 조회
    @GetMapping("/comment/list")
    public String listComments(Model model) {
        List<CommentTableDTO> commentList = commentService.getAllComments();
        model.addAttribute("comments", commentList);
        return "comment/list";
    }

    // 특정 댓글 조회
    @GetMapping("/comment/detail")
    public String getComment(@RequestParam("id") int commentId, Model model) {
        CommentTableDTO comment = commentService.getCommentById(commentId);
        model.addAttribute("comment", comment);
        return "comment/detail";
    }

    // 댓글 삭제
    @GetMapping("/comment/delete")
    public String deleteComment(@RequestParam("id") int commentId) {
        commentService.deleteComment(commentId);
        return "redirect:/comment/list";
    }





    //주문 사항
    @Autowired
    private OrderService orderService;

    // 주문 작성 폼 페이지로 이동
    @GetMapping("/order/write")
    public String writeOrderForm() {
        return "order/write";
    }

    // 주문 저장
    @PostMapping("/order/save")
    public String saveOrder(@ModelAttribute OrderlinessTableDTO orderDTO) {
        orderService.saveOrder(orderDTO);
        return "redirect:/order/list"; // 주문 목록 페이지로 리다이렉트
    }

    // 모든 주문 조회
    @GetMapping("/order/list")
    public String listOrders(Model model) {
        List<OrderlinessTableDTO> orderList = orderService.getAllOrders();
        model.addAttribute("orders", orderList);
        return "order/list";
    }

    // 세부 주문 조회
    @GetMapping("/order/detail")
    public String getOrder(@RequestParam("id") int orderId, Model model) {
        OrderlinessTableDTO order = orderService.getOrderById(orderId);
        model.addAttribute("order", order);
        return "order/detail";
    }

    // 주문 삭제
    @GetMapping("/order/delete")
    public String deleteOrder(@RequestParam("id") int orderId) {
        orderService.deleteOrder(orderId);
        return "redirect:/order/list";
    }





    //게시판 관련
    private final BoardService boardService;

    // 게시글 작성 폼 페이지
    @GetMapping("/write")
    public String writeBoardForm() {
        return "board/write"; // 게시글 작성 JSP
    }

    // 게시글 저장
    @PostMapping("/save")
    public String saveBoard(@ModelAttribute BoardTableDTO board) {
        boardService.saveBoard(board);
        return "redirect:/board/list"; // 게시글 목록 페이지로 리다이렉트
    }

    // 게시글 목록 조회
    @GetMapping("/list")
    public String listBoards(Model model) {
        List<BoardTableDTO> boardList = boardService.getAllBoards();
        model.addAttribute("boards", boardList);
        return "board/list"; // 게시글 목록 JSP
    }

    // 특정 게시글 조회
    @GetMapping("/detail")
    public String getBoard(@RequestParam("id") int boardId, Model model) {
        BoardTableDTO board = boardService.getBoardById(boardId);
        model.addAttribute("board", board);
        return "board/detail"; // 게시글 상세 JSP
    }

    // 게시글 수정 폼
    @GetMapping("/update")
    public String updateBoardForm(@RequestParam("id") int boardId, Model model) {
        BoardTableDTO board = boardService.getBoardById(boardId);
        model.addAttribute("board", board);
        return "board/update"; // 게시글 수정 JSP
    }

    // 게시글 수정 처리
    @PostMapping("/update")
    public String updateBoard(@ModelAttribute BoardTableDTO board) {
        boardService.updateBoard(board);
        return "redirect:/board/list"; // 게시글 목록 페이지로 리다이렉트
    }

    // 게시글 삭제
    @GetMapping("/delete")
    public String deleteBoard(@RequestParam("id") int boardId) {
        boardService.deleteBoard(boardId);
        return "redirect:/board/list"; // 게시글 목록 페이지로 리다이렉트
    }
//추가로 연결해야됨




}

