package com.shaoshuai.mapper;

import com.shaoshuai.domain.City;

import java.util.List;

public interface CityMapper {
    List<City> queryByPid(int pid);
}
