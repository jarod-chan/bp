package cn.fyg.bp.domain.shared.state;

public interface StateEnum<T> {

	void next(T t) throws StateChangeException;
	
	void back(T t) throws StateChangeException;
}
