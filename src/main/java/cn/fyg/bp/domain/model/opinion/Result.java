package cn.fyg.bp.domain.model.opinion;

import cn.fyg.bp.domain.model.shared.CommonEnum;

public enum Result implements CommonEnum {
	agree("同意",true),
	disagree("不同意",false);

	private String name;
	
	private boolean val;//布尔值，表示是否审核是否通过，用来控制流程分支
	
	private Result(String name,boolean val){
		this.name=name;
		this.val=val;
	}
	
	@Override
	public String getName() {
		return this.name;
	}

	@Override
	public void setName(String name) {
		this.name=name;
	}

	public boolean isVal() {
		return val;
	}

	public void setVal(boolean val) {
		this.val = val;
	}
	
}
