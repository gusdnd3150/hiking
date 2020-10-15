package project.user.dao;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.apache.commons.io.FileUtils;
import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import project.user.dto.LoginDTO;
import project.user.vo.UserVO;

@Repository("userDAO")
public class UserDAOImpl implements UserDAO{
	
	public static final Logger logger = LoggerFactory.getLogger(UserDAOImpl.class);
	public static final String GET_BY_SNS = "userMapper.getBySns";
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public void insertUser(UserVO userVO) throws Exception{
		sqlSession.insert("userMapper.insertUser", userVO);
		sqlSession.insert("userMapper.insertUser3", userVO);
		sqlSession.insert("userMapper.insertUser5", userVO);
	}
	
	@Override
	public void insertUser2(Map<String, Object> snsUser) throws IOException {
		sqlSession.insert("userMapper.insertUser2", snsUser);
		sqlSession.insert("userMapper.insertUser4", snsUser);
		sqlSession.insert("userMapper.insertUser6", snsUser);
	}

	@Override
	public int idCheck(String id) throws Exception{
		System.out.println("다오아이디체크: "+id);
		int rst = sqlSession.selectOne("userMapper.idCheck", id);
	System.out.println("DAO : "+ rst);
		return rst;
	}
	
	@Override
	public int emailCheck(String email) throws Exception{
		System.out.println("다오email체크: "+email);
		int rst = sqlSession.selectOne("userMapper.emailCheck", email);
	System.out.println("DAO : "+ rst);
		return rst;
	}
	
	@Override
	public int nickNameCheck(String nickName) throws Exception{
		System.out.println("다오nickName체크: "+nickName);
		int rst = sqlSession.selectOne("userMapper.nickNameCheck", nickName);
	System.out.println("DAO : "+ rst);
		return rst;
	}
	
	@Override
	public int idEmailCheck(Map<String, Object> map) throws Exception {
		System.out.println("다오idEmailCheck: "+ map);
		int rst = sqlSession.selectOne("userMapper.searchIdEmail", map);
	System.out.println("DAO : "+ rst);
		return rst;
	}
	
	@Override
	public UserVO logIn(LoginDTO loginDTO) throws Exception {
		System.out.println("유저다오왔다감");
		return sqlSession.selectOne("userMapper.logIn", loginDTO);
	}

	@Override
	public void keepLogIn(String id, String sessionId, Date sessionLimit) throws Exception {
		Map<String, Object> paramMap = new HashMap<>();
		logger.info("------keepLogInDAO------");
		System.out.println(sessionId);
		System.out.println(id);
		paramMap.put("id", id);
		paramMap.put("sessionId", sessionId);
		paramMap.put("sessionLimit", sessionLimit);
		sqlSession.update("userMapper.keepLogin", paramMap);
	}
	
	@Override
	public UserVO checkUserWithSessionKey(String value) throws Exception {
		logger.info("------checkUserWithSessionKeyDAO------");
		return sqlSession.selectOne("userMapper.checkUserWithSessionKey", value);
	}

	@Override
	public UserVO getBySns(Map<String, Object> snsUser) {
//		if(StringUtils.isNotEmpty(snsUser.getId())) {
			return sqlSession.selectOne(GET_BY_SNS, snsUser);
//		} 
//		else (StringUtils.isNotEmpty(snsUser.getId()) {
//			return sqlSession.selectOne(GET_BY_SNS_GOOGLE, snsUser.getId());
//		}
	}

	@Override
	public void removeSessionId(String sessionId) {
		sqlSession.update("userMapper.removeSessionId", sessionId);
		
	}

	@Override
	public void updateAuthKey(Map<String, String> map) {
		sqlSession.update("userMapper.updateAuthKey", map);	
	}

	@Override
	public void updateAuthStatus(Map<String, String> map) {
		sqlSession.update("userMapper.updateAuthStatus", map);
		System.out.println(map);
		System.out.println("아우스 키 업뎃!! 했어?????? 여기 ");
	}

	@Override
	public void withdrawal(UserVO userVO) {
		sqlSession.update("userMapper.withdrawal", userVO);
		
	}

	@Override
	public String searchId(String email) {
		return sqlSession.selectOne("userMapper.searchId", email);
		}

	@Override
	public int selectUserNum(String id) {
		return sqlSession.selectOne("userMapper.selectUserNum", id);
	}


}
