/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package session;

import cart.ShoppingCart;
import cart.ShoppingCartItem;
import entity.Cartdetails;
import entity.Orders;
import java.util.Date;
import java.util.List;
import java.util.Random;
import javax.ejb.EJB;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author harry
 */
@Stateless
public class OrdersFacade extends AbstractFacade<Orders> implements OrdersFacadeLocal {

    @PersistenceContext(unitName = "ShoppingApplication-ejbPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }
    @EJB
    CartdetailsFacadeLocal cartDetailsFacade;

    @EJB
    OrdersFacadeLocal ordersFacade;

    public OrdersFacade() {
        super(Orders.class);
    }

    @Override
    public void saveOrder(ShoppingCart cart) {
        Random random = new Random();
        int cref = random.nextInt(999999);

        List<ShoppingCartItem> items = cart.getItems();
        for (ShoppingCartItem item : items) {
            Cartdetails cartDetails = new Cartdetails();
            int cid = cartDetailsFacade.count();
            if (cid != 0) {
                cartDetails.setCid(cid+1);
            } else {
                cartDetails.setCid(1);
            }
            cartDetails.setCref(cref);
            cartDetails.setPid(item.getProduct());
            cartDetails.setQuantity(item.getQuantity());
            em.persist(cartDetails);
        }
        Orders order = new Orders();
        order.setCref(cref);
        order.setOrderdate(new Date());
        int oid = ordersFacade.count();
        if (oid != 0) {
            order.setOrderid(oid+1);
        } else {
            order.setOrderid(1);
        }
        order.setTotal(cart.getSubtotal());
        em.persist(order);

    }

}
