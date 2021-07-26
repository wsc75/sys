package com.yuntu.service.Kind;

import com.yuntu.mapper.Kind.KindMapper;
import com.yuntu.pojo.Kind;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class KindServiceImpl implements KindService{
    @Resource
    private KindMapper kindMapper;

    @Override
    public List<Kind> getAll() {
        return kindMapper.getAll();
    }
}
