package controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;

import model.Product;
import model.Users;
import model.UsersService;
import model.ProductServiceImpl;
import util.Response;

@Controller
public class ProductController {
	@Resource
	private ProductServiceImpl productService;

	@RequestMapping(value = "/getAllProducts")
    @ResponseBody
    public Map<String,Object> getAllProducts(){
        List<Product> productList = new ArrayList<>();
        productList = productService.getAllProduct();
        String allProducts = JSONArray.toJSONString(productList);
        Map<String,Object> resultMap = new HashMap<String,Object>();
        resultMap.put("allProducts",allProducts);
        System.out.println("----------------");
        System.out.println(resultMap);
        System.out.println("----------------");
        return resultMap;
    }
	
//	@RequestMapping(value = "/deleteProduct", method = RequestMethod.POST)
//    @ResponseBody
//    public Response deleteProduct(int p_id) {
//        return productService.deleteProduct(p_id);
//    }

    @RequestMapping(value = "/addProduct", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> addProduct(String p_name,String p_description,String p_keyWord,int p_price,int p_counts,int p_type) {
        System.out.println("添加了商品："+ p_name);
        String result ="fail";
        Product product = new Product();
        product.setP_name(p_name);
        product.setP_description(p_description);
        product.setP_keyWord(p_keyWord);
        product.setP_price(p_price);
        product.setP_counts(p_counts);
        product.setP_type(p_type);
        productService.addProduct(product);
        result = "success";
        Map<String,Object> resultMap = new HashMap<String,Object>();
        resultMap.put("result",result);
        return resultMap;
    }

    @RequestMapping(value = "/productDetail", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> productDetail(int p_id, HttpSession httpSession) {
    	System.out.println("I am here!"+p_id);
        Product product = productService.getProduct(p_id);
//        System.out.println("I am here!"+p_id);
        httpSession.setAttribute("productDetail",product);
        System.out.println("I am here"+product.getP_name());
        Map<String,Object> resultMap = new HashMap<String,Object>();
        resultMap.put("result","success");
        return resultMap;
    }

    @RequestMapping(value = "/product_detail")
    public String product_detail() {
        return "productdetail";
    }
    
    @RequestMapping(value = "/getProductById", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> getProductById(Integer p_id) {
    	System.out.println("=====getProductById:" + p_id);
    	Product product = productService.getProduct(p_id);
        
        String result = JSON.toJSONString(product);
//        System.out.println("=====" + result);
        Map<String,Object> resultMap = new HashMap<String,Object>();
        resultMap.put("result",result);
        System.out.println("=====productidResultMap" + resultMap);
        return resultMap;
    }
}
