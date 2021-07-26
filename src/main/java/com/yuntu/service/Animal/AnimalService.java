package com.yuntu.service.Animal;

import com.yuntu.pojo.Animal;
import com.yuntu.tools.PageUtil;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface AnimalService {
    //分页
    void getPageAll(PageUtil<Animal> pageUtil);
    //删除
    boolean delAnimal(int a_id);
    //增加
    boolean addAnimal(Animal animal);
    //验证重名
    Animal checkName(String a_name);
    //获取单个
    Animal getAnimal(int a_id);
    //修改
    boolean updAnimal(Animal animal);
}
