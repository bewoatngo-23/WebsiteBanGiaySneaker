package com.example.assignment_java5.controller;

import com.example.assignment_java5.enitityRequest.DongSPRequest;
import com.example.assignment_java5.entity.DongSP;
import com.example.assignment_java5.service.DongSPService;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.UUID;

@Controller
@RequestMapping("/dong-san-pham")
public class DongSPController {
    @Autowired
    private DongSPService dongSPService;

    @GetMapping()
    public String hienThi(@RequestParam(value = "pageNo", defaultValue = "0") Integer pageNo, Model model) {
        if (pageNo < 0) {
            pageNo = 0;
        }
        model.addAttribute("listDSP", dongSPService.fillAll(pageNo, 5));
        model.addAttribute("dongSanPham", new DongSP());
        return "/viewDongSP/dong-san-pham";
    }

    @PostMapping("/addOrUpdate")
    public String addOrUpdate(Model model,
                              @Valid @ModelAttribute("dongSanPham") DongSPRequest dongSanPham,
                              BindingResult bindingResult,
                              @RequestParam(value = "pageNo", defaultValue = "0") Integer pageNo) {

        if (pageNo < 0) {
            pageNo = 0;
        }
//        DongSP checkMa = dongSPService.findByMa(dongSanPham.getMa());
//        if (checkMa != null) {
//            model.addAttribute("checkMa", "Mã đã tồn tại vui lòng nhập mã khác");
//            model.addAttribute("listDSP", dongSPService.fillAll(0, 5));
//            return "/viewDongSP/dong-san-pham";
//        }
//        else
            if (bindingResult.hasErrors()) {
            model.addAttribute("listDSP", dongSPService.fillAll(0, 5));
            return "/viewDongSP/dong-san-pham";
        } else {
            dongSPService.addOrUpdate(dongSanPham);
            model.addAttribute("listDSP", dongSPService.fillAll(pageNo, 5));
            return "redirect:/dong-san-pham";
        }
    }

    @GetMapping("/remove/{id}")
    public String remove(@PathVariable("id") UUID id,
                         Model model) {
        dongSPService.delete(id);
        return "redirect:/dong-san-pham";
    }

    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") UUID id,
                       @RequestParam(value = "pageNo", defaultValue = "0") Integer pageNo, Model model) {
        if (pageNo < 0) {
            pageNo = 0;
        }
        model.addAttribute("dongSanPham", dongSPService.getById(id));
        model.addAttribute("listDSP", dongSPService.fillAll(pageNo, 5));
        return "/viewDongSP/dong-san-pham";
    }
}
