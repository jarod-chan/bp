package cn.fyg.bp.interfaces.web.shared.session;

import cn.fyg.module.user.User;

public interface SessionUtil {

	void setValue(String key, Object value);

	<T> T getValue(String key);

	void invalidate();

	User getUser();
}