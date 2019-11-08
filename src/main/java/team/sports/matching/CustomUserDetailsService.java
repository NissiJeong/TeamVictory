package team.sports.matching;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import team.sports.matching.service.MemberDAO;
import team.sports.matching.service.MemberDTO;

//@Service
public class CustomUserDetailsService implements UserDetailsService{
	
	
	//@Autowired
	SqlSessionTemplate sqlsession;
	
	//public void setSqlsession(SqlSessionTemplate sqlsession) {
	//	this.sqlsession = sqlsession;
	//}
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		System.out.println("12312312312");
		MemberDAO dao = sqlsession.getMapper(MemberDAO.class);
		MemberDTO dto = dao.findByStringId(username);
		if(dto == null) throw new UsernameNotFoundException(username);
		CustomUserDetails user = new CustomUserDetails();
		user.setBirth(dto.getBirth());
		user.setEmail(dto.getEmail());
		user.setGender(dto.getGender());
		user.setID(dto.getID());
		user.setLocation(dto.getLocation());
		user.setName(dto.getName());
		user.setPhone(dto.getPhone());
		user.setPoint(dto.getPoint());
		user.setPWD(dto.getPWD());
		user.setRegidate(dto.getRegidate());
		user.setEnabled(true);
		return user;
	}

}
