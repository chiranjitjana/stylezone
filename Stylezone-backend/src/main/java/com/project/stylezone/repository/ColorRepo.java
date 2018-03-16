package com.project.stylezone.repository;


import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;


import com.project.stylezone.models.Color;

public interface ColorRepo extends CrudRepository<Color, Integer>{
	
	@Query("select color from Color color order by colorId desc")
	List<Color> findAllColorByLatestCreatedDate();

	Color findByColorCode(String colorCode);
	Color findByColorName(String colorName);
	
	Color findByColorId(int colorId);
}
