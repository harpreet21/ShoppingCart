/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package session;

import entity.Cartdetails;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author harry
 */
@Stateless
public class CartdetailsFacade extends AbstractFacade<Cartdetails> implements CartdetailsFacadeLocal {
    @PersistenceContext(unitName = "ShoppingApplication-ejbPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public CartdetailsFacade() {
        super(Cartdetails.class);
    }
    
}
