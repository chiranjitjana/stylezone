package com.project.stylezone.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;


import com.project.stylezone.models.Occasion;

public interface OccasionRepo extends CrudRepository<Occasion, Integer>{

	@Query("select occasion from Occasion occasion order by occasionId desc")
	List<Occasion> findAllOccasionByLatestCreatedDate();
	Occasion findByOccasionName(String colorCode);
	Occasion findByOccasionId(int colorId);
	
}
