package model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import model.MemberDAO;
import model.ProductEvaluationDAOImpl;
import model.ProductEvaluation;
@Service
public class ProductEvaluationServiceImpl {
//	@Autowired
	private ProductEvaluationDAOImpl peDao;
	
	@Autowired
	public ProductEvaluationServiceImpl(ProductEvaluationDAOImpl peDao) {
		this.peDao = peDao;
	}
	
	
	public ProductEvaluation getProductEvaluation(int pe_userid, int pe_productId, String pe_time) {
		return peDao.getProductEvaluation(pe_userid, pe_productId, pe_time);
	}

	
	public void addProductEvaluation(ProductEvaluation productevaluation) {
		peDao.addProductEvaluation(productevaluation);

	}

	
	public boolean deleteProductEvaluation(int pe_userid, int pe_productId, String pe_time) {
		return peDao.deleteProductEvaluation(pe_userid, pe_productId, pe_time);
	}

	
	public boolean updateProductEvaluation(ProductEvaluation productevaluation) {
		return peDao.updateProductEvaluation(productevaluation);
	}

	
	public List<ProductEvaluation> getListProductEvaluation(int pe_productId) {
		return peDao.getListProductEvaluation(pe_productId);
	}

	
	public boolean deleteProductEvaluationByUser(int pe_userid) {
		return peDao.deleteProductEvaluationByUser(pe_userid);
	}

	
	public boolean deleteProductEvaluationByProduct(int pe_productId) {
		return peDao.deleteProductEvaluationByProduct(pe_productId);
	}

}
