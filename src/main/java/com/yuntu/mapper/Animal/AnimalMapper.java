package com.yuntu.mapper.Animal;

import com.yuntu.pojo.Animal;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface AnimalMapper {
    //获取总量
    int getCount();
    //分页
    List<Animal> getPageAll(@Param("pageindex") int pageindex, @Param("pagesize") int pagesize);
    //删除
    int delAnimal(int a_id);
    //增加
    int addAnimal(Animal animal);
    //验证重名
    Animal checkName(String a_name);
    //获取单个
    Animal getAnimal(int a_id);
    //修改
    int updAnimal(Animal animal);
}
