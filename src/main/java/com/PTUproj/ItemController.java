package com.PTUproj;

import com.PTUproj.dto.ItemDTO;
import com.PTUproj.service.ItemService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import javax.servlet.http.HttpSession;
import java.util.List;

@Slf4j
@Controller
@RequiredArgsConstructor
public class ItemController {

    private final ItemService itemService;    // 상품정보에 관한 의존성 주입
    private final HttpSession session; // 메서드 내에서 HttpSession 객체를 선언하기 위한 멤버변수 선언


    // 판매 등록
    @GetMapping("/sell")
    public String registerProductForm() {
        System.out.println("sellController registerProductForm() called");

        if(session.getAttribute("loginEmail") == null) {
            return "redirect:/logins"; // 로그인 하지 않은 경우 로그인 페이지로 redirect
        }

        return "sell";
    }

    // 판매 등록 확인
    @PostMapping("/registerProductConfirm")
    public String registerProductConfirm(@RequestParam("productName") String productName,
                                         @RequestParam("categoryId") int categoryId,
                                         @RequestParam("productPrice") int prductPrice,
                                         @RequestParam("productDescription") String productDescription,
                                         @RequestParam("productImg1") MultipartFile productImg1,
                                         @RequestParam("productImg2") MultipartFile productImg2
                                        ) {
        System.out.println("sellController registerProductConfirm() called");

        String loginEmail = (String) session.getAttribute("loginEmail");
        if(loginEmail == null) {
            return "redirect:/logins"; // 로그인 하지 않은 경우 로그인 페이지로 redirect
        }


        System.out.println("memberEmail : " + loginEmail);

        // ItemDTO 객체에 판매 정보 설정 및 저장
        ItemDTO itemDTO = new ItemDTO();

        itemDTO.setProductName(productName);
        itemDTO.setCategoryId(categoryId);
        itemDTO.setProductPrice(prductPrice);
        itemDTO.setProductDescription(productDescription);
        itemDTO.setMemberEmail(loginEmail);

        //썸네일이미지 및 추가이미지 파일 저장
        itemDTO.setProductImg1(productImg1.getOriginalFilename());
        itemDTO.setProductImg2(productImg2.getOriginalFilename());

        // 상품 등록 서비스 메서드 호출
        itemService.registerProductConfirm(itemDTO);

        return "redirect:/";
    }

    // 상품 검색 정보 확인
    @GetMapping("/searchProductConfirm")
    public String searchProductConfirm(ItemDTO itemDTO, Model model) {

        System.out.println("sellController searchProductConfirm() called");

        // 클라이언트가 요청한 productName으로 검색된 상품을 DB에서 불러와 itemDTOS에 저장
        List<ItemDTO> itemDTOS = itemService.searchProductConfirm(itemDTO);
        System.out.println("productList : " + itemDTOS);

        // model 객체 변수에 itemDTOS의 productDetail이라는 id 값으로 저장
        model.addAttribute("productDetail", itemDTOS);

        return "main";
    }

}
