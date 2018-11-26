import com.baizhi.ddm.dao.ProductDao;
import com.baizhi.ddm.dao.UserDao;
import com.baizhi.ddm.ddmApplication;
import com.baizhi.ddm.entity.User;
import com.baizhi.ddm.service.ProductService;
import com.baizhi.ddm.service.UserService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(value = SpringJUnit4ClassRunner.class)
@SpringBootTest(classes = ddmApplication.class)
public class UserTest123 {
    @Autowired
    private UserDao userDao;
    @Autowired
    private UserService userService;
    @Autowired
    private ProductService productService;
    @Autowired
    private ProductDao productDao;

    @Test
    public void m1() {
        User user = userService.login("xiaohei@qq.com", "123456");
        System.out.println("user = " + user);
        System.out.println("user = " + user);
    }

    @Test
    public void m2() {
        System.out.println(productService.getAllProduct(1, 5));
        int a = productDao.getCount();
        System.out.println("a = " + a);
    }

    @Test
    public void m3() {

    }
}
