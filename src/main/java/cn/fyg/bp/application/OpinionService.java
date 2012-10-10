package cn.fyg.bp.application;

import java.util.List;

import cn.fyg.bp.domain.model.opinion.Opinion;

public interface OpinionService {
	
	Opinion append(Opinion opinion);
	
	List<Opinion> allOpinion(String businessCode,Long businessId);
	
	void clear(String businessCode,Long businessId);
}
