package model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import model.MemberDAO;
import model.ProductDAOImpl;
import model.ProductEvaluationDAOImpl;
import model.ShoppingCarDAOImpl;
import model.ShoppingRecordDAOImpl;
import model.Product;
@Service
public class ProductServiceImpl{
//	@Autowired
	private ProductDAOImpl pDao;
//	@Autowired
//	private ShoppingRecordDAO srDao;
//	@Autowired
//	private ShoppingCarDAO scDao;
//	@Autowired
//	private ProductEvaluationDAO peDao;
	
	@Autowired
	public ProductServiceImpl(ProductDAOImpl pDao) {
		this.pDao = pDao;
	}
	
	
	
	
	public Product getProduct(int p_id) {
		return pDao.getProduct(p_id);
	}

	
	public Product getProduct(String p_name) {
		return pDao.getProduct(p_name);
	}

	
	public void addProduct(Product p_product){
		pDao.addProduct(p_product);
	}

	
	public boolean deleteProduct(int p_id) {
		return pDao.deleteProduct(p_id);
	}

	
	public boolean updateProduct(Product product) {
		return pDao.updateProduct(product);
	}

	
	public List<Product> getProductsByKeyWord(String searchKeyWord) {
		return pDao.getProductsByKeyWord(searchKeyWord);
	}

	
	public List<Product> getProductsByType(int p_type) {
		return pDao.getProductsByType(p_type);
	}

	
	public List<Product> getAllProduct() {
		return pDao.getAllProduct();
	}

}
