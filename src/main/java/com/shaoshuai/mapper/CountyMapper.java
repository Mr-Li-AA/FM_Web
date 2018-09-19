package com.shaoshuai.mapper;

import com.shaoshuai.domain.County;

import java.util.List;

public interface CountyMapper {
    List<County> queryByCityId(int cid);
}
