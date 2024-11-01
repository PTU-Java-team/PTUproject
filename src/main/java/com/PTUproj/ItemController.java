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
                                         @RequestParam("productImg3") MultipartFile productImg3
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



    @GetMapping("/searchProductConfirm")
    public String searchProductConfirm(ItemDTO itemDTO, Model model) {

        System.out.println("sellController searchProductConfirm() called");

        List<ItemDTO> itemDTOS = itemService.searchProductConfirm(itemDTO);
        System.out.println("productList : " + itemDTOS);

        model.addAttribute("productDetail", itemDTOS);

        return "main";
    }

}