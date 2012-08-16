package cn.fyg.bp.application;

import cn.fyg.bp.domain.model.contract.Contract;

public interface ContractService {
	
	Contract find(Long id);

	Contract save(Contract contract);

}
