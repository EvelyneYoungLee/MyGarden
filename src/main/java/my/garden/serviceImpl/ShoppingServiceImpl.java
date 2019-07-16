package my.garden.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import my.garden.dao.ShoppingDAO;
import my.garden.dto.CartDTO;
import my.garden.dto.MembersDTO;
import my.garden.dto.ShopListDTO;
import my.garden.service.ShoppingService;

@Component
public class ShoppingServiceImpl implements ShoppingService{

	@Autowired
	ShoppingDAO dao;

	public List<CartDTO> getCartList(String userId) throws Exception{
		return dao.selectCartList(userId);
	}

	@Transactional
	public int delFromCart(String userId, CartDTO dto) throws Exception {
		dto.setC_m_email(userId);
		dao.delExpiredCart();
		return dao.delFromCart(dto);
	}

	public MembersDTO getMember(MembersDTO dto, String id) throws Exception{
		return dao.selectMember(dto, id);
	}

	@Transactional
	public void insertIntoShopList(List<ShopListDTO> list) throws Exception {
		Long time = System.currentTimeMillis();
		for(ShopListDTO dto : list) {
			dto.setS_orderno(time);
			if(dto.getS_m_memo()=="") {
				dto.setS_m_memo("요청사항 없음");
			}
			dao.insertIntoShopList(dto);
		}	
	}

	
	
}