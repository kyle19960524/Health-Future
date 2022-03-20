package controller;

import com.alibaba.fastjson.JSONArray;
import model.ShoppingCar;
import model.ProductServiceImpl;
import model.ShoppingCarServiceImpl;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 *      對應product_detail
 */
@Controller
public class ShoppingCarController {
    @Resource
    private ProductServiceImpl productService;
    @Resource
    private ShoppingCarServiceImpl shoppingCarService;

    @RequestMapping(value = "/shopping_car")
    public String shopping_car(){
        return "shopping_car";
    }

    @RequestMapping(value = "/addShoppingCar",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> addShoppingCar(Integer sc_userid,Integer sc_productId,Integer sc_counts){
        System.out.println("數量為"+sc_counts);
        System.out.println("使用者ID:"+sc_userid);
        System.out.println("產品為"+sc_productId);
        ShoppingCar shoppingCar = shoppingCarService.getShoppingCar(sc_userid,sc_productId);
        System.out.println("-----" + shoppingCar);

        if(shoppingCar == null){
            ShoppingCar shoppingCar1 = new ShoppingCar();
            shoppingCar1.setSc_userid(sc_userid);
            shoppingCar1.setSc_productId(sc_productId);
            shoppingCar1.setSc_counts(sc_counts);
            shoppingCar1.setSc_productPrice(productService.getProduct(sc_productId).getP_price()*sc_counts);
            shoppingCarService.addShoppingCar(shoppingCar1);
        }
        else{
            shoppingCar.setSc_counts(shoppingCar.getSc_counts()+sc_counts);
            shoppingCar.setSc_productPrice(productService.getProduct(sc_productId).getP_price()*shoppingCar.getSc_counts());
            shoppingCarService.updateShoppingCar(shoppingCar);
        }
        Map<String, Object> resultMap = new HashMap<String,Object>();
        resultMap.put("result","success");
        System.out.println("回傳成功");
        return resultMap;
    }

    @RequestMapping(value = "/getShoppingCars",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> getShoppingCars(int sc_userid){
        List<ShoppingCar> shoppingCarList = shoppingCarService.getShoppingCars(sc_userid);
//        System.out.println(shoppingCarList);
        String shoppingCars = JSONArray.toJSONString(shoppingCarList);
        Map<String,Object> resultMap = new HashMap<String,Object>();
//        System.out.println(resultMap);
        resultMap.put("result",shoppingCars);
        System.out.println("~~~~~" + resultMap + "");
        return resultMap;
    }

    @RequestMapping(value = "/deleteShoppingCar",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> deleteShoppingCar(int sc_userid,int sc_productId){
        shoppingCarService.deleteShoppingCar(sc_userid,sc_productId);
        Map<String, Object> resultMap = new HashMap<String,Object>();
        resultMap.put("result","success");
        System.out.println("我返回了");
        return resultMap;
    }
    
//    @RequestMapping(value = "/addShoppingCar2",method = RequestMethod.POST)
//    @ResponseBody
//    public Map<String,Object> addShoppingCar2(Integer sc_userid,Integer sc_productId,Integer sc_counts){
////        System.out.println("數量為"+sc_counts);
////        System.out.println("使用者ID:"+sc_userid);
////        System.out.println("產品為"+sc_productId);
//        sc_productId = 100;
//        sc_counts = 1;
//        sc_userid = 1;
//        System.out.println("數量為"+sc_counts);
//        System.out.println("使用者ID:"+sc_userid);
//        System.out.println("產品為"+sc_productId);
//        ShoppingCar shoppingCar = shoppingCarService.getShoppingCar(sc_userid,sc_productId);
//        System.out.println("-----" + shoppingCar);
//
//        if(shoppingCar == null){
//            ShoppingCar shoppingCar1 = new ShoppingCar();
//            shoppingCar1.setSc_userid(sc_userid);
//            shoppingCar1.setSc_productId(sc_productId);
//            shoppingCar1.setSc_counts(sc_counts);
//            shoppingCar1.setSc_productPrice(productService.getProduct(sc_productId).getP_price()*sc_counts);
//            shoppingCarService.addShoppingCar(shoppingCar1);
//        }
//        else{
//            shoppingCar.setSc_counts(shoppingCar.getSc_counts()+sc_counts);
//            shoppingCar.setSc_productPrice(productService.getProduct(sc_productId).getP_price()*shoppingCar.getSc_counts());
//            shoppingCarService.updateShoppingCar(shoppingCar);
//        }
//        Map<String, Object> resultMap = new HashMap<String,Object>();
//        resultMap.put("result","success");
//        System.out.println("回傳成功");
//        return resultMap;
//    }
}
