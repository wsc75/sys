package com.yuntu.service.Animal;

import com.yuntu.mapper.Animal.AnimalMapper;
import com.yuntu.pojo.Animal;
import com.yuntu.tools.PageUtil;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;

@Service
public class AnimalServiceImpl implements AnimalService{
    @Resource
    private AnimalMapper animalMapper;
    @Override
    public void getPageAll(PageUtil<Animal> pageUtil) {
        int count = animalMapper.getCount();
        pageUtil.setCounts(count);
        //2.获取当前分页的集合
        if(count>0){
            if (pageUtil.getPageIndex()>pageUtil.getPageCount()){//右边界
                pageUtil.setPageIndex(pageUtil.getPageCount());
            }
            int pageindex=(pageUtil.getPageIndex()-1)*pageUtil.getPageSize();
            int pagesize=pageUtil.getPageSize();

            pageUtil.setLists(animalMapper.getPageAll(pageindex,pagesize));
        }else {
            pageUtil.setLists(new ArrayList<Animal>());
        }
    }

    @Override
    public boolean delAnimal(int a_id) {
        return animalMapper.delAnimal(a_id)!=0;
    }

    @Override
    public boolean addAnimal(Animal animal) {
        return animalMapper.addAnimal(animal)!=0;
    }

    @Override
    public Animal checkName(String a_name) {
        return animalMapper.checkName(a_name);
    }

    @Override
    public Animal getAnimal(int a_id) {
        return animalMapper.getAnimal(a_id);
    }

    @Override
    public boolean updAnimal(Animal animal) {
        return animalMapper.updAnimal(animal)!=0;
    }
}
