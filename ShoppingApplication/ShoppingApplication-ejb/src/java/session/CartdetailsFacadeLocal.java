/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package session;

import entity.Cartdetails;
import java.util.List;
import javax.ejb.Local;

/**
 *
 * @author harry
 */
@Local
public interface CartdetailsFacadeLocal {

    void create(Cartdetails cartdetails);

    void edit(Cartdetails cartdetails);

    void remove(Cartdetails cartdetails);

    Cartdetails find(Object id);

    List<Cartdetails> findAll();

    List<Cartdetails> findRange(int[] range);

    int count();
    
}
