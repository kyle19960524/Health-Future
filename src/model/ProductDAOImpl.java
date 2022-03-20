package model;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.query.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import model.Product;

@Repository
public class ProductDAOImpl {
//	@Resource
	private SessionFactory sessionFactory;
	
	@Autowired
	public ProductDAOImpl(@Qualifier("sessionFactory") SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	
	public Product getProduct(int p_id) {
		String hql = "From Product where p_id= :p_id";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setParameter("p_id",p_id);
		return (Product) query.uniqueResult();
	}

	
	public Product getProduct(String p_name) {
		String hql = "from Product where p_name= :p_name";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setParameter("p_name", p_name);
		return (Product) query.uniqueResult();
	}

	
	public void addProduct(Product product) {
		sessionFactory.getCurrentSession().save(product);
	}

	
	public boolean deleteProduct(int p_id) {
		String hql = "delete Product where p_id= :p_id";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setParameter("p_id", p_id);
		return query.executeUpdate() > 0;
	}

	
	public boolean updateProduct(Product product) {
		String hql = "update Product set p_name= :p_name,p_description= :p_description,p_keyWord= :p_keyWord,p_price= :p_price,p_counts= :p_counts,p_type= :p_type where p_id= :p_id";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        query.setParameter("p_name",product.getP_name());
        query.setParameter("p_description",product.getP_description());
        query.setParameter("p_keyWord",product.getP_keyWord());
        query.setParameter("p_price",product.getP_price());
        query.setParameter("p_counts",product.getP_counts());
        query.setParameter("p_type",product.getP_type());
        query.setParameter("p_id",product.getP_id());
        return query.executeUpdate() > 0;
	}

	
	public List<Product> getProductsByKeyWord(String searchKeyWord) {
		String queryKeyWord = "%";
        for(int i=0;i<searchKeyWord.length();i++){
            queryKeyWord += String.valueOf(searchKeyWord.charAt(i)) +"%";
        }
        System.out.println("我搜索了"+queryKeyWord);
        String hql = "from Product where p_name like :p_name or p_keyword like :p_keyword";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        query.setParameter("p_name",queryKeyWord);
        query.setParameter("p_keyword",queryKeyWord);
        return query.list();
	}

	
	public List<Product> getProductsByType(int p_type) {
		String hql = "from Product where p_type=:p_type";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        query.setParameter("p_type",p_type);
        return query.list();
	}

	
	public List<Product> getAllProduct() {
		String hql = "from Product";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        return query.list();
	}

}
