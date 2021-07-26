package com.yuntu.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.mysql.cj.util.StringUtils;
import com.yuntu.pojo.Animal;
import com.yuntu.service.Animal.AnimalService;
import com.yuntu.tools.PageUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.Date;
import java.util.HashMap;

@Controller
@RequestMapping("/sys/user")
public class UserController extends BaseController{
    @Resource
    private AnimalService animalService;


    @RequestMapping("/userIndex")
    public String userIndex(){
        System.out.println("==欢迎进入员工管理页面==");
        return "AnimalIndex";
    }

    @ResponseBody
    @RequestMapping("/pagelists")
    public Object pagelists(@RequestParam int pageIndex){
        if(pageIndex<1){//左边界
            pageIndex=1;
        }
        PageUtil<Animal> pageutil = new PageUtil<Animal>();
        pageutil.setPageIndex(pageIndex);
        pageutil.setPageSize(2);
        System.out.println(pageutil);
        animalService.getPageAll(pageutil);
        return JSON.toJSONString(pageutil);
    }
    @ResponseBody
    @RequestMapping("/del")
    public Object del(@RequestParam int a_id){
        String delInfo = "nodel";
        boolean flag = animalService.delAnimal(a_id);
        if (flag){
            delInfo="del";
        }
        return JSON.toJSONString(delInfo);
    }

    @RequestMapping("/userRegiter")
    public String userRegiter(@ModelAttribute("user") Animal animal){
        return "AnimalRegiter";
    }
    @RequestMapping("/cheakName")
    @ResponseBody
    public Object cheakName(@RequestParam String a_name){
        HashMap<String,String> jsonrs=new HashMap<String,String>();
        if(StringUtils.isNullOrEmpty(a_name)){
            jsonrs.put("a_name","nodata");
        }else{
            Animal animal=animalService.checkName(a_name);
            System.out.println(animal);
            if(animal!=null){
                jsonrs.put("a_name","exist");
            }else{
                jsonrs.put("a_name","noexist");
            }
        }
        return JSONArray.toJSONString(jsonrs);
    }
    @RequestMapping(value = "/addUser",method = RequestMethod.POST)
    public String addUser (Animal animal){
        animal.setA_date(new Date());
        if (animalService.addAnimal(animal)) {
            return "redirect:/sys/user/userIndex";
        }else {
            return "userRegiter";
        }
    }
    @RequestMapping("/upd/{a_id}")
    public String upd(@PathVariable @ModelAttribute int a_id){
        return "Animalupd";
    }
    @RequestMapping("/getUser")
    @ResponseBody
    private Object getUser(@RequestParam int a_id){
        Animal user = animalService.getAnimal(a_id);
        return JSONArray.toJSONString(user);
    }
    @RequestMapping(value = "/updUser",method = RequestMethod.POST)
    public String updUser (Animal animal){
        System.out.println("ersgergesgesg歌手如果是染色"+animal);
        animal.setA_date(new Date());
        if (animalService.updAnimal(animal)) {
            return "redirect:/sys/user/userIndex";
        }else {
            return "Animalupd";
        }
    }
}
