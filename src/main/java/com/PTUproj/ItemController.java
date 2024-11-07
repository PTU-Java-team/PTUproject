package com.PTUproj;

import com.PTUproj.dto.ItemDTO;
import com.PTUproj.service.ItemService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
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

        Integer isAdminValue = (Integer) session.getAttribute("isAdmin"); // 관리자 권한이 0,1 이기 때문에 Integer 객체로 변환 후
        Boolean isAdmin = (isAdminValue != null && isAdminValue == 1); // null값이 아니면서 1인 true 값으로 변수 선언

        if(session.getAttribute("loginEmail") == null ) {
            return "redirect:/logins"; // 세션에 로그인 정보 없는 경우(로그인 하지 않은 경우) 로그인 페이지로 redirect
        }else if(Boolean.FALSE.equals(isAdmin)){
            return "redirect:/"; // isAdmin == true == 1 ,즉 FALSE == isAdmin == 0 일 경우만 메인 페이지로 redirect
        }

        return "sell";
    }

    // 판매 등록 확인
    @PostMapping("/registerProductConfirm")
    public String registerProductConfirm(@RequestParam("productName") String productName,
                                         @RequestParam("categoryId") int categoryId,
                                         @RequestParam("productPrice") int prductPrice,
                                         @RequestParam("productDescription") String productDescription,
                                         @RequestParam("productImg3") MultipartFile productImg3
    ) {
        System.out.println("sellController registerProductConfirm() called");

        String loginEmail = (String) session.getAttribute("loginEmail");
        Integer isAdminValue = (Integer) session.getAttribute("isAdmin");
        Boolean isAdmin = (isAdminValue != null && isAdminValue == 1);
        if(loginEmail == null) {
            return "redirect:/logins"; // 로그인 하지 않은 경우 로그인 페이지로 redirect
        }else if(Boolean.FALSE.equals(isAdmin)){
            return "redirect:/";
        }


        System.out.println("memberEmail : " + loginEmail);

        // ItemDTO 객체에 판매 정보 설정 및 저장
        ItemDTO itemDTO = new ItemDTO();

        itemDTO.setProductName(productName);
        itemDTO.setCategoryId(categoryId);
        itemDTO.setProductPrice(prductPrice);
        itemDTO.setProductDescription(productDescription);
        itemDTO.setMemberEmail(loginEmail);


        // img3 blob 대표이미지 처리 및 저장
        if (!productImg3.isEmpty()) {
            try {
                itemDTO.setProductImg3(productImg3.getBytes());
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

        // 상품 등록 서비스 메서드 호출
        itemService.registerProductConfirm(itemDTO);

        return "redirect:/";
    }

    // productImg3 대표이미지를 내보내는 처리
    @GetMapping("/product/image/{id}")
    public void getProductImage(@PathVariable("id") int productId, HttpServletResponse response) {
        ItemDTO item = itemService.findById(productId);

        if (item != null && item.getProductImg3() != null) {
            try {
                response.setContentType("image/png");
                response.getOutputStream().write(item.getProductImg3());
                response.getOutputStream().flush();
            } catch (IOException e) {
                e.printStackTrace();
            }
        } else {
            response.setStatus(HttpServletResponse.SC_NOT_FOUND);
        }
    }


    // 행사 검색 기능 처리
    @GetMapping("/searchProductConfirm")
    public String searchProductConfirm(ItemDTO itemDTO, Model model) {

        System.out.println("sellController searchProductConfirm() called");

        List<ItemDTO> itemDTOS = itemService.searchProductConfirm(itemDTO);
        System.out.println("productList : " + itemDTOS);

        model.addAttribute("productDetail", itemDTOS);

        return "search_product";
    }

}