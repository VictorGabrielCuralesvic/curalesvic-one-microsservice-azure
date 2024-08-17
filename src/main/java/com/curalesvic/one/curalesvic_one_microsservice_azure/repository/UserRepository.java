package com.curalesvic.one.curalesvic_one_microsservice_azure.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.curalesvic.one.curalesvic_one_microsservice_azure.model.UserModel;

@Repository

public interface UserRepository extends CrudRepository<UserModel, Long> {

}
