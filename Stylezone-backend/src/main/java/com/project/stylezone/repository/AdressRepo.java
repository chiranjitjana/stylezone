package com.project.stylezone.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.project.stylezone.models.Address;

public interface AdressRepo extends CrudRepository<Address, Integer>{

	List<Address> findByUserId(Integer userId);
}
