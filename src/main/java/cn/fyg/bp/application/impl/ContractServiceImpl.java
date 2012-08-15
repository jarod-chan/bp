package cn.fyg.bp.application.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.fyg.bp.application.ContractService;
import cn.fyg.bp.domain.model.contract.Contract;
import cn.fyg.bp.domain.model.contract.ContractRepository;

@Service
public class ContractServiceImpl implements ContractService {
	
	@Autowired
	ContractRepository contractRepository;

	@Override
	public Contract find(Long id) {
		return contractRepository.findOne(id);
	}

	@Override
	@Transactional
	public Contract save(Contract contract) {
		return contractRepository.save(contract);
	}

}
