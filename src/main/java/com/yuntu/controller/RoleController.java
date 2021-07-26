package com.yuntu.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.mysql.cj.util.StringUtils;
import com.yuntu.service.Kind.KindService;
import com.yuntu.tools.PageUtil;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

@Controller
@RequestMapping("/sys/role")
public class RoleController {
    @Resource
    private KindService roleService;

    @RequestMapping("/rolePage")
    public String userIndex(){
        System.out.println("==欢迎进入员工管理页面==");
        return "KindPage";
    }
    @RequestMapping("/getRoll")
    @ResponseBody
    public Object getRoll(){
        return JSONArray.toJSONString(roleService.getAll());
    }















}
