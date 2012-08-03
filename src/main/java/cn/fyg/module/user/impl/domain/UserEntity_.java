package cn.fyg.module.user.impl.domain;

import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value = "org.hibernate.jpamodelgen.JPAMetaModelEntityProcessor")
@StaticMetamodel(UserEntity.class)
public abstract class UserEntity_ {

	public static volatile SingularAttribute<UserEntity, Long> id;
	public static volatile SingularAttribute<UserEntity, Boolean> enabled;
	public static volatile SingularAttribute<UserEntity, String> username;
	public static volatile SingularAttribute<UserEntity, String> email;
	public static volatile SingularAttribute<UserEntity, String> cellphone;
	public static volatile SingularAttribute<UserEntity, String> realname;
	public static volatile SingularAttribute<UserEntity, String> password;

}

