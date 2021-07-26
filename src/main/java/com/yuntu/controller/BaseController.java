package com.yuntu.controller;

import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;

import javax.xml.crypto.Data;
import java.text.SimpleDateFormat;

public class BaseController {
    /*@InitBinder使用它可以解决Spring MVC 日期类型无法绑定问题*/
    @InitBinder
    public void InitBinder(WebDataBinder dataBinder){
        dataBinder.registerCustomEditor(Data.class,new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd"),true));

    }
}
