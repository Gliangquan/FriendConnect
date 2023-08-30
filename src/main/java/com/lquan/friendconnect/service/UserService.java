package com.lquan.friendconnect.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.lquan.friendconnect.model.domain.Users;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * @author liangquan
 * @description 针对表【user(用户)】的数据库操作Service
 * @createDate 2023-08-30 14:11:17
 */
public interface UserService extends IService<Users> {

    /**
     * 用户注册
     * @param userAccount   用户账户
     * @param userPassword  用户密码
     * @param checkPassword 校验密码
     * @return 新用户 id
     */
    long userRegister(String userAccount, String userPassword, String checkPassword);

    /**
     * 用户登录
     * @param userAccount  用户账户
     * @param userPassword 用户密码
     * @param request
     * @return 脱敏后的用户信息
     */
    Users userLogin(String userAccount, String userPassword, HttpServletRequest request);

    /**
     * 用户脱敏
     * @param originUser
     * @return
     */
    Users getSafetyUser(Users originUser);

    /**
     * 用户注销
     * @param request
     * @return
     */
    int userLogout(HttpServletRequest request);

    /**
     * 通过标签搜索
     * @param tagNameList
     * @return
     */
    List<Users> searchUsersByTags(List<String> tagNameList);


    /**
     * 是否为管理员
     * @param request
     * @return
     */
    boolean isAdmin(HttpServletRequest request);

    boolean isAdmin(Users loginUser);


}
