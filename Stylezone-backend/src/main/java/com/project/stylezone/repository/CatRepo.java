package com.project.stylezone.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import com.project.stylezone.models.Category;

public interface CatRepo extends CrudRepository<Category, Integer>{

	Category findByCatName(String category);
	
	@Query("select cat from Category cat order by catId desc")
	List<Category> findAllCatByLatestCreatedDate();

	Category findByCatId(int catId);
}
