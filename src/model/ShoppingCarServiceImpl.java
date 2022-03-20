package model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import model.MemberDAO;
import model.ShoppingCarDAOImpl;
import model.ShoppingCar;
@Service
public class ShoppingCarServiceImpl {
//	@Autowired
	private ShoppingCarDAOImpl scDao;
	
	@Autowired
	public ShoppingCarServiceImpl(ShoppingCarDAOImpl scDao) {
		this.scDao = scDao;
	}
	
	
	public ShoppingCar getShoppingCar(int sc_userid, int sc_productId) {
		return scDao.getShoppingCar(sc_userid, sc_productId);
	}
	
//	@Override
//	public ShoppingCar getShoppingCar(int sc_productId) {
//		return scDao.getShoppingCar(sc_productId);
//	}

	
	public void addShoppingCar(ShoppingCar shoppingCar) {
		scDao.addShoppingCar(shoppingCar);

	}

	
	public boolean deleteShoppingCar(int sc_userid, int sc_productId) {
		return scDao.deleteShoppingCar(sc_userid, sc_productId);
	}

	
	public boolean updateShoppingCar(ShoppingCar shoppingCar) {
		return scDao.updateShoppingCar(shoppingCar);
	}

	
	public List<ShoppingCar> getShoppingCars(int sc_userid) {
		return scDao.getShoppingCars(sc_userid);
	}

	
	public boolean deleteShoppingCarByUser(int sc_userid) {
		return scDao.deleteShoppingCarByUser(sc_userid);
	}

	
	public boolean deleteShoppingCarByProduct(int sc_productId) {
		return scDao.deleteShoppingCarByProduct(sc_productId);
	}

}
