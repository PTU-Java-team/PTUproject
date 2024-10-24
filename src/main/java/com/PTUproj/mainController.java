package com.PTUproj;

import com.PTUproj.dto.ItemDTO;
import com.PTUproj.dto.MemberDTO;
import com.PTUproj.repository.MemberRepository;
import com.PTUproj.service.ItemService;
import com.PTUproj.service.MemberService;
import lombok.RequiredArgsConstructor;
import lombok.Value;
import lombok.extern.flogger.Flogger;
import lombok.extern.slf4j.Slf4j;
import org.apache.taglibs.standard.lang.jstl.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.lang.reflect.Member;
import java.util.List;

@Slf4j
@Controller
@RequiredArgsConstructor
public class mainController {

    private final MemberService memberService;  //의존성을 주입함
    private final ItemService itemService;    // 의존성 주입

    //시작 화면(메인 페이지)
    @GetMapping("/")
    public String main(Model model) {
        // 서비스 계층에서 상품 목록 가져오기
        List<ItemDTO> productList = itemService.getAllItems();

        System.out.println("productList : " + productList); // 로그로 productList를 출력

        // 가져온 상품 목록을 모델에 추가한 후 main.jsp로 보냄
        model.addAttribute("productList", productList);

        return "main";
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


    // 판매 등록 처리부분

    @GetMapping("/sell")
    public String itemForm(HttpSession session) {
        if(session.getAttribute("loginEmail") == null) {
            return "redirect:/logins"; // 로그인 하지 않은 경우 로그인 페이지로 redirect
        };
        return "sell"; // jsp 파일이름
    }

    @PostMapping("/itemRegister")
    public String itemRegister(@RequestParam("productName") String productName,
                               @RequestParam("categoryId") int categoryId,
                               @RequestParam("productPrice") double prductPrice,
                               @RequestParam("productDescription") String detail,
                               @RequestParam("productImg1") MultipartFile img1,
                               @RequestParam("productImg2") MultipartFile img2,
                               HttpSession session) throws IOException {
        if(session.getAttribute("loginEmail") == null) {
            return "redirect:/logins"; // 로그인 하지 않은 경우 로그인 페이지로 redirect
        }

        ItemDTO itemDTO = new ItemDTO();
        itemDTO.setProductName(productName);
        itemDTO.setCategoryId(categoryId);
        itemDTO.setProductPrice(prductPrice);
        itemDTO.setProductDescription(detail);

        //이미지 파일 처리
        itemDTO.setProductImg1(img1.getOriginalFilename());
        itemDTO.setProductImg2(img2.getOriginalFilename());
//        itemDTO.setImg3(img3.getOriginalFilename());


        // 상품 등록 서비스 호출
        itemService.registerItem(itemDTO);

        return "redirect:/"; // 틍록 후 메인 화면으로 리턴
    }

//    // 모달 창에 나오는 상품 상세 정보 처리
//    @GetMapping("/productInfo")
//    public String getItemDetail(@RequestParam("productId") int productId,HttpSession session, Model model) {
//        // 상품 상세 정보 가져오기
//        ItemDTO product = itemService.getItemDetail(productId);
//
//        // 세션에서 로그인된 사용자의 이메일 정보를 가져와서 모델 객체에 추가
//        model.addAttribute("sellerEmail", session.getAttribute("loginEmail"));

//        // 상품 정보를 HTML 형태로 반환
//        StringBuilder detailHtml = new StringBuilder();
//        detailHtml.append("<h2>상품명: ").append(product.getName()).append("</h2>");
//        detailHtml.append("<p>가격: ₩").append(product.getPrice()).append(" 원</p>");
//        detailHtml.append("<p>설명: ").append(product.getDetail()).append("</p>");
//        detailHtml.append("<img src='/images/").append(product.getImg1()).append("' width='300px'>");
//
//        return detailHtml.toString();

//        // 상품이 없을 경우 처리하기
//        if (product == null) {
//            return "redirect:/"; // 상품이 없다면 메인 페이지로 리다이렉션
//        }
//
//        // 상품 정보를 모델에 추가
//        model.addAttribute("product", product);
//
//
//        return "productInfo";
//    }


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
        System.out.println("memberList : " + memberDTOList);  //로그 ��어서 확인
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
    public String updateForm(HttpSession session,Model model) {
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
            return "redirect:/good?id=" + memberDTO.getMember_id();
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



}

