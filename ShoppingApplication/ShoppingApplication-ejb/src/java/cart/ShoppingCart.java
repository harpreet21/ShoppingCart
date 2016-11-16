/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cart;

import entity.Product;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Objects;

/**
 *
 * @author harry
 */
public class ShoppingCart {

    List<ShoppingCartItem> items;
    int numberOfItems;
    double total;

    public ShoppingCart() {
        items = new ArrayList<>();
        numberOfItems = 0;
        total = 0;
    }

    // return list of items in shoppingCart
    public synchronized List<ShoppingCartItem> getItems() {
        return items;
    }

    //add item to shoppingCart
    public synchronized void addItem(Product product, int quantity) {

        boolean newItem = true;

        for (ShoppingCartItem scItem : items) {

            if (Objects.equals(scItem.getProduct().getPid(), product.getPid())) {
                newItem = false;
                scItem.setQuantity(scItem.getQuantity() + quantity);
            }
        }

        if (newItem) {
            ShoppingCartItem scItem = new ShoppingCartItem(product);
            scItem.setQuantity(quantity);
            items.add(scItem);
        }
    }

    //update shoppingCart
    public synchronized void update(Product product, int quantity) {

        if (quantity >= 0) {
            for (ShoppingCartItem scItem : items) {
                if (Objects.equals(scItem.getProduct().getPid(), product.getPid())) {
                    scItem.setQuantity(quantity);
                }
            }
        }
    }
    
     //remove shoppingCart
    public void remove(Product product) {

        if (product!=null) {
            for (Iterator<ShoppingCartItem> it = items.iterator(); it.hasNext();) {
            ShoppingCartItem item = it.next();
            
            if (Objects.equals(item.getProduct().getPid(), product.getPid())) {
                    it.remove();
                }
            }
        }
    }

    // count numberOfItems
    public synchronized int getNumberOfItems() {

        numberOfItems = 0;

        for (ShoppingCartItem scItem : items) {

            numberOfItems += scItem.getQuantity();
        }

        return numberOfItems;
    }

    // calculate subTotal
    public synchronized double getSubtotal() {

        double amount = 0;

        for (ShoppingCartItem scItem : items) {

            Product product = (Product) scItem.getProduct();
            amount += (scItem.getQuantity() * product.getPrice());
        }

        return amount;
    }

    // calculate Total
    public synchronized void calculateTotal(String surcharge) {

        double amount = 0;

        // cast surcharge as double
        double s = Double.parseDouble(surcharge);

        amount = this.getSubtotal();
        amount += s;

        total = amount;
    }

    // Return Total 
    public synchronized double getTotal() {
        return total;
    }

    // clear Cart 
    public synchronized void clear() {
        items.clear();
        numberOfItems = 0;
        total = 0;
    }

}
